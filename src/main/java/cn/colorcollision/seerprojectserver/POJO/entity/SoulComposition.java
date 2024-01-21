package cn.colorcollision.seerprojectserver.POJO.entity;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterSoulDTO;
import lombok.Data;

/**
 * @author 爻
 * @date 2023/9/16
 * @design
 */
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

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public CharacterSoulDTO getCharacterSoulDTO() {
        return characterSoulDTO;
    }

    public void setCharacterSoulDTO(CharacterSoulDTO characterSoulDTO) {
        this.characterSoulDTO = characterSoulDTO;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
