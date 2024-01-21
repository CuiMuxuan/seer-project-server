package cn.colorcollision.seerprojectserver.POJO.DO;

import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.Table;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author 爻
 * @TableName character_plus
 */
@Table(value ="character_plus")
@Data
public class CharacterPlus implements Serializable {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 角色属性
     */
    private String property;

    /**
     * 角色id*10+1
     */
    private String skillOne;

    /**
     * 角色id*10+2
     */
    private String skillTwo;

    /**
     * 角色id*10+3
     */
    private String skillThree;

    /**
     * 逻辑删除字段（0：存在；1：删除）
     */
    @Column(isLogicDelete = true)
    private Integer isDelete;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    @Column(ignore = true)
    private static final long serialVersionUID = 1L;

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        CharacterPlus other = (CharacterPlus) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getProperty() == null ? other.getProperty() == null : this.getProperty().equals(other.getProperty()))
            && (this.getSkillOne() == null ? other.getSkillOne() == null : this.getSkillOne().equals(other.getSkillOne()))
            && (this.getSkillTwo() == null ? other.getSkillTwo() == null : this.getSkillTwo().equals(other.getSkillTwo()))
            && (this.getSkillThree() == null ? other.getSkillThree() == null : this.getSkillThree().equals(other.getSkillThree()))
            && (this.getIsDelete() == null ? other.getIsDelete() == null : this.getIsDelete().equals(other.getIsDelete()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getProperty() == null) ? 0 : getProperty().hashCode());
        result = prime * result + ((getSkillOne() == null) ? 0 : getSkillOne().hashCode());
        result = prime * result + ((getSkillTwo() == null) ? 0 : getSkillTwo().hashCode());
        result = prime * result + ((getSkillThree() == null) ? 0 : getSkillThree().hashCode());
        result = prime * result + ((getIsDelete() == null) ? 0 : getIsDelete().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", property=").append(property);
        sb.append(", skillOne=").append(skillOne);
        sb.append(", skillTwo=").append(skillTwo);
        sb.append(", skillThree=").append(skillThree);
        sb.append(", isDelete=").append(isDelete);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}