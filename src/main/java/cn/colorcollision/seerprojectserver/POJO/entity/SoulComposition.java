package cn.colorcollision.seerprojectserver.POJO.entity;

import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterSoulDTO;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 爻
 * @date 2023/9/16
 * @design
 */
@Setter
@Getter
public class SoulComposition extends DamageComposition {
    private Integer level;
    private CharacterSoulDTO characterSoulDTO;

    public SoulComposition() {
    }

    public SoulComposition(Integer level,
                           CharacterSoulDTO characterSoulDTO,
                           String penetrate,
                           String addition,
                           String extra,
                           String powerIncrease,
                           String damageIncrease) {
        this.level = level;
        this.characterSoulDTO = characterSoulDTO;
        this.penetrate=JSONObject.parseObject(penetrate);
        this.addition = JSONObject.parseObject(addition);
        this.extra = JSONObject.parseObject(extra);
        this.powerIncrease = JSONObject.parseObject(powerIncrease);
        this.damageIncrease = JSONObject.parseObject(damageIncrease);
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
