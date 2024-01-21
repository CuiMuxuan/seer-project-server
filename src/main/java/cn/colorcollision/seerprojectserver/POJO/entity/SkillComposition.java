package cn.colorcollision.seerprojectserver.POJO.entity;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

/**
 * @author 爻
 * @date 2023/9/16
 * @design
 */
public class SkillComposition extends DamageComposition {
    private Integer level;
    private Integer power;
    private String description;

    public SkillComposition() {
    }

    public SkillComposition(Integer level,
                            Integer power,
                            String penetrate,
                            String addition,
                            String extra,
                            String powerIncrease,
                            String damageIncrease,
                            String description) {
        this.level = level;
        this.power = power;
        this.penetrate = JSONObject.parseObject(penetrate);
        this.addition = JSONObject.parseObject(addition);
        this.extra = JSONObject.parseObject(extra);
        this.powerIncrease = JSONObject.parseObject(powerIncrease);
        this.damageIncrease = JSONObject.parseObject(damageIncrease);
        this.description = description;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
