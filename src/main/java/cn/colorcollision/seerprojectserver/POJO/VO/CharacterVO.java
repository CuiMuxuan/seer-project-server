package cn.colorcollision.seerprojectserver.POJO.VO;

import cn.colorcollision.seerprojectserver.POJO.DO.CharacterBase;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterSoul;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterTalent;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterDTO;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterSoulDTO;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterTalentDTO;
import cn.colorcollision.seerprojectserver.util.PropertyUtil;
import lombok.Data;

/**
 * @author 爻
 * @date 2023/8/6
 * @design
 */
@Data
public class CharacterVO {
    private Integer id;
    private CharacterDTO character;
    private CharacterSoulDTO soul;
    private CharacterTalentDTO talent;

    public CharacterVO() {
    }

    public CharacterVO(Integer id, CharacterBase character, CharacterSoul soul, CharacterTalent talent) {
        this.id = id;
        this.character = PropertyUtil.doToDto(character,CharacterDTO.class);
        this.soul = PropertyUtil.doToDto(soul,CharacterSoulDTO.class);
        this.talent = PropertyUtil.doToDto(talent,CharacterTalentDTO.class);
    }
}
