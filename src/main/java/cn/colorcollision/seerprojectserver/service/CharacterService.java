package cn.colorcollision.seerprojectserver.service;

import com.mybatisflex.core.service.IService;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterBase;

import java.util.List;

/**
* @author 爻
* @description 针对表【character】的数据库操作Service
* @createDate 2023-08-05 23:06:24
*/
public interface CharacterService extends IService<CharacterBase> {
    List<CharacterBase> getBaseListOrderByProperty(String property);

    List<CharacterBase> getCharacterIsExistPlus();
}
