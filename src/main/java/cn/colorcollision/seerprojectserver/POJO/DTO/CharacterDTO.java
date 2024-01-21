package cn.colorcollision.seerprojectserver.POJO.DTO;


import lombok.Data;

/**
 * @author 爻
 * @date 2023/8/6
 * @design
 */
@Data
public class CharacterDTO {
    /**
     * 主键id，自增非空
     */
    private Integer id;

    /**
     * 角色名称，非空
     */
    private String name;

    /**
     * 角色图片，非空
     */
    private String picture;

    private String property;
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

}
