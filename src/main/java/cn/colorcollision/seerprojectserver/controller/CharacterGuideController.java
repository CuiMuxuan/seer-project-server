package cn.colorcollision.seerprojectserver.controller;

import cn.colorcollision.seerprojectserver.POJO.DO.CharacterScheme;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterGuideDTO;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterSchemeDTO;
import cn.colorcollision.seerprojectserver.POJO.VO.CharacterGuideVO;
import cn.colorcollision.seerprojectserver.service.CharacterSchemeService;
import cn.colorcollision.seerprojectserver.util.PropertyUtil;
import com.alibaba.fastjson.JSON;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryCondition;
import com.mybatisflex.core.query.QueryWrapper;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import cn.colorcollision.seerprojectserver.service.CharacterGuideService;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterGuide;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import cn.colorcollision.seerprojectserver.custom.ResultVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;

import static cn.colorcollision.seerprojectserver.custom.Constant.AUTH;

/**
 * 控制层。
 *
 * @author Cui Muxuan
 * @since 1.0
 */
@Slf4j
@RestController
@RequestMapping("/characterGuide")
@Tag(name = "角色攻略控制器")
public class CharacterGuideController {

    @Resource
    private CharacterGuideService characterGuideService;
    @Resource
    private CharacterSchemeService characterSchemeService;

    /**
     * 添加
     *
     * @param characterGuide
     * @return {@code true} 添加成功，{@code false} 添加失败
     */
    @PostMapping("/save")
    @Operation(summary = "添加")
    @Parameters(value = {
            @Parameter(name = "auth", description = "验证口令", required = true)
    })
    @CacheEvict(cacheNames = {"getGuide","getSchemeList","getExist"}, allEntries = true)
    public ResultVO<?> save(@RequestParam String auth,@RequestBody CharacterGuideVO characterGuide) {
        if (!Objects.equals(auth, AUTH)) {
            return ResultVO.fail("认证失败");
        }
        log.warn(characterGuide.getCharacterGuideDTO().toString());
        CharacterGuide guide = characterGuide.getCharacterGuideDTO();
        log.warn(guide.toString());
        List<CharacterScheme> schemeList = characterGuide.getCharacterSchemeDTOList();
        Date date = new Date();
        guide.setCreateTime(date);
        guide.setUpdateTime(date);
        for (CharacterScheme characterScheme : schemeList) {
            characterScheme.setCreateTime(date);
            characterScheme.setUpdateTime(date);
            characterScheme.setCharacterId(guide.getId());
        }
        return ResultVO.success(characterGuideService.save(guide) && characterSchemeService.saveBatch(schemeList));
    }

    /**
     * 根据主键更新
     *
     * @param characterGuide
     * @return {@code true} 更新成功，{@code false} 更新失败
     */
    @PutMapping("/update")
    @Operation(summary = "根据主键更新")
    @Parameters(value = {
            @Parameter(name = "auth", description = "验证口令", required = true)
    })
    @CacheEvict(cacheNames = {"getGuide","getSchemeList","getExist"}, allEntries = true)
    public ResultVO<Boolean> update(@RequestParam String auth, @RequestBody CharacterGuideVO characterGuide) {
        if (!Objects.equals(auth, AUTH)) {
            return ResultVO.fail("认证失败");
        }
        CharacterGuide guide = characterGuide.getCharacterGuideDTO();
        List<CharacterScheme> schemeList = characterGuide.getCharacterSchemeDTOList();
        Date date = new Date();
        guide.setUpdateTime(date);
        for (CharacterScheme characterScheme : schemeList) {
            if (characterScheme.getCreateTime()==null){
                characterScheme.setCreateTime(date);
            }
            characterScheme.setUpdateTime(date);
            characterScheme.setCharacterId(guide.getId());
            characterSchemeService.saveOrUpdate(characterScheme);
        }
        return ResultVO.success(characterGuideService.updateById(guide));
    }

    /**
     * 根据主键删除
     *
     * @param id 主键
     * @return {@code true} 删除成功，{@code false} 删除失败
     */
    @DeleteMapping("/remove/{id}")
    @Operation(summary = "根据角色id删除")
    @Parameters(value = {
            @Parameter(name = "id", description = "对应角色id", required = true)
    })
    @CacheEvict(cacheNames = {"getGuide","getSchemeList","getExist"}, allEntries = true)
    public ResultVO<Boolean> remove(@RequestParam String auth,@PathVariable Serializable id) {
        if (!Objects.equals(auth, AUTH)) {
            return ResultVO.fail("认证失败");
        }
        characterSchemeService.remove(new QueryWrapper().where("character_id=" + id));
        return ResultVO.success(characterGuideService.removeById(id));
    }


    /**
     * 获取角色攻略。
     *
     * @param id characterGuide主键
     * @return 详情
     */
    @GetMapping("/getGuide/{id}")
    @Operation(summary = "根据角色id获取攻略")
    @Parameters(value = {
            @Parameter(name = "id", description = "对应角色id", required = true)
    })
    @Cacheable(cacheNames = "getGuide", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<CharacterGuideDTO> getGuide(@PathVariable Integer id) {
        CharacterGuide characterGuide=characterGuideService.getById(id);
        return ResultVO.success(PropertyUtil.doToDto(characterGuide, CharacterGuideDTO.class));
    }
    /**
     * 获取角色全部养成方案。
     *
     * @param id characterGuide主键
     * @return 详情
     */
    @GetMapping("/getSchemeList/{id}")
    @Operation(summary = "根据角色id获取色全部养成方案")
    @Parameters(value = {
            @Parameter(name = "id", description = "对应角色id", required = true)
    })
    @Cacheable(cacheNames = "getSchemeList", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getSchemeList(@PathVariable Integer id) {
        List<CharacterScheme> characterSchemeList=characterSchemeService.list(new QueryWrapper().where("character_id=" + id));
        List<CharacterSchemeDTO> list = new java.util.ArrayList<>();
        for (CharacterScheme characterScheme : characterSchemeList) {
            list.add(new CharacterSchemeDTO(characterScheme));
        }
        return ResultVO.success(list);
    }
    /**
     * 检测角色是否存在攻略。
     *
     * @param id characterGuide主键
     * @return 详情
     */
    @GetMapping("/getExist/{id}")
    @Operation(summary = "检测角色是否存在攻略")
    @Parameters(value = {
            @Parameter(name = "id", description = "对应角色id", required = true)
    })
    @Cacheable(cacheNames = "getExist", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<Boolean> getExist(@PathVariable Integer id) {
        return ResultVO.success(!Objects.isNull(characterGuideService.getById(id)));
    }
}