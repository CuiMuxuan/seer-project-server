package cn.colorcollision.seerprojectserver.POJO.DTO;

import lombok.Data;

/**
 * @author 爻
 * @date 2023/8/6
 * @design
 */
@Data
public class CharacterSoulDTO {
    /**
     * 攻击
     */
    private Integer attack;

    /**
     * 防御
     */
    private Integer defense;

    /**
     * 生命
     */
    private Integer life;

    /**
     * 速度
     */
    private Integer speed;

    /**
     * 暴击
     */
    private Integer crit;

    /**
     * 暴伤
     */
    private Integer criticalDamage;

    /**
     * 精准
     */
    private Integer precision;

    /**
     * 抵抗
     */
    private Integer resistance;

    public CharacterSoulDTO() {
    }

    public CharacterSoulDTO(Integer attack, Integer defense, Integer life, Integer speed, Integer crit, Integer criticalDamage, Integer precision, Integer resistance) {
        this.attack = attack;
        this.defense = defense;
        this.life = life;
        this.speed = speed;
        this.crit = crit;
        this.criticalDamage = criticalDamage;
        this.precision = precision;
        this.resistance = resistance;
    }
}
