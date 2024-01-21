package cn.colorcollision.seerprojectserver.POJO.DO;

import java.io.Serializable;
import java.util.Date;

import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterSoulDTO;
import lombok.Data;

/**
 * 
 * @TableName character_soul
 */
@Table(value ="character_soul")
@Data
public class CharacterSoul implements Serializable {
    /**
     * 主键id，自增非空
     */
    @Id(keyType = KeyType.Auto)
    private Integer id;

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

    /**
     * 逻辑删除字段，0存在，1删除
     */
    @Column(isLogicDelete = true)
    private Integer isDelete;

    /**
     * 创建时间
     */
    private Date createTime;

    public CharacterSoul() {
    }

    public CharacterSoul(Integer attack, Integer defense, Integer life, Integer speed, Integer crit, Integer criticalDamage, Integer precision, Integer resistance) {
        this.attack = attack;
        this.defense = defense;
        this.life = life;
        this.speed = speed;
        this.crit = crit;
        this.criticalDamage = criticalDamage;
        this.precision = precision;
        this.resistance = resistance;
        this.isDelete = 0;
        this.createTime = new Date();
        this.updateTime = new Date();
    }
    public CharacterSoul(Integer id, CharacterSoulDTO characterSoulDTO){
        this.id = id;
        this.attack = characterSoulDTO.getAttack();
        this.defense = characterSoulDTO.getDefense();
        this.life = characterSoulDTO.getLife();
        this.speed = characterSoulDTO.getSpeed();
        this.crit = characterSoulDTO.getCrit();
        this.criticalDamage = characterSoulDTO.getCriticalDamage();
        this.precision=characterSoulDTO.getPrecision();
        this.resistance = characterSoulDTO.getResistance();
        this.updateTime= new Date();
    }
    /**
     * 更新时间
     */
    private Date updateTime;

    @Column(ignore = true)
    private static final long serialVersionUID = 1L;
}