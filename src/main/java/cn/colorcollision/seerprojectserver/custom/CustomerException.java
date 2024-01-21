package cn.colorcollision.seerprojectserver.custom;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author 爻
 * @date 2023/8/5
 * @design
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@Accessors(chain = true)
public class CustomerException extends RuntimeException{
    /**
     * 错误码
     */
    protected Integer errorCode = 500;
    /**
     * 错误信息  未知错误
     */
    protected String errorMsg = "Network error";
    /**
     * 日志是否输出
     */
    protected boolean print = false;

    public CustomerException(boolean print){
        this.print = print;
    }
    public CustomerException(String errorMsg){
        this.errorMsg = errorMsg;
    }
    public CustomerException(Integer errorCode){
        this.errorCode = errorCode;
    }
    public CustomerException(Integer errorCode, String errorMsg){
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }
}
