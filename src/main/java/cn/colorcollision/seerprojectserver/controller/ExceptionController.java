package cn.colorcollision.seerprojectserver.controller;

import cn.colorcollision.seerprojectserver.custom.CustomerException;
import cn.colorcollision.seerprojectserver.custom.ResultVO;
import jakarta.servlet.ServletException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;


import java.util.Objects;

/**
 * @author 爻
 * @date 2023/8/5
 * @design
 */
public class ExceptionController {
    /**
     * @return 捕获Shiro异常
     */
//    @ExceptionHandler(ShiroException.class)
//    public ResultVO<?> handleShiroException() {
//        return ResultVO.error("非法权限访问");
//    }
    @ExceptionHandler(value = CustomerException.class)
    public ResponseEntity<Object> exception(CustomerException exception) {
        if(exception.isPrint()) {
            exception.printStackTrace();
        }
        return new ResponseEntity<>(ResultVO.fail(exception.getErrorCode(),exception.getErrorMsg()), HttpStatus.OK);
    }
    @ExceptionHandler(value = RuntimeException.class)
    public ResponseEntity<Object> exception(RuntimeException exception) {
        exception.printStackTrace();
        return new ResponseEntity<>(ResultVO.fail(500,exception.getMessage()), HttpStatus.OK);
    }
    /**
     * @return 捕捉其他所有异常
     */
    @ExceptionHandler(value = Exception.class)
    public ResponseEntity<Object> exception(Exception exception) {
        exception.printStackTrace();
        return new ResponseEntity<>(ResultVO.fail(501,exception.getMessage()), HttpStatus.OK);
    }
    @ExceptionHandler(value = NullPointerException.class)
    public ResponseEntity<Object> exception(NullPointerException exception) {
        exception.printStackTrace();
        return new ResponseEntity<>(ResultVO.fail(502,exception.getMessage()), HttpStatus.OK);
    }
    @ExceptionHandler(value = ServletException.class)
    public ResponseEntity<Object> exception(ServletException exception) {
        exception.printStackTrace();
        return new ResponseEntity<>(ResultVO.fail(503,exception.getMessage()), HttpStatus.OK);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Object> handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        return new ResponseEntity<>(ResultVO.fail(403, Objects.requireNonNull(e.getBindingResult().getFieldError()).getDefaultMessage()), HttpStatus.OK);
    }
}
