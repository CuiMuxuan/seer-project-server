package cn.colorcollision.seerprojectserver.service.impl;

import com.mybatisflex.spring.service.impl.ServiceImpl;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterPlus;
import cn.colorcollision.seerprojectserver.POJO.DO.Skill;
import cn.colorcollision.seerprojectserver.POJO.DTO.SkillDTO;
import cn.colorcollision.seerprojectserver.mapper.CharacterPlusMapper;
import cn.colorcollision.seerprojectserver.service.SkillService;
import cn.colorcollision.seerprojectserver.mapper.SkillMapper;
import cn.colorcollision.seerprojectserver.util.PropertyUtil;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
* @author 爻
* @description 针对表【skill】的数据库操作Service实现
* @createDate 2023-09-16 13:59:50
*/
@Service
public class SkillServiceImpl extends ServiceImpl<SkillMapper, Skill>
    implements SkillService{
    @Resource
    SkillMapper skillMapper;
    @Resource
    CharacterPlusMapper characterPlusMapper;
    @Override
    public boolean uploadSkill(SkillDTO skillDTO) {
        int flag=skillMapper.insert(new Skill(skillDTO));
        return flag==1;
    }

    @Override
    public List<SkillDTO> getSkillByCharacterId(Integer characterId) {
        CharacterPlus characterPlus=characterPlusMapper.selectOneById(characterId);
        if(characterPlus==null){
            return null;
        }
        Integer skillOne=Integer.parseInt(characterPlus.getSkillOne());
        Integer skillTwo=Integer.parseInt(characterPlus.getSkillTwo());
        Integer skillThree=Integer.parseInt(characterPlus.getSkillThree());
        List<SkillDTO> list=new ArrayList<>();
        list.add(new SkillDTO(skillMapper.selectOneById(skillOne)));
        list.add(new SkillDTO(skillMapper.selectOneById(skillTwo)));
        list.add(new SkillDTO(skillMapper.selectOneById(skillThree)));
        return list;
    }
}




