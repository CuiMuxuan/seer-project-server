package cn.colorcollision.seerprojectserver.custom;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author 爻
 * @date 2023/8/5
 * @design
 */
@Component
public class Constant {
    /**
     * 2.响应状态 常量
     */
    public static final int RES_FAIL = 400;
    public static final int RES_NOT_FOUND = 404;
    public static final int RES_SUCCESS = 200;
    public static final int RES_ERROR = 500;
    /**
     * 4.缓存 相关
     */
    public static int REDIS_INDEX_SERVICE;
    public static int REDIS_INDEX_UTILS;
    @Value("${constant.redis.serviceIndex}")
    public void setRedisIndexService(int redisIndexService) {
        REDIS_INDEX_SERVICE = redisIndexService;
    }
    @Value("${constant.redis.utilsIndex}")
    public void setRedisIndexUtils(int redisIndexUtils) {
        REDIS_INDEX_UTILS = redisIndexUtils;
    }
    /**
     * 5.腾讯云 相关
     */
    public static String SERCRET_ID;
    public static String SERCRET_KEY;

    @Value("${tencent.secretId}")
    public void setSecretId(String secretId) {
        SERCRET_ID = secretId;
    }

    @Value("${tencent.secretKey}")
    public void setSecretKey(String secretKey) {
        SERCRET_KEY = secretKey;
    }
    public static String AUTH;
    @Value("${constant.auth}")
    public void setAuth(String auth) {
        AUTH = auth;
    }
    public static final String PICTURE = "image.colorcollision.cn/base/64cf1c0b5fa6ed7585c72f5b.jpg";
}
