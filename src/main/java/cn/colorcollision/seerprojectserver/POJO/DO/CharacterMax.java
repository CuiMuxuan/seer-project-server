package cn.colorcollision.seerprojectserver.POJO.DO;

import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author 爻
 * @TableName character_max
 */
@Table(value = "character_max")
@Data
public class CharacterMax implements Serializable {
    /**
     * 主键id，自增非空
     */
    @Id(keyType = KeyType.None)
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

    /**
     * 更新时间
     */
    private Date updateTime;

    @Column(ignore = true)
    private static final long serialVersionUID = 1L;

    public void setAttack(Integer base,Integer talent,Integer soul) {
        //小词条135+大词条200*4+基础+天赋+（基础*（命座+刻印套系25*2+大词条百分比50*2+小词条百分比30*3）/100）
        this.attack = 135 + 200*4 + base + talent + (int) Math.ceil((double)base*(soul+25*2+50*2+30*3)/100);
    }

    public void setDefense(Integer base,Integer talent,Integer soul) {
        //小词条70+大词条100*4+基础+天赋+（基础*（命座+刻印套系25*2+大词条百分比50*2+小词条百分比30*3）/100）
        this.defense = 70 + 100*4 + base + talent + (int) Math.ceil((double)base*(soul+25*2+50*2+30*3)/100);
    }

    public void setLife(Integer base,Integer talent,Integer soul) {
        //小词条150+大词条250*4+基础+天赋+（基础*（命座+刻印套系25*2+大词条百分比50*2+小词条百分比30*3）/100）
        this.life = 150 + 250*4 + base + talent + (int) Math.ceil((double)base*(soul+25*2+50*2+30*3)/100);
    }

    public CharacterMax() {
    }

    public CharacterMax(CharacterBase characterBase, CharacterTalent characterTalent, CharacterSoul characterSoul){
        this.id=characterBase.getId();
        setAttack(characterBase.getAttack(),characterTalent.getAttack(),characterSoul.getAttack());
        setDefense(characterBase.getDefense(),characterTalent.getDefense(),characterSoul.getDefense());
        setLife(characterBase.getLife(),characterTalent.getLife(),characterSoul.getLife());
        //小词条20*4+大词条45+基础+天赋+（基础*（命座+刻印套系10）/100）+ 速度套20/100 +套系效果10*3
        this.speed = 20*4 + 45 + characterBase.getSpeed() + characterTalent.getSpeed() + (int) Math.ceil((double)characterBase.getSpeed()*characterSoul.getSpeed()/100) + (int) Math.ceil((double)characterBase.getSpeed()*20/100) + 10*3;
        //刻印套系10*2 + 小词条15*4 + 大词条50 + 基础 +天赋+命座
        this.crit = 10*2 + 15*4 + 50 + characterBase.getCrit() + characterTalent.getCrit() + characterSoul.getCrit();
        //小词条20*4 + 大词条50 + 基础 +天赋+命座
        this.criticalDamage = 20*4 + 50 + characterBase.getCriticalDamage() + characterTalent.getCriticalDamage() + characterSoul.getCriticalDamage();
        //刻印套系35*2+小词条20*4+大词条50*2+基础+天赋+命座
        this.precision = 35*2 + 20*4 + 50*2 + characterBase.getPrecision() + characterTalent.getPrecision() + characterSoul.getPrecision();
        //刻印套系35*2+小词条20*4+大词条50*2+基础+天赋+命座
        this.resistance = 35*2 + 20*4 + 50*2 + characterBase.getResistance() + characterTalent.getResistance() + characterSoul.getResistance();
        this.isDelete=0;
        this.createTime=characterBase.getCreateTime();
        this.updateTime=new Date();

    }
}