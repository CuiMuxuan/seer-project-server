package cn.colorcollision.seerprojectserver.service;

import com.mybatisflex.core.service.IService;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterMax;

import java.util.List;


/**
* @author 爻
* @description 针对表【character_max】的数据库操作Service
* @createDate 2023-08-07 16:14:02
*/
public interface CharacterMaxService extends IService<CharacterMax> {

    List<CharacterMax> getMaxListOrderByProperty(String property);
}
