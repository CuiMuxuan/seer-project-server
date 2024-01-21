package cn.colorcollision.seerprojectserver.POJO.DO;

import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.Table;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @TableName talent
 */
@Table(value ="talent")
@Data
public class Talent implements Serializable {
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
        Talent other = (Talent) that;
        return (this.getPosition() == null ? other.getPosition() == null : this.getPosition().equals(other.getPosition()))
            && (this.getDecreasePower() == null ? other.getDecreasePower() == null : this.getDecreasePower().equals(other.getDecreasePower()))
            && (this.getIncreaseDamage() == null ? other.getIncreaseDamage() == null : this.getIncreaseDamage().equals(other.getIncreaseDamage()))
            && (this.getIsDelete() == null ? other.getIsDelete() == null : this.getIsDelete().equals(other.getIsDelete()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getPosition() == null) ? 0 : getPosition().hashCode());
        result = prime * result + ((getDecreasePower() == null) ? 0 : getDecreasePower().hashCode());
        result = prime * result + ((getIncreaseDamage() == null) ? 0 : getIncreaseDamage().hashCode());
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
        sb.append(", position=").append(position);
        sb.append(", decreasePower=").append(decreasePower);
        sb.append(", increaseDamage=").append(increaseDamage);
        sb.append(", isDelete=").append(isDelete);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}