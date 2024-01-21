package cn.colorcollision.seerprojectserver.controller;

import cn.colorcollision.seerprojectserver.POJO.DO.CharacterPlus;
import cn.colorcollision.seerprojectserver.POJO.DTO.SkillDTO;
import cn.colorcollision.seerprojectserver.POJO.DTO.SoulDTO;
import cn.colorcollision.seerprojectserver.POJO.DTO.SpecialStatusDTO;
import cn.colorcollision.seerprojectserver.POJO.DTO.TalentDTO;
import cn.colorcollision.seerprojectserver.POJO.VO.CharacterPlusVO;
import cn.colorcollision.seerprojectserver.POJO.entity.SoulComposition;
import cn.colorcollision.seerprojectserver.custom.ResultVO;
import cn.colorcollision.seerprojectserver.service.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;


import java.util.List;

/**
 * @author 爻
 * @date 2023/9/16
 * @design
 */
@Tag(name = "伤害计算")
@Slf4j
@RestController
@RequestMapping("/damage")
public class DamageController {
    @Resource
    BuffService buffService;
    @Resource
    CharacterService characterService;
    @Resource
    CharacterPlusService characterPlusService;
    @Resource
    SkillService skillService;
    @Resource
    SoulService soulService;
    @Resource
    TalentService talentService;
    @Resource
    SpecialStatusService specialStatusService;

    @Operation(summary = "上传角色技能")
    @PostMapping(value = "/uploadSkillByCharacterId")
    @CacheEvict(cacheNames = {"characterSkill"}, allEntries = true)
    public ResultVO<?> uploadSkillByCharacterId(@RequestBody SkillDTO skillDTO){
        return skillService.uploadSkill(skillDTO)?ResultVO.success("OK"):ResultVO.fail("Fail");
    }
    @Operation(summary = "上传角色id与属性以生成战斗拓展")
    @GetMapping("/uploadCharacter/{id}/{property}")
    @CacheEvict(cacheNames = {"characterPlus","characterIsExistPlusList"}, allEntries = true)
    public ResultVO<?> uploadCharacterPlus(@PathVariable String property, @PathVariable Integer id){
        return characterPlusService.uploadCharacterPlus(property,id)?ResultVO.success("OK"):ResultVO.fail("Fail");
    }
    @Operation(summary = "上传角色命座")
    @PostMapping("/uploadSoul")
    @CacheEvict(cacheNames = {"characterSoul"}, allEntries = true)
    public ResultVO<?> uploadSoul(@RequestBody SoulDTO soulDTO){
        log.info(soulDTO.getMap().get(5).toString());
        return soulService.uploadSoul(soulDTO)?ResultVO.success("OK"):ResultVO.fail("Fail");
    }
    @Operation(summary = "根据角色id获取角色技能")
    @GetMapping("/getSkillByCharacterId/{characterId}")
    @Cacheable(cacheNames = "characterSkill", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getSkillByCharacterId(@PathVariable Integer characterId){
        return ResultVO.success(skillService.getSkillByCharacterId(characterId));
    }
    @Operation(summary = "根据角色id获取角色命座")
    @GetMapping("/getSoulByCharacterId/{characterId}")
    @Cacheable(cacheNames = "characterSoul", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getSoulByCharacterId(@PathVariable Integer characterId){
        return ResultVO.success(soulService.getSoulByCharacterId(characterId));
    }
    @Operation(summary = "根据角色id获取角色天赋")
    @GetMapping("/getTalentByCharacterId/{characterId}")
    @Cacheable(cacheNames = "characterTalent", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getTalentByCharacterId(@PathVariable Integer characterId){
        return ResultVO.success(talentService.getTalentByCharacterId(characterId));
    }
    @Operation(summary = "根据角色id获取角色战斗拓展")
    @GetMapping("/getCharacterPlusByCharacterId/{characterId}")
    @Cacheable(cacheNames = "characterPlus", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getCharacterPlusByCharacterId(@PathVariable Integer characterId){
        CharacterPlus characterPlus=characterPlusService.getById(characterId);
        if (characterPlus==null){
            return ResultVO.success("No data found",null);
        }
        String property=characterPlus.getProperty();
        List<SkillDTO> skill=skillService.getSkillByCharacterId(characterId);
        List<SoulComposition> soul=soulService.getSoulByCharacterId(characterId);
        TalentDTO talent=talentService.getTalentByCharacterId(characterId);
        return ResultVO.success(new CharacterPlusVO(characterId,property,skill,soul,talent));
    }
    @Operation(summary = "获取存在所有战斗拓展的角色基本信息")
    @GetMapping("/getCharacterIsExistPlus")
    @Cacheable(cacheNames = "characterIsExistPlusList", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getCharacterIsExistPlus(){
        return ResultVO.success(characterService.getCharacterIsExistPlus());
    }
    @Operation(summary = "获取所有buff")
    @GetMapping("/getBuffList")
    @Cacheable(cacheNames = "buffList", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getBuffList(){
        return ResultVO.success(buffService.list());
    }
    @Operation(summary = "获取所有特殊状态")
    @GetMapping("/getSpecialStatusList")
    @Cacheable(cacheNames = "specialStatusList", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getSpecialStatusList(){
        return ResultVO.success(specialStatusService.getSpecialStatusList());
    }
    @Operation(summary = "上传特殊状态")
    @PostMapping("/uploadSpecialStatus")
    @CacheEvict(cacheNames = {"specialStatusList"}, allEntries = true)
    public ResultVO<?> uploadSpecialStatus(@RequestBody SpecialStatusDTO specialStatusDTO){
        return specialStatusService.uploadSpecialStatus(specialStatusDTO)?ResultVO.success("OK"):ResultVO.fail("Fail");
    }
}
