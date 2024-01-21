package cn.colorcollision.seerprojectserver.POJO.entity;

import com.alibaba.fastjson2.JSONObject;
import lombok.Data;

/**
 * @author 爻
 * @date 2023/9/16
 * @design
 */
@Data
public class DamageComposition {
    /**
     * 贯穿防御
     */
    public JSONObject penetrate;
    /**
     * 威力提升
     */
    public JSONObject powerIncrease;
    /**
     * 技能=>额外伤害提升、魂印=>伤害提升
     */
    public JSONObject addition;

    public JSONObject damageIncrease;
    /**
     * 刻印、技能、天赋、魂印附加的固定伤害，以及各附加伤害对应的最大值
     */
    public JSONObject extra;
}
