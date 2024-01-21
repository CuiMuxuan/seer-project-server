package cn.colorcollision.seerprojectserver.service;

import com.mybatisflex.core.service.IService;
import cn.colorcollision.seerprojectserver.POJO.DO.Soul;
import cn.colorcollision.seerprojectserver.POJO.DTO.SoulDTO;
import cn.colorcollision.seerprojectserver.POJO.entity.SoulComposition;

import java.util.List;

/**
* @author 爻
* @description 针对表【soul】的数据库操作Service
* @createDate 2023-09-16 13:59:59
*/
public interface SoulService extends IService<Soul> {

    Boolean uploadSoul(SoulDTO soulDTO);

    List<SoulComposition> getSoulByCharacterId(Integer characterId);
}
