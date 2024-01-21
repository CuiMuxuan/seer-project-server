package cn.colorcollision.seerprojectserver.POJO.DTO;

import com.alibaba.fastjson2.JSON;
import cn.colorcollision.seerprojectserver.POJO.DO.SpecialStatus;
import cn.colorcollision.seerprojectserver.POJO.entity.StatusComposition;
import lombok.Data;

import java.util.List;

/**
 * @author 爻
 * @date 2023/10/9
 * @design
 */
@Data
public class SpecialStatusDTO {
    private Integer id;
    private String name;
    private String type;
    private Integer subjectId;
    private Integer relyId;
    private Integer layers;
    private List<StatusComposition> map;
    public SpecialStatusDTO(){

    }
    public SpecialStatusDTO(Integer id,List<StatusComposition> map){
        this.id=id;
        this.map=map;
    }
    public SpecialStatusDTO(SpecialStatus specialStatus){
        if (specialStatus!=null){
            this.id=specialStatus.getId();
            this.name=specialStatus.getName();
            this.type=specialStatus.getType();
            this.subjectId=specialStatus.getSubjectId();
            this.relyId=specialStatus.getRelyId();
            this.layers=specialStatus.getLayers();
            this.map= JSON.parseArray(specialStatus.getMap(),StatusComposition.class);
        }
    }
}
