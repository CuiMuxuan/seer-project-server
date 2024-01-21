package cn.colorcollision.seerprojectserver.service.impl;

import com.mybatisflex.spring.service.impl.ServiceImpl;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterBase;
import cn.colorcollision.seerprojectserver.POJO.DO.Talent;
import cn.colorcollision.seerprojectserver.POJO.DTO.TalentDTO;
import cn.colorcollision.seerprojectserver.mapper.CharacterMapper;
import cn.colorcollision.seerprojectserver.mapper.TalentMapper;
import cn.colorcollision.seerprojectserver.service.TalentService;
import cn.colorcollision.seerprojectserver.util.PropertyUtil;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

/**
* @author 爻
* @description 针对表【talent】的数据库操作Service实现
* @createDate 2023-09-16 14:00:09
*/
@Service
public class TalentServiceImpl extends ServiceImpl<TalentMapper, Talent>
    implements TalentService{

    @Resource
    TalentMapper talentMapper;
    @Resource
    CharacterMapper characterMapper;
    @Override
    public TalentDTO getTalentByCharacterId(Integer characterId) {
        CharacterBase character=characterMapper.selectOneById(characterId);
        if(character==null){
            return null;
        }
        return PropertyUtil.doToDto(talentMapper.selectOneById(character.getPosition()),TalentDTO.class);
    }
}




