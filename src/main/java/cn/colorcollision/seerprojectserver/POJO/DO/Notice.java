package cn.colorcollision.seerprojectserver.POJO.DO;

import java.io.Serializable;
import java.util.Date;

import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import lombok.Data;

/**
 * 
 * @author 爻
 * @TableName notice
 */
@Table(value = "notice")
@Data
public class Notice implements Serializable {
    /**
     * 
     */
    @Id(keyType = KeyType.Auto)
    private Integer id;

    /**
     * 
     */
    private String content;

    /**
     * 
     */
    private Date createTime;

    /**
     * 
     */
    @Column(isLogicDelete = true)
    private Integer isDelete;

    private static final long serialVersionUID = 1L;
}