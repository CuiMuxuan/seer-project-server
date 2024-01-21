package cn.colorcollision.seerprojectserver.POJO.VO;


import cn.colorcollision.seerprojectserver.POJO.DTO.SkillDTO;
import cn.colorcollision.seerprojectserver.POJO.DTO.TalentDTO;
import cn.colorcollision.seerprojectserver.POJO.entity.SoulComposition;
import lombok.Data;

import java.util.List;

/**
 * @author 爻
 * @date 2023/9/16
 * @design
 */
@Data
public class CharacterPlusVO {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 角色属性
     */
    private String property;

    /**
     * 技能列表
     */
    private List<SkillDTO> skillList;

    /**
     * 命座列表
     */
    private List<SoulComposition> soulList;

    /**
     * 天赋
     */
    private TalentDTO talent;

    public CharacterPlusVO(Integer id, String property, List<SkillDTO> skillList, List<SoulComposition> soulList, TalentDTO talent) {
        this.id = id;
        this.property = property;
        this.skillList = skillList;
        this.soulList = soulList;
        this.talent = talent;
    }

    public CharacterPlusVO() {
    }
}
