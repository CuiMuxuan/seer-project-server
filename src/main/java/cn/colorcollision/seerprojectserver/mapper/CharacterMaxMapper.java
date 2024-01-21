package cn.colorcollision.seerprojectserver.mapper;

import com.mybatisflex.core.BaseMapper;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterMax;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
* @author 爻
* @description 针对表【character_max】的数据库操作Mapper
* @createDate 2023-08-07 16:14:02
* @Entity cn.colorcollision.seerprojectserver.POJO.DO.CharacterMax
*/
public interface CharacterMaxMapper extends BaseMapper<CharacterMax> {

    List<CharacterMax> getMaxListOrderByProperty(@Param("property") String property);
}




