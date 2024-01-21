package cn.colorcollision.seerprojectserver.service.impl;

import com.mybatisflex.spring.service.impl.ServiceImpl;
import cn.colorcollision.seerprojectserver.POJO.DO.Soul;
import cn.colorcollision.seerprojectserver.POJO.DTO.SoulDTO;
import cn.colorcollision.seerprojectserver.POJO.entity.SoulComposition;
import cn.colorcollision.seerprojectserver.mapper.SoulMapper;
import cn.colorcollision.seerprojectserver.service.SoulService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.List;

/**
* @author 爻
* @description 针对表【soul】的数据库操作Service实现
* @createDate 2023-09-16 13:59:59
*/
@Service
public class SoulServiceImpl extends ServiceImpl<SoulMapper, Soul>
    implements SoulService{

    @Resource
    SoulMapper soulMapper;
    @Override
    public Boolean uploadSoul(SoulDTO soulDTO) {
        return soulMapper.insert(new Soul(soulDTO))==1;
    }

    @Override
    public List<SoulComposition> getSoulByCharacterId(Integer characterId) {
        return new SoulDTO(soulMapper.selectOneById(characterId)).getMap();
    }
}




