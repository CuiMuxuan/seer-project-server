package cn.colorcollision.seerprojectserver.POJO.entity;

import lombok.Data;

/**
 * @author 爻
 * @date 2023/10/9
 * @design
 */
@Data
public class StatusComposition {
    public Integer level;
    public Integer attack;
    public Integer defense;
    public Integer speed;
    public Integer critDamage;
    public Integer damageIncrease;
    public Integer penetrate;
}
