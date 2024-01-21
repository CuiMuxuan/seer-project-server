package cn.colorcollision.seerprojectserver.POJO.DO;


import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.Table;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author CuiMuxuan
 * @TableName buff
 */
@Table(value = "buff")
@Data
public class Buff implements Serializable {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 状态名称属性（专属状态时为json）
     */
    private String name;

    /**
     * 属性
     */
    private String property;

    /**
     * 属性选取对象（0：自己；1：对方）
     */
    private Integer object;

    /**
     * 属性比例（专属状态时为专属状态的特殊数值）
     */
    private Integer rate;

    /**
     * 状态类型（0：增益；1：负面）
     */
    private Integer type;

    /**
     * 状态描述
     */
    private String meaning;

    /**
     * 是否专属状态（0：非专属；1：专属）
     */
    private Integer isExclusive;

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
        Buff other = (Buff) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getProperty() == null ? other.getProperty() == null : this.getProperty().equals(other.getProperty()))
            && (this.getObject() == null ? other.getObject() == null : this.getObject().equals(other.getObject()))
            && (this.getRate() == null ? other.getRate() == null : this.getRate().equals(other.getRate()))
            && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
            && (this.getMeaning() == null ? other.getMeaning() == null : this.getMeaning().equals(other.getMeaning()))
            && (this.getIsExclusive() == null ? other.getIsExclusive() == null : this.getIsExclusive().equals(other.getIsExclusive()))
            && (this.getIsDelete() == null ? other.getIsDelete() == null : this.getIsDelete().equals(other.getIsDelete()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getProperty() == null) ? 0 : getProperty().hashCode());
        result = prime * result + ((getObject() == null) ? 0 : getObject().hashCode());
        result = prime * result + ((getRate() == null) ? 0 : getRate().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getMeaning() == null) ? 0 : getMeaning().hashCode());
        result = prime * result + ((getIsExclusive() == null) ? 0 : getIsExclusive().hashCode());
        result = prime * result + ((getIsDelete() == null) ? 0 : getIsDelete().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        String sb = getClass().getSimpleName() +
                " [" +
                "Hash = " + hashCode() +
                ", id=" + id +
                ", name=" + name +
                ", property=" + property +
                ", object=" + object +
                ", rate=" + rate +
                ", type=" + type +
                ", meaning=" + meaning +
                ", isExclusive=" + isExclusive +
                ", isDelete=" + isDelete +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", serialVersionUID=" + serialVersionUID +
                "]";
        return sb;
    }
}