package cn.colorcollision.seerprojectserver.POJO.DTO;

import com.mybatisflex.annotation.Id;
import lombok.Data;

/**
 * @author 爻
 * @date 2023/9/16
 * @design
 */
@Data
public class TalentDTO {
    /**
     * 主键
     */
    @Id
    private Integer position;

    /**
     * 威力降低
     */
    private String decreasePower;

    /**
     * 伤害增加
     */
    private Integer increaseDamage;
}
