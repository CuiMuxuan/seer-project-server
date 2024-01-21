package cn.colorcollision.seerprojectserver.service;

import com.mybatisflex.core.service.IService;
import cn.colorcollision.seerprojectserver.POJO.DO.SpecialStatus;
import cn.colorcollision.seerprojectserver.POJO.DTO.SpecialStatusDTO;

import java.util.List;


/**
* @author 爻
* @description 针对表【special_status】的数据库操作Service
* @createDate 2023-10-09 17:20:33
*/
public interface SpecialStatusService extends IService<SpecialStatus> {

    boolean uploadSpecialStatus(SpecialStatusDTO specialStatusDTO);

    List<SpecialStatusDTO> getSpecialStatusList();
}
