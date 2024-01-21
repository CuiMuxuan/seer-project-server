package cn.colorcollision.seerprojectserver.POJO.DTO;

import com.alibaba.fastjson2.JSON;
import cn.colorcollision.seerprojectserver.POJO.DO.Soul;
import cn.colorcollision.seerprojectserver.POJO.entity.SoulComposition;
import lombok.Data;

import java.util.List;

/**
 * @author 爻
 * @date 2023/9/16
 * @design
 */
@Data
public class SoulDTO {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 命座效果对应
     */
    private List<SoulComposition> map;

    public SoulDTO() {
    }

    public SoulDTO(Integer id, List<SoulComposition> map) {
        this.id = id;
        this.map = map;
    }

    public SoulDTO(Soul soul) {
        if (soul != null) {
            this.id = soul.getId();
            this.map = JSON.parseArray(soul.getMap(), SoulComposition.class);
        }
    }
}
