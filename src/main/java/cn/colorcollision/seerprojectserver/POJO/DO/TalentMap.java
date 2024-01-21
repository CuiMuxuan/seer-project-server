package cn.colorcollision.seerprojectserver.POJO.DO;

import java.io.Serializable;
import java.util.Date;

import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Table;
import lombok.Data;

/**
 * 
 * @author 爻
 * @TableName talent_map
 */
@Table(value = "talent_map")
@Data
public class TalentMap implements Serializable {
    /**
     * 
     */
    private Integer id;

    /**
     * 0.进攻；1.防御；2.干扰；3.辅助
     */
    private Integer position;

    /**
     * 
     */
    private Integer attack;

    /**
     * 
     */
    private Integer defense;

    /**
     * 
     */
    private Integer life;

    /**
     * 
     */
    private Integer speed;

    /**
     * 
     */
    private Integer crit;

    /**
     * 
     */
    private Integer criticalDamage;

    /**
     * 
     */
    private Integer precision;

    /**
     * 
     */
    private Integer resistance;

    /**
     * 
     */
    @Column(isLogicDelete = true)
    private Integer isDelete;

    /**
     * 
     */
    private Date createTime;

    /**
     * 
     */
    private Date updateTime;

    @Column(ignore = true)
    private static final long serialVersionUID = 1L;
    public CharacterTalent computeTalent(CharacterBase characterBase){
        CharacterTalent characterTalent=new CharacterTalent();
        characterTalent.setId(characterBase.getId());
        characterTalent.setAttack((int) Math.ceil((double)characterBase.getAttack()*this.attack/100));
        characterTalent.setDefense((int) Math.ceil((double)characterBase.getDefense()*this.defense/100));
        characterTalent.setLife((int) Math.ceil((double)characterBase.getLife()*this.life/100));
        characterTalent.setSpeed(this.speed);
        characterTalent.setCrit(this.crit);
        characterTalent.setCriticalDamage(this.criticalDamage);
        characterTalent.setPrecision(this.precision);
        characterTalent.setResistance(this.resistance);
        characterTalent.setCreateTime(null);
        return characterTalent;
    }
}