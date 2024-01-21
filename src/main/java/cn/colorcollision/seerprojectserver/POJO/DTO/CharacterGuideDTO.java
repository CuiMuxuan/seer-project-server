package cn.colorcollision.seerprojectserver.POJO.DTO;

import lombok.Data;

/**
 * @author CuiMuxuan
 */
@Data
public class CharacterGuideDTO {
    private Integer id;
    /**
     * 简介
     */
    private String introduction;

    /**
     * 整体评价
     */
    private String overallEvaluation;

    /**
     * 推荐星级
     */
    private Integer recommendedStarLevel;

    /**
     * 额外说明
     */
    private String additionalExplanation;

    /**
     * 创建时间
     */
    private java.util.Date createTime;

    /**
     * 更新时间
     */
    private java.util.Date updateTime;
}
