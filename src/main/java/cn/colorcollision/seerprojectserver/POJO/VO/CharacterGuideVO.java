package cn.colorcollision.seerprojectserver.POJO.VO;

import cn.colorcollision.seerprojectserver.POJO.DO.CharacterGuide;
import cn.colorcollision.seerprojectserver.POJO.DO.CharacterScheme;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterGuideDTO;
import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterSchemeDTO;
import cn.colorcollision.seerprojectserver.util.PropertyUtil;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author CuiMuxuan
 */
@Data
@Schema(description =  "角色攻略视图对象")
public class CharacterGuideVO {
    @Schema(name = "角色攻略")
    private CharacterGuideDTO characterGuideDTO;
    @Schema(name = "养成方案列表")
    private List<CharacterSchemeDTO> characterSchemeDTOList;

    public CharacterGuideVO() {
    }
    public CharacterGuideVO(CharacterGuide characterGuide, List<CharacterScheme> characterSchemeList) {
        List<CharacterSchemeDTO> list = new java.util.ArrayList<>();
        this.setCharacterGuideDTO(PropertyUtil.doToDto(characterGuide, CharacterGuideDTO.class));
        for (CharacterScheme characterScheme : characterSchemeList) {
            list.add(new CharacterSchemeDTO(characterScheme));
        }
        this.setCharacterSchemeDTOList(list);
    }

    public CharacterGuide getCharacterGuideDTO() {
        return PropertyUtil.dtoToDo(this.characterGuideDTO, CharacterGuide.class);
    }


    public List<CharacterScheme> getCharacterSchemeDTOList() {
        List<CharacterScheme> result=new java.util.ArrayList<>();
        for (CharacterSchemeDTO characterSchemeDTO : this.characterSchemeDTOList) {
            result.add(new CharacterScheme(characterSchemeDTO));
        }
        return result;
    }

}
