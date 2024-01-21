package cn.colorcollision.seerprojectserver.POJO.DTO;

import cn.colorcollision.seerprojectserver.POJO.DO.CharacterScheme;
import cn.colorcollision.seerprojectserver.POJO.entity.PanelValues;
import com.alibaba.fastjson2.JSON;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author CuiMuxuan
 */
@Data
@Schema(name = "角色方案")
public class CharacterSchemeDTO {
    private Integer id;
    /**
     * 角色id，非空
     */
    @Schema(description = "角色id，非空")
    private Integer characterId;
    /**
     * 方案名称
     */
    @Schema(description = "方案名称")
    private String name;

    /**
     * 适用玩法，PVE/PVP/ALL
     */
    @Schema(description = "适用玩法，PVE/PVP/ALL")
    private String applicableGameplay;

    /**
     * 方案说明
     */
    @Schema(description = "方案说明")
    private String schemeDescription;

    /**
     * 刻印套系推荐
     */
    @Schema(description = "刻印套系推荐")
    private String recommendedEngraving;

    /**
     * 及格面板数值
     */
    @Schema(description = "及格面板数值")
    private PanelValues passable;

    /**
     * 优良面板数值
     */
    @Schema(description = "优良面板数值")
    private PanelValues excellent;

    /**
     * 极品面板数值
     */
    @Schema(description = "极品面板数值")
    private PanelValues top;

    /**
     * 天赋加点
     */
    @Schema(description = "天赋加点")
    private String talentPoints;

    /**
     * 技能加点
     */
    @Schema(description = "技能加点")
    private String skillPoints;

    /**
     * 刻印ⅠⅡⅢ
     */
    @Schema(description = "刻印ⅠⅡⅢ")
    private String engraving123;

    /**
     * 刻印Ⅳ
     */
    @Schema(description = "刻印Ⅳ")
    private String engraving4;

    /**
     * 刻印Ⅴ
     */
    @Schema(description = "刻印Ⅴ")
    private String engraving5;

    public CharacterSchemeDTO() {
    }
    public CharacterSchemeDTO(CharacterScheme characterScheme) {
        this.id = characterScheme.getId();
        this.characterId = characterScheme.getCharacterId();
        this.name = characterScheme.getName();
        this.applicableGameplay = characterScheme.getApplicableGameplay();
        this.schemeDescription = characterScheme.getSchemeDescription();
        this.recommendedEngraving = characterScheme.getRecommendedEngraving();
        this.passable = JSON.parseObject(characterScheme.getPassable(), PanelValues.class);
        this.excellent = JSON.parseObject(characterScheme.getExcellent(), PanelValues.class);
        this.top = JSON.parseObject(characterScheme.getTop(), PanelValues.class);
        this.talentPoints = characterScheme.getTalentPoints();
        this.skillPoints = characterScheme.getSkillPoints();
        this.engraving123 = characterScheme.getEngraving123();
        this.engraving4 = characterScheme.getEngraving4();
        this.engraving5 = characterScheme.getEngraving5();
    }
}
