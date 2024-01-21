package cn.colorcollision.seerprojectserver.service;

import cn.colorcollision.seerprojectserver.POJO.DO.Talent;
import com.mybatisflex.core.service.IService;
import cn.colorcollision.seerprojectserver.POJO.DTO.TalentDTO;

/**
* @author 爻
* @description 针对表【talent】的数据库操作Service
* @createDate 2023-09-16 14:00:09
*/
public interface TalentService extends IService<Talent> {

    TalentDTO getTalentByCharacterId(Integer characterId);
}
