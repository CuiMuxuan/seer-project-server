package cn.colorcollision.seerprojectserver.custom;

import lombok.Data;

import static cn.colorcollision.seerprojectserver.custom.Constant.*;

/**
 * @author 爻
 * @date 2023/8/5
 * @design
 */
@Data
public class ResultVO<T> {
    private Integer status;
    private String message;
    private String errorMsg;
    private T data;
    private Long timestamp;

    public ResultVO() {
        this.timestamp = System.currentTimeMillis();
    }

    public ResultVO(int status, String message, String errorMsg, T data) {
        this.status = status;
        this.message = message;
        this.errorMsg = errorMsg;
        this.data = data;
        this.timestamp = System.currentTimeMillis();
    }

    public ResultVO(T data) {
        if (data == null) {
            this.status = RES_NOT_FOUND;
            this.message = "No data found";
        } else {
            this.status = RES_SUCCESS;
            this.message = "success";
            this.data = data;
        }
    }

    public ResultVO(int code, String errorMsg) {
        this.status = code;
        this.errorMsg = errorMsg;
    }

    public static <T> ResultVO<T> success(T data) {
        if (data == null) {
            return ResultVO.fail(RES_NOT_FOUND, "No data found");
        }
        ResultVO<T> resultData = new ResultVO<>();
        resultData.setStatus(RES_SUCCESS);
        resultData.setMessage("Operation is successful");
        resultData.setData(data);
        return resultData;
    }

    public static <T> ResultVO<T> success(String message) {
        ResultVO<T> resultData = new ResultVO<>();
        resultData.setStatus(RES_SUCCESS);
        resultData.setMessage(message);
        return resultData;
    }

    public static <T> ResultVO<T> success(String message, T data) {
        if (data == null) {
            return ResultVO.fail(RES_NOT_FOUND, "No data found");
        }
        ResultVO<T> resultData = new ResultVO<>();
        resultData.setStatus(RES_SUCCESS);
        resultData.setMessage(message);
        resultData.setData(data);
        return resultData;
    }

    public static <T> ResultVO<T> fail(int code, String message) {
        ResultVO<T> resultData = new ResultVO<>();
        resultData.setStatus(code);
        resultData.setErrorMsg(message);
        return resultData;
    }

    public static <T> ResultVO<T> fail(String message) {
        ResultVO<T> resultData = new ResultVO<>();
        resultData.setStatus(300);
        resultData.setErrorMsg(message);
        return resultData;
    }


    public static <T> ResultVO<T> error() {
        return new ResultVO<>(RES_ERROR, null, null, null);
    }

    public static <T> ResultVO<T> error(String message) {
        ResultVO<T> resultVo = new ResultVO<>();
        resultVo.setStatus(RES_ERROR);
        resultVo.setMessage(message);
        return resultVo;
    }
}
