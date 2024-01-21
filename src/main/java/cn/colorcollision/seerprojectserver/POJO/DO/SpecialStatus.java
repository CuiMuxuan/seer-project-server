package cn.colorcollision.seerprojectserver.POJO.DO;


import java.io.Serializable;

import com.alibaba.fastjson2.JSON;
import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.Table;
import cn.colorcollision.seerprojectserver.POJO.DTO.SpecialStatusDTO;
import lombok.Data;

/**
 * 
 * @TableName special_status
 */
@Table(value ="special_status")
@Data
public class SpecialStatus implements Serializable {
    /**
     * 主键id
     */
    @Id
    private Integer id;

    /**
     * 状态名称
     */
    private String name;

    /**
     * 状态类型（buff/skill/status）
     */
    private String type;

    /**
     * 主体id/所有者id
     */
    private Integer subjectId;

    /**
     * 直属依赖id
     */
    private Integer relyId;

    /**
     * 层数
     */
    private Integer layers;

    /**
     * 对应map
     */
    private String map;

    @Column(ignore = true)
    private static final long serialVersionUID = 1L;
    public SpecialStatus() {
    }
    public SpecialStatus(SpecialStatusDTO specialStatusDTO){
        if (specialStatusDTO!=null){
            this.id = specialStatusDTO.getId();
            this.name = specialStatusDTO.getName();
            this.type = specialStatusDTO.getType();
            this.subjectId = specialStatusDTO.getSubjectId();
            this.relyId = specialStatusDTO.getRelyId();
            this.layers = specialStatusDTO.getLayers();
            this.map = JSON.toJSONString(specialStatusDTO.getMap());
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
        SpecialStatus other = (SpecialStatus) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
            && (this.getSubjectId() == null ? other.getSubjectId() == null : this.getSubjectId().equals(other.getSubjectId()))
            && (this.getRelyId() == null ? other.getRelyId() == null : this.getRelyId().equals(other.getRelyId()))
            && (this.getLayers() == null ? other.getLayers() == null : this.getLayers().equals(other.getLayers()))
            && (this.getMap() == null ? other.getMap() == null : this.getMap().equals(other.getMap()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getSubjectId() == null) ? 0 : getSubjectId().hashCode());
        result = prime * result + ((getRelyId() == null) ? 0 : getRelyId().hashCode());
        result = prime * result + ((getLayers() == null) ? 0 : getLayers().hashCode());
        result = prime * result + ((getMap() == null) ? 0 : getMap().hashCode());
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
        sb.append(", type=").append(type);
        sb.append(", subjectId=").append(subjectId);
        sb.append(", relyId=").append(relyId);
        sb.append(", layers=").append(layers);
        sb.append(", map=").append(map);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}