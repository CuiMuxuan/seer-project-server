package cn.colorcollision.seerprojectserver.POJO.DO;


import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;

import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import lombok.Data;

/**
 * 
 * @author 爻
 * @TableName character
 */
@Table(value = "character_base")
@Data
public class CharacterBase implements Serializable {
    /**
     * 主键id，自增非空
     */
    @Id(keyType = KeyType.Auto)
    private Integer id;

    /**
     * 角色名称，非空
     */
    private String name;

    private String property;
    /**
     * 角色图片，非空
     */
    private String picture;

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
    private Integer position;

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

    public CharacterBase(Integer id, String name, String picture, Integer attack, Integer defense, Integer life, Integer speed, Integer crit, Integer criticalDamage, Integer precision, Integer resistance, Integer isDelete, Date createTime, Date updateTime) {
        this.id = id;
        this.name = name;
        this.picture = picture;
        this.attack = attack;
        this.defense = defense;
        this.life = life;
        this.speed = speed;
        this.crit = crit;
        this.criticalDamage = criticalDamage;
        this.precision = precision;
        this.resistance = resistance;
        this.isDelete = isDelete;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public CharacterBase() {

    }
    public CharacterBase(HashMap<String, String> map) {
        this.setAttack(Integer.valueOf(map.get("attack")));
        this.setCrit(Integer.valueOf(map.get("crit").split("%")[0]));
        this.setDefense(Integer.valueOf(map.get("defense")));
        this.setCriticalDamage(Integer.valueOf(map.get("criticalDamage").split("%")[0]));
        this.setLife(Integer.valueOf(map.get("life")));
        this.setPrecision(Integer.valueOf(map.get("precision").split("%")[0]));
        this.setSpeed(Integer.valueOf(map.get("speed")));
        this.setResistance(Integer.valueOf(map.get("resistance").split("%")[0]));
        this.createTime=new Date();
        this.updateTime = new Date();
    }
    @Column(ignore = true)
    private static final long serialVersionUID = 1L;
}