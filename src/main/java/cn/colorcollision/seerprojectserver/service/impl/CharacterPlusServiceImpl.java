package cn.colorcollision.seerprojectserver.service.impl;

import com.mybatisflex.spring.service.impl.ServiceImpl;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterPlus;
import cn.colorcollision.seerprojectserver.service.CharacterPlusService;
import cn.colorcollision.seerprojectserver.mapper.CharacterPlusMapper;
import jakarta.annotation.Resource;
import lombok.Data;
import org.springframework.stereotype.Service;


import java.util.Date;

/**
* @author 爻
* @description 针对表【character_plus】的数据库操作Service实现
* @createDate 2023-09-16 13:59:39
*/
@Service
public class CharacterPlusServiceImpl extends ServiceImpl<CharacterPlusMapper, CharacterPlus>
    implements CharacterPlusService{
    @Resource
    CharacterPlusMapper characterPlusMapper;
    @Override
    public Boolean uploadCharacterPlus(String property, Integer id) {
        int prefix= id*10;
        CharacterPlus characterPlus=new CharacterPlus();
        characterPlus.setId(id);
        characterPlus.setProperty(property);
        characterPlus.setSkillOne(String.valueOf(prefix+1));
        characterPlus.setSkillTwo(String.valueOf(prefix+2));
        characterPlus.setSkillThree(String.valueOf(prefix+3));
        characterPlus.setIsDelete(0);
        Date date=new Date();
        characterPlus.setCreateTime(date);
        characterPlus.setCreateTime(date);
        return characterPlusMapper.insert(characterPlus)==1;
    }
}




