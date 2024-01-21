package cn.colorcollision.seerprojectserver.mapper;

import com.mybatisflex.core.BaseMapper;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterBase;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author 爻
* @description 针对表【character】的数据库操作Mapper
* @createDate 2023-08-05 23:06:24
* @Entity cn.colorcollision.POJO.DO.Character
*/
public interface CharacterMapper extends BaseMapper<CharacterBase> {

    List<CharacterBase> getBaseListOrderByProperty(@Param("property") String property);
}




