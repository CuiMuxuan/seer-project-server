package cn.colorcollision.seerprojectserver;
import cn.xuyanwu.spring.file.storage.EnableFileStorage;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

/**
 * @author CuiMuxuan
 */
@EnableCaching
@MapperScan("cn.colorcollision.seerprojectserver.mapper")
@EnableFileStorage
@SpringBootApplication
public class SeerProjectServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SeerProjectServerApplication.class, args);
    }

}
