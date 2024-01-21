package cn.colorcollision.seerprojectserver.POJO.DTO;


import com.alibaba.fastjson2.JSON;
import cn.colorcollision.seerprojectserver.POJO.DO.Skill;
import cn.colorcollision.seerprojectserver.POJO.entity.SkillComposition;
import lombok.Data;

import java.util.List;

/**
 * @author 爻
 * @date 2023/9/16
 * @design
 */
@Data
public class SkillDTO {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 技能名称
     */
    private String name;

    /**
     * 独立系数
     */
    private Double pow;

    /**
     * 是否群体（0：单体；1：群体）
     */
    private Integer isAoe;

    /**
     * 是否主动技能（0：被动；1：主动）
     */
    private Integer isActive;
    private List<SkillComposition> map;

    public SkillDTO() {
    }

    public SkillDTO(Integer id, String name, Double pow, Integer isAoe, Integer isActive, List<SkillComposition> map) {
        this.id = id;
        this.name = name;
        this.pow = pow;
        this.isAoe = isAoe;
        this.isActive = isActive;
        this.map = map;
    }

    public SkillDTO(Skill skill) {
        if (skill != null) {
            this.id = skill.getId();
            this.name = skill.getName();
            this.pow = skill.getPow();
            this.isAoe = skill.getIsAoe();
            this.isActive = skill.getIsActive();
            this.map = JSON.parseArray(skill.getMap(), SkillComposition.class);
        }
    }

}
