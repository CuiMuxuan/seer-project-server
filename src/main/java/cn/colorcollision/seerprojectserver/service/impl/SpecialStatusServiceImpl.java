package cn.colorcollision.seerprojectserver.service.impl;

import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import cn.colorcollision.seerprojectserver.POJO.DO.SpecialStatus;
import cn.colorcollision.seerprojectserver.POJO.DTO.SpecialStatusDTO;
import cn.colorcollision.seerprojectserver.service.SpecialStatusService;
import cn.colorcollision.seerprojectserver.mapper.SpecialStatusMapper;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.List;

/**
* @author 爻
* @description 针对表【special_status】的数据库操作Service实现
* @createDate 2023-10-09 17:20:33
*/
@Service
public class SpecialStatusServiceImpl extends ServiceImpl<SpecialStatusMapper, SpecialStatus>
    implements SpecialStatusService{
    @Resource
    SpecialStatusMapper specialStatusMapper;
    @Override
    public boolean uploadSpecialStatus(SpecialStatusDTO specialStatusDTO) {
        return specialStatusMapper.insert(new SpecialStatus(specialStatusDTO))==1;
    }

    @Override
    public List<SpecialStatusDTO> getSpecialStatusList() {
        List<SpecialStatus> specialStatusList=specialStatusMapper.selectListByQuery(new QueryWrapper());
        //遍历specialStatusList，将每一个对象都使用new SpecialStatusDTO()构造一个新的SpecialStatusDTO对象，然后将其添加到新的List中
        List<SpecialStatusDTO> specialStatusDTOList=new java.util.ArrayList<>();
        for (SpecialStatus specialStatus:specialStatusList){
            specialStatusDTOList.add(new SpecialStatusDTO(specialStatus));
        }
        return specialStatusDTOList;
    }
}




