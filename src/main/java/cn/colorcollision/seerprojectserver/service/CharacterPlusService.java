package cn.colorcollision.seerprojectserver.service;

import cn.colorcollision.seerprojectserver.POJO.DO.CharacterPlus;
import com.mybatisflex.core.service.IService;

/**
* @author 爻
* @description 针对表【character_plus】的数据库操作Service
* @createDate 2023-09-16 13:59:39
*/
public interface CharacterPlusService extends IService<CharacterPlus> {

    Boolean uploadCharacterPlus(String property, Integer id);
}
