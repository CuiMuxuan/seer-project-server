package cn.colorcollision.seerprojectserver.controller;

import cn.colorcollision.seerprojectserver.POJO.DO.*;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterDTO;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterSoulDTO;
import cn.colorcollision.seerprojectserver.POJO.VO.CharacterVO;
import cn.colorcollision.seerprojectserver.custom.ResultVO;
import cn.colorcollision.seerprojectserver.service.*;
import cn.colorcollision.seerprojectserver.util.PropertyUtil;
import cn.colorcollision.seerprojectserver.util.TencentUtil;
import cn.xuyanwu.spring.file.storage.FileInfo;
import cn.xuyanwu.spring.file.storage.FileStorageService;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.core.util.StringUtil;
import com.tencentcloudapi.ocr.v20181119.models.TextDetection;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

import static cn.colorcollision.seerprojectserver.POJO.DO.table.CharacterBaseTableDef.CHARACTER_BASE;
import static cn.colorcollision.seerprojectserver.POJO.DO.table.CharacterMaxTableDef.CHARACTER_MAX;
import static cn.colorcollision.seerprojectserver.custom.Constant.AUTH;
import static cn.colorcollision.seerprojectserver.custom.Constant.PICTURE;

/**
 * @author 爻
 * @date 2023/8/5
 * @design
 */
@Tag(name = "角色控制器")
@Slf4j
@RestController
@RequestMapping("/character")
public class CharacterController {
    @Resource
    CharacterService characterService;
    @Resource
    CharacterSoulService characterSoulService;
    @Resource
    CharacterTalentService characterTalentService;
    @Resource
    CharacterMaxService characterMaxService;
    @Resource
    TalentMapService talentMapService;

    @Resource
    private FileStorageService fileStorageService;
    @Operation(summary = "按照页数查找角色")
    @GetMapping("/getCharacterByPage")
    @Cacheable(cacheNames = "characterPages", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getCharacterByPage(@Parameter(name = "pageNum", description = "查找页码") @RequestParam Integer pageNum,
                                          @Parameter(name = "pageSize", description = "页面大小") @RequestParam Integer pageSize) {
        return ResultVO.success(PropertyUtil.pageToPage(characterService.page(new Page<>(pageNum, pageSize)), CharacterDTO.class));
    }

    @Operation(summary = "查询全部角色的name")
    @GetMapping("/getAllName")
    @Cacheable(cacheNames = "characterName")
    public ResultVO<?> getAllName(){
        return ResultVO.success(characterService.list(new QueryWrapper().select("name")));
    }

    @Operation(summary = "根据id查找角色")
    @GetMapping("/getCharacterById/{id}")
    @Cacheable(cacheNames = "characterDetail", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getCharacterById(@Parameter(name = "id", description = "角色id") @PathVariable("id") Integer id) {
        return ResultVO.success(new CharacterVO(id, characterService.getById(id), characterSoulService.getById(id), characterTalentService.getById(id)));
    }

    @Operation(summary = "根据name查找角色")
    @GetMapping("/getCharacterByName/{name}")
    @Cacheable(cacheNames = "characterDetail", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getCharacterByName(@Parameter(name = "name", description = "角色name") @PathVariable("name") String name) {
        Integer id=characterService.getOne(new QueryWrapper().where("name='" + name + "'")).getId();
        return getCharacterById(id);
    }

    @Operation(summary = "更新全部角色天赋数值")
    @GetMapping("/updateTalent")
    @CacheEvict(cacheNames = {"characterDetail", "characterMax","characterMaxList"}, allEntries = true)
    public ResultVO<?> updateTalent(@Parameter(name = "auth", description = "验证口令") @RequestParam String auth) {
        if (!Objects.equals(auth, AUTH)) {
            return ResultVO.fail("认证失败");
        }
        List<CharacterBase> list = characterService.list();
        for (CharacterBase characterBase : list) {
            computeCharacterTalent(AUTH,characterBase.getId(), characterBase.getPosition());
        }
        return ResultVO.success("OK");
    }

    @Operation(summary = "更新全部角色极限数值")
    @GetMapping("/updateMax")
    @CacheEvict(cacheNames = {"characterMax","characterMaxList"}, allEntries = true)
    public ResultVO<?> updateMax(@Parameter(name = "auth", description = "验证口令") @RequestParam String auth) {
        if (!Objects.equals(auth, AUTH)) {
            return ResultVO.fail("认证失败");
        }
        List<CharacterBase> list = characterService.list();
        for (CharacterBase characterBase : list) {
            if (characterMaxService.getById(characterBase.getId()) != null) {
                characterMaxService.updateById(new CharacterMax(
                        characterBase,
                        characterTalentService.getById(characterBase.getId()),
                        characterSoulService.getById(characterBase.getId())
                ));
            } else {
                log.info(String.valueOf(new CharacterMax(
                        characterBase,
                        characterTalentService.getById(characterBase.getId()),
                        characterSoulService.getById(characterBase.getId())
                )));
                characterMaxService.save(
                        new CharacterMax(
                                characterBase,
                                characterTalentService.getById(characterBase.getId()),
                                characterSoulService.getById(characterBase.getId())
                        ));
            }
        }
        return ResultVO.success("OK");
    }

    @Operation(summary = "根据id更新角色极限数值")
    @GetMapping("/updateMaxById/{id}")
    @CacheEvict(cacheNames = {"characterMax","characterMaxList"}, allEntries = true)
    public ResultVO<?> updateMaxById(@Parameter(name = "auth", description = "验证口令") @RequestParam String auth,@Parameter(name = "id", description = "角色id") @PathVariable("id") Integer id) {
        if (!Objects.equals(auth, AUTH)) {
            return ResultVO.fail("认证失败");
        }
        CharacterBase characterBase = characterService.getById(id);
        if (characterMaxService.getById(id) != null) {
            characterMaxService.updateById(new CharacterMax(
                    characterBase,
                    characterTalentService.getById(id),
                    characterSoulService.getById(id)
            ));
        } else {
            characterMaxService.save(
                    new CharacterMax(
                            characterBase,
                            characterTalentService.getById(id),
                            characterSoulService.getById(id)
                    ));
        }
        return ResultVO.success("OK");
    }
    @Operation(summary = "根据id查询角色极限数值")
    @GetMapping("/getCharacterMaxById/{id}")
    @Cacheable(cacheNames = "characterMax", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getCharacterMaxById(@Parameter(name = "id", description = "角色id") @PathVariable("id") Integer id) {
        return ResultVO.success(characterMaxService.getById(id));
    }

    @Operation(summary = "根据name查询角色极限数值")
    @GetMapping("/getCharacterMaxByName/{name}")
    @Cacheable(cacheNames = "characterMax", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getCharacterMaxByName(@Parameter(name = "name", description = "角色name") @PathVariable("name") String name) {
        CharacterBase character=characterService.getOne(new QueryWrapper().where("name='" + name + "'"));
        return ResultVO.success(characterMaxService.getById(character.getId()));
    }

    @Operation(summary = "根据id查询角色基础数值")
    @GetMapping("/getCharacterBaseById/{id}")
    @Cacheable(cacheNames = "characterBase", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getCharacterBaseById(@Parameter(name = "id", description = "角色id") @PathVariable("id") Integer id) {
        return ResultVO.success(PropertyUtil.doToDto(characterService.getById(id), CharacterDTO.class));
    }

    @Operation(summary = "根据name查询角色基础数值")
    @GetMapping("/getCharacterBaseByName/{name}")
    @Cacheable(cacheNames = "characterBase", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getCharacterBaseByName(@Parameter(name = "name", description = "角色name") @PathVariable("name") String name) {
        return ResultVO.success(PropertyUtil.doToDto(characterService.getOne(new QueryWrapper().where("name='" + name + "'")), CharacterDTO.class));
    }

    @Operation(summary = "提交角色")
    @PostMapping(value = "/uploadCharacter")
    @CacheEvict(cacheNames = {"characterPages", "characterMax","characterMaxList","characterBase","characterBaseList","characterName"}, allEntries = true)
    public ResultVO<?> uploadCharacter(@Parameter(name = "auth", description = "验证口令") @RequestParam String auth,
                                       @Parameter(name = "position", description = "角色定位（0.进攻；1.防御；2.干扰；3.辅助）") @RequestParam Integer position,
                                       @Parameter(name = "base64", description = "图鉴页角色截图（base64）") @RequestBody String base64) throws IOException {
        if (!Objects.equals(auth, AUTH)) {
            return ResultVO.fail("认证失败");
        }
        List<TextDetection> resultList = TencentUtil.generalAccurate(base64);
        HashMap<String, String> map = new HashMap<>();
        map.put("攻击", "attack");
        map.put("暴击", "crit");
        map.put("防御", "defense");
        map.put("暴伤", "criticalDamage");
        map.put("生命", "life");
        map.put("精准", "precision");
        map.put("速度", "speed");
        map.put("抵抗", "resistance");
        HashMap<String, String> characterMap = new HashMap<>();
        assert resultList != null;
        String name = "";
        for (int i = 0; i < resultList.size(); i++) {
            if (Objects.equals(name, "")) {
                int record = 0;
                for (int in = 0; in < resultList.get(i).getPolygon().length; in++) {
                    if (rangeInDefined(resultList.get(i).getPolygon()[in].getX().intValue(), 200, 600)) {
                        record++;
                    }
                    if (rangeInDefined(resultList.get(i).getPolygon()[in].getY().intValue(), 600, 850)) {
                        record++;
                    }
                    if (record == 8) {
                        name = resultList.get(i).getDetectedText();
                        log.info(name);
                    }
                }
            }
            for (String s : map.keySet()) {
                if (Objects.equals(s, resultList.get(i).getDetectedText())) {
                    if (StringUtil.isNumeric(resultList.get(i + 1).getDetectedText()) || resultList.get(i + 1).getDetectedText().contains("%")) {
                        characterMap.put(map.get(s), resultList.get(i + 1).getDetectedText());
                    } else {
                        characterMap.put(map.get(s), resultList.get(i + 2).getDetectedText());
                    }
                }
            }
        }
        log.info(characterMap.toString());
        //构造解析出的角色
        CharacterBase character = new CharacterBase(characterMap);
        character.setName(name);
        character.setPicture(PICTURE);
        character.setPosition(position);
        log.info(character.toString());
        boolean result;
        //判断角色是否已存在
        if (!Objects.equals(name, "")) {
            CharacterBase characterExist = characterService.getOne(new QueryWrapper().where("name='" + name + "'"));
            if (characterExist != null) {
                //角色存在，获取角色ID以更新
                log.info("角色:{}=>存在，更新数据", name);
                character.setId(characterExist.getId());
                character.setCreateTime(characterExist.getCreateTime());
                character.setUpdateTime(new Date());
                result = characterService.updateById(character)
                        && computeCharacterTalent(AUTH,character.getId(), position)
                        && characterMaxService.updateById(new CharacterMax(character, characterTalentService.getById(character.getId()), characterSoulService.getById(character.getId())));
            } else {
                //角色不存在，新建角色，获取角色ID以更新角色天赋
                log.info("角色:{}=>不存在，新建角色", name);
                Integer id=characterService.getOne(new QueryWrapper().select("MAX(id) as id")).getId()+1;
                result = characterService.save(character)
                        && characterSoulService.save(new CharacterSoul(0, 0, 0, 0, 0, 0, 0, 0))
                        && characterTalentService.save(new CharacterTalent(0, 0, 0, 0, 0, 0, 0, 0))
                        && computeCharacterTalent(AUTH,id, position)
                        && characterMaxService.save(new CharacterMax(character, characterTalentService.getById(id), characterSoulService.getById(id)));

            }
        } else {
            log.error("角色名识别失败");
            result = false;
        }
        return result ? ResultVO.success("下一个") : ResultVO.error("有问题");
    }

    @Operation(summary = "根据id更新角色命座数值")
    @PostMapping(value = "/updateSoulById/{id}")
    @CacheEvict(cacheNames = {"characterDetail", "characterMax","characterMaxList"}, allEntries = true)
    public ResultVO<?> updateSoulById(@Parameter(name = "auth", description = "验证口令") @RequestParam String auth,@Parameter(name = "id", description = "角色id") @PathVariable("id") Integer id, @RequestBody CharacterSoulDTO characterSoulDTO) {
        if (!Objects.equals(auth, AUTH)) {
            return ResultVO.fail("认证失败");
        }
        return characterSoulService.updateById(new CharacterSoul(id, characterSoulDTO)) ? ResultVO.success("OK") : ResultVO.error("DEFEAT");
    }

    @Operation(summary = "根据id与角色定位更新角色天赋数值")
    @GetMapping(value = "/computeCharacterTalent")
    @CacheEvict(cacheNames = {"characterDetail", "characterMax","characterMaxList"}, allEntries = true)
    public boolean computeCharacterTalent(@Parameter(name = "auth", description = "验证口令") @RequestParam String auth,@Parameter(name = "id", description = "角色id") @RequestParam Integer id, @Parameter(name = "position", description = "角色定位（0.进攻；1.防御；2.干扰；3.辅助）") @RequestParam(required = false) Integer position) {
        if (!Objects.equals(auth, AUTH)) {
            return false;
        }
        if (position == null) {
            position = characterService.getById(id).getPosition();
        }else {
            CharacterBase characterBase = new CharacterBase();
            characterBase.setId(id);
            characterBase.setPosition(position);
            characterService.updateById(characterBase);
        }
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.where("position=" + position);
        TalentMap talent = talentMapService.getOne(queryWrapper);
        CharacterTalent characterTalent = talent.computeTalent(characterService.getById(id));
        return characterTalentService.updateById(characterTalent);
    }
    public QueryWrapper transferBaseProperty(String property){
        QueryWrapper query =QueryWrapper.create().select().from(CHARACTER_BASE);
        switch (property) {
            case "attack":
                query=query.orderBy(CHARACTER_BASE.ATTACK.desc());
                break;
            case "crit":
                query=query.orderBy(CHARACTER_BASE.CRIT.desc());
                break;
            case "defense":
                query=query.orderBy(CHARACTER_BASE.DEFENSE.desc());
                break;
            case "critical_damage":
                query=query.orderBy(CHARACTER_BASE.CRITICAL_DAMAGE.desc());
                break;
            case "life":
                query=query.orderBy(CHARACTER_BASE.LIFE.desc());
                break;
            case "precision":
                query=query.orderBy(CHARACTER_BASE.PRECISION.desc());
                break;
            case "speed":
                query=query.orderBy(CHARACTER_BASE.SPEED.desc());
                break;
            case "resistance":
                query=query.orderBy(CHARACTER_BASE.RESISTANCE.desc());
                break;
            default:
                break;
        }
        return query;
    }
    public QueryWrapper transferMaxProperty(String property){
        QueryWrapper query =QueryWrapper.create().select().from(CHARACTER_MAX);
        switch (property) {
            case "attack":
                query=query.orderBy(CHARACTER_MAX.ATTACK.desc());
                break;
            case "crit":
                query=query.orderBy(CHARACTER_MAX.CRIT.desc());
                break;
            case "defense":
                query=query.orderBy(CHARACTER_MAX.DEFENSE.desc());
                break;
            case "critical_damage":
                query=query.orderBy(CHARACTER_MAX.CRITICAL_DAMAGE.desc());
                break;
            case "life":
                query=query.orderBy(CHARACTER_MAX.LIFE.desc());
                break;
            case "precision":
                query=query.orderBy(CHARACTER_MAX.PRECISION.desc());
                break;
            case "speed":
                query=query.orderBy(CHARACTER_MAX.SPEED.desc());
                break;
            case "resistance":
                query=query.orderBy(CHARACTER_MAX.RESISTANCE.desc());
                break;
            default:
                break;
        }
        return query;
    }
    @Operation(summary = "根据属性排序角色基本数值列表")
    @GetMapping("/getBaseListOrderByProperty")
    @Cacheable(cacheNames = "characterBaseList", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getBaseListOrderByProperty(@Parameter(name = "property", description = "排序属性") @RequestParam String property) {
        if (propertyIsExist(property)) {
            return ResultVO.error("不存在该属性");
        }
        return ResultVO.success(PropertyUtil.listToList(characterService.list(transferBaseProperty(property)), CharacterDTO.class));
    }

    @Operation(summary = "根据属性排序角色极限数值列表")
    @GetMapping("/getMaxListOrderByProperty")
    @Cacheable(cacheNames = "characterMaxList", keyGenerator = "keyGenerator", unless = "#result==null")
    public ResultVO<?> getMaxListOrderByProperty(@Parameter(name = "property", description = "排序属性") @RequestParam String property) {
        if (propertyIsExist(property)) {
            return ResultVO.error("不存在该属性");
        }
        List<CharacterDTO> list = PropertyUtil.listToList(characterMaxService.list(transferMaxProperty(property)), CharacterDTO.class);
        for (int i = 0; i < list.size(); i++) {
            CharacterDTO characterDTO = list.get(i);
            CharacterBase characterBase = characterService.getById(characterDTO.getId());
            characterDTO.setName(characterBase.getName());
            characterDTO.setPicture(characterBase.getPicture());
            list.set(i, characterDTO);
        }
        return ResultVO.success(list);
    }
    @Operation(summary = "根据id更新角色图片")
    @PostMapping("/updateCharacterById/{id}")
    @CacheEvict(cacheNames = {"characterDetail"}, allEntries = true)
    public ResultVO<?> updateCharacterById(@Parameter(name = "auth", description = "验证口令") @RequestParam String auth,
                                           @Parameter(name = "id", description = "角色id") @PathVariable("id") Integer id,
                                           @RequestPart("file") MultipartFile file) {
        if (!Objects.equals(auth, AUTH)) {
            return ResultVO.fail("认证失败");
        }
        FileInfo fileInfo = fileStorageService.of(file).upload();
        log.info("上传文件成功，文件信息：{}", fileInfo);
        String picture=fileInfo == null ? PICTURE : fileInfo.getUrl();
        CharacterBase characterBase=characterService.getById(id);
        characterBase.setPicture(picture);
        return characterService.updateById(characterBase) ? ResultVO.success("OK") : ResultVO.error("DEFEAT");
    }
    private boolean propertyIsExist(String property) {
        HashSet<String> set = new HashSet<>();
        set.add("attack");
        set.add("crit");
        set.add("defense");
        set.add("critical_damage");
        set.add("life");
        set.add("precision");
        set.add("speed");
        set.add("resistance");
        return !set.contains(property);
    }

    private static boolean rangeInDefined(int current, int min, int max) {
        return Math.max(min, current) == Math.min(current, max);
    }

//    public void init() throws IOException {
//        String path = "E:\\pic";
//        File file = new File(path);
//        File[] flist = file.listFiles();
//        assert flist != null;
//        for (File f : flist) {
//            System.out.println(f.getAbsolutePath());
//            InputStream in;
//            byte[] data = null;
//            try {
//                in = Files.newInputStream(Paths.get(f.getAbsolutePath()));
//                data = new byte[in.available()];
//                in.read(data);
//                in.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//            BASE64Encoder encoder = new BASE64Encoder();
//            uploadCharacter("xhhx", 0, encoder.encode(data));
//        }
//    }
}
