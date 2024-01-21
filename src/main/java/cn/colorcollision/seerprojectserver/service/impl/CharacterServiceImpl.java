package cn.colorcollision.seerprojectserver.service.impl;

import com.mybatisflex.spring.service.impl.ServiceImpl;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterBase;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterPlus;
import cn.colorcollision.seerprojectserver.mapper.CharacterMapper;
import cn.colorcollision.seerprojectserver.mapper.CharacterPlusMapper;
import cn.colorcollision.seerprojectserver.service.CharacterService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
* @author 爻
* @description 针对表【character】的数据库操作Service实现
* @createDate 2023-08-05 23:06:24
*/
@Service
public class CharacterServiceImpl extends ServiceImpl<CharacterMapper, CharacterBase>
    implements CharacterService{
    @Resource
    CharacterMapper characterMapper;
    @Resource
    CharacterPlusMapper characterPlusMapper;
    @Override
    public List<CharacterBase> getBaseListOrderByProperty(String property) {
        return characterMapper.getBaseListOrderByProperty(property);
    }

    @Override
    public List<CharacterBase> getCharacterIsExistPlus() {
        List<CharacterPlus> characterPlusList=characterPlusMapper.selectAll();
        List<Integer> ids=new ArrayList<>();
        for (CharacterPlus characterPlus:characterPlusList) {
            Integer id=characterPlus.getId();
            ids.add(id);
        }
        return characterMapper.selectListByIds(ids);
    }
}




