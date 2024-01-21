package cn.colorcollision.seerprojectserver.POJO.DO;

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
@Table(value = "character_guide")
public class CharacterGuide {

    /**
     * 对应角色id
     */
    @Schema(description = "对应角色id")
    @Id(keyType = KeyType.None)
    private Integer id;

    /**
     * 简介
     */
    @Schema(description = "简介")
    @Column(value = "introduction")
    private String introduction;

    /**
     * 整体评价
     */
    @Schema(description = "整体评价")
    @Column(value = "overall_evaluation")
    private String overallEvaluation;

    /**
     * 推荐星级
     */
    @Schema(description = "推荐星级")
    @Column(value = "recommended_star_level")
    private Integer recommendedStarLevel;

    /**
     * 额外说明
     */
    @Schema(description = "额外说明")
    @Column(value = "additional_explanation")
    private String additionalExplanation;

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
     * 逻辑删除
     */
    @Schema(description = "逻辑删除")
    @Column(value = "is_delete", isLogicDelete = true)
    private Integer isDelete;


}
