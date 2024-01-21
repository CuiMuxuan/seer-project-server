package cn.colorcollision.seerprojectserver.service.impl;


import com.mybatisflex.spring.service.impl.ServiceImpl;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterMax;
import cn.colorcollision.seerprojectserver.service.CharacterMaxService;
import cn.colorcollision.seerprojectserver.mapper.CharacterMaxMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;


import java.util.List;

/**
* @author 爻
* @description 针对表【character_max】的数据库操作Service实现
* @createDate 2023-08-07 16:14:02
*/
@Service
public class CharacterMaxServiceImpl extends ServiceImpl<CharacterMaxMapper, CharacterMax>
    implements CharacterMaxService{

    @Resource
    CharacterMaxMapper characterMaxMapper;
    @Override
    public List<CharacterMax> getMaxListOrderByProperty(String property) {
        return characterMaxMapper.getMaxListOrderByProperty(property);
    }
}




