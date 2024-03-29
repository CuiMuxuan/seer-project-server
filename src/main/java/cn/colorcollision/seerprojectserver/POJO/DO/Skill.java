package cn.colorcollision.seerprojectserver.POJO.DO;

import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.Table;
import cn.colorcollision.seerprojectserver.POJO.DTO.SkillDTO;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @TableName skill
 */
@Table(value = "skill")
@Data
public class Skill implements Serializable {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 技能名称
     */
    private String name;

    /**
     * 独立系数
     */
    private Double pow;

    /**
     * 是否群体（0：单体；1：群体）
     */
    private Integer isAoe;

    /**
     * 是否主动技能（0：被动；1：主动）
     */
    private Integer isActive;
    /**
     * 效果对应
     */
    private String map;

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

    public Skill() {
    }

    public Skill(SkillDTO skillDTO) {
        if (skillDTO != null) {
            this.id = skillDTO.getId();
            this.name = skillDTO.getName();
            this.pow = skillDTO.getPow();
            this.isAoe = skillDTO.getIsAoe();
            this.isActive=skillDTO.getIsActive();
            this.map = skillDTO.getMap().toString();
            this.isDelete = 0;
            Date date = new Date();
            this.createTime = date;
            this.updateTime = date;
        }
    }


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
        Skill other = (Skill) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
                && (this.getPow() == null ? other.getPow() == null : this.getPow().equals(other.getPow()))
                && (this.getIsAoe() == null ? other.getIsAoe() == null : this.getIsAoe().equals(other.getIsAoe()))
                && (this.getMap() == null ? other.getMap() == null : this.getMap().equals(other.getMap()))
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
        result = prime * result + ((getPow() == null) ? 0 : getPow().hashCode());
        result = prime * result + ((getIsAoe() == null) ? 0 : getIsAoe().hashCode());
        result = prime * result + ((getMap() == null) ? 0 : getMap().hashCode());
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
        sb.append(", name=").append(name);
        sb.append(", pow=").append(pow);
        sb.append(", isActive=").append(isActive);
        sb.append(", isAoe=").append(isAoe);
        sb.append(", map=").append(map);
        sb.append(", isDelete=").append(isDelete);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}