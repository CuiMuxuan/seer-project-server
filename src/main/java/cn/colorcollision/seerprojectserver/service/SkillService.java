package cn.colorcollision.seerprojectserver.service;

import cn.colorcollision.seerprojectserver.POJO.DO.Skill;
import com.mybatisflex.core.service.IService;
import cn.colorcollision.seerprojectserver.POJO.DTO.SkillDTO;

import java.util.List;

/**
* @author 爻
* @description 针对表【skill】的数据库操作Service
* @createDate 2023-09-16 13:59:50
*/
public interface SkillService extends IService<Skill> {

    boolean uploadSkill(SkillDTO skillDTO);

    List<SkillDTO> getSkillByCharacterId(Integer characterId);
}
