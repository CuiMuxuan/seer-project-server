package cn.colorcollision.seerprojectserver.POJO.DO;

import cn.colorcollision.seerprojectserver.POJO.DTO.CharacterSchemeDTO;
import cn.colorcollision.seerprojectserver.POJO.entity.PanelValues;
import com.alibaba.fastjson.JSON;
import lombok.Data;
import io.swagger.v3.oas.annotations.media.Schema;
import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;

/**
 * 实体类。
 *
 * @author Cui Muxuan
 * @since 1.0
 */
@Data
@Schema(name = "$table.comment")
@Table(value = "character_scheme")
public class CharacterScheme {

    /**
     * id
     */
    @Schema(description = "id")
    @Id(keyType = KeyType.Auto)
    private Integer id;

    /**
     * 角色id，非空
     */
    @Schema(description = "角色id，非空")
    @Column(value = "character_id")
    private Integer characterId;

    /**
     * 方案名称，非空
     */
    @Schema(description = "方案名称，非空")
    @Column(value = "name")
    private String name;

    /**
     * 适用玩法，PVE/PVP/ALL
     */
    @Schema(description = "适用玩法，PVE/PVP/ALL")
    @Column(value = "applicable_gameplay")
    private String applicableGameplay;

    /**
     * 方案说明
     */
    @Schema(description = "方案说明")
    @Column(value = "scheme_description")
    private String schemeDescription;

    /**
     * 刻印套系推荐
     */
    @Schema(description = "刻印套系推荐")
    @Column(value = "recommended_engraving")
    private String recommendedEngraving;

    /**
     * 及格面板数值
     */
    @Schema(description = "及格面板数值")
    @Column(value = "passable")
    private String passable;

    /**
     * 优良面板数值
     */
    @Schema(description = "优良面板数值")
    @Column(value = "excellent")
    private String excellent;

    /**
     * 极品面板数值
     */
    @Schema(description = "极品面板数值")
    @Column(value = "top")
    private String top;

    /**
     * 天赋加点
     */
    @Schema(description = "天赋加点")
    @Column(value = "talent_points")
    private String talentPoints;

    /**
     * 技能加点
     */
    @Schema(description = "技能加点")
    @Column(value = "skill_points")
    private String skillPoints;

    /**
     * 刻印ⅠⅡⅢ
     */
    @Schema(description = "刻印ⅠⅡⅢ")
    @Column(value = "engraving123")
    private String engraving123;

    /**
     * 刻印Ⅳ
     */
    @Schema(description = "刻印Ⅳ")
    @Column(value = "engraving4")
    private String engraving4;

    /**
     * 刻印Ⅴ
     */
    @Schema(description = "刻印Ⅴ")
    @Column(value = "engraving5")
    private String engraving5;

    /**
     * 创建时间
     */
    @Schema(description = "创建时间")
    @Column(value = "create_time")
    private java.util.Date createTime;

    /**
     * 更新时间
     */
    @Schema(description = "更新时间")
    @Column(value = "update_time")
    private java.util.Date updateTime;

    /**
     * 逻辑删除，0存在，1删除
     */
    @Schema(description = "逻辑删除，0存在，1删除")
    @Column(value = "is_delete", isLogicDelete = true)
    private Integer isDelete;

    public CharacterScheme() {
    }
    public CharacterScheme(CharacterSchemeDTO characterSchemeDTO) {
        this.id= characterSchemeDTO.getId();
        this.characterId = characterSchemeDTO.getCharacterId();
        this.name = characterSchemeDTO.getName();
        this.applicableGameplay = characterSchemeDTO.getApplicableGameplay();
        this.schemeDescription = characterSchemeDTO.getSchemeDescription();
        this.recommendedEngraving = characterSchemeDTO.getRecommendedEngraving();
        this.passable = JSON.toJSONString(characterSchemeDTO.getPassable());
        this.excellent = JSON.toJSONString(characterSchemeDTO.getExcellent());
        this.top = JSON.toJSONString(characterSchemeDTO.getTop());
        this.talentPoints = characterSchemeDTO.getTalentPoints();
        this.skillPoints = characterSchemeDTO.getSkillPoints();
        this.engraving123 = characterSchemeDTO.getEngraving123();
        this.engraving4 = characterSchemeDTO.getEngraving4();
        this.engraving5 = characterSchemeDTO.getEngraving5();
        this.updateTime= new java.util.Date();
    }

}
