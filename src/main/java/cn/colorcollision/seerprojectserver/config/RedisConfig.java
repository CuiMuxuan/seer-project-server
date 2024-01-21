package cn.colorcollision.seerprojectserver.config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisPassword;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisClientConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import redis.clients.jedis.JedisPoolConfig;

import java.time.Duration;
import java.util.Arrays;

import static cn.colorcollision.seerprojectserver.custom.Constant.REDIS_INDEX_SERVICE;
import static cn.colorcollision.seerprojectserver.custom.Constant.REDIS_INDEX_UTILS;


/**
 * 配置 Redis 多 dbIndex 操作
 *  1.RedisTemplate处理RefreshToken缓存，存储与缓存库 REDIS_INDEX_TOKEN（1）
 *  2.@Cache + cacheManager处理业务缓存，存储与缓存库 REDIS_INDEX_SERVICE（0）
 *  EnableCaching 开启缓存注解支持
 * @author 爻
 */

@Configuration
@EnableCaching
public class RedisConfig {

    /**
     * redis jedis客户端配置 + 连接池
     */
    @Configuration
    public static class JedisConf {
        @Value("${spring.data.redis.host}")
        private String host;
        @Value("${spring.data.redis.port}")
        private Integer port;
        @Value("${spring.data.redis.password}")
        private String password;

        @Value("${spring.data.redis.jedis.pool.max-active}")
        private Integer maxActive;
        @Value("${spring.data.redis.jedis.pool.max-idle}")
        private Integer maxIdle;
        @Value("${spring.data.redis.jedis.pool.max-wait}")
        private Duration maxWait;
        @Value("${spring.data.redis.jedis.pool.min-idle}")
        private Integer minIdle;

        @Bean
        public JedisPoolConfig jedisPool() {
            JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
            jedisPoolConfig.setMaxIdle(maxIdle);
            jedisPoolConfig.setMaxWait(maxWait);
            jedisPoolConfig.setMaxTotal(maxActive);
            jedisPoolConfig.setMinIdle(minIdle);
            return jedisPoolConfig;
        }

        @Bean
        public RedisStandaloneConfiguration jedisServiceConfig() {
            RedisStandaloneConfiguration config = new RedisStandaloneConfiguration();
            config.setHostName(host);
            config.setPort(port);
            config.setDatabase(REDIS_INDEX_SERVICE);
            config.setPassword(RedisPassword.of(password));
            return config;
        }
        @Bean
        public RedisStandaloneConfiguration jedisTokenConfig() {
            RedisStandaloneConfiguration config = new RedisStandaloneConfiguration();
            config.setHostName(host);
            config.setPort(port);
            config.setDatabase(REDIS_INDEX_UTILS);
            config.setPassword(RedisPassword.of(password));
            return config;
        }
    }


    /**
     * 配置 业务逻辑缓存的redisConnectionFactory
     */
    @Primary
    @Bean("redisServiceFactory")
    public RedisConnectionFactory redisConnectionFactory(JedisPoolConfig jedisPool,
                                                         RedisStandaloneConfiguration jedisServiceConfig) {
        JedisClientConfiguration.JedisClientConfigurationBuilder jedisClientConfigurationBuilder=JedisClientConfiguration.builder();
        JedisClientConfiguration jedisClientConfiguration=jedisClientConfigurationBuilder.usePooling().poolConfig(jedisPool).build();
        return new JedisConnectionFactory(jedisServiceConfig,jedisClientConfiguration);
    }

    /**
     * 配置 Token缓存的redisConnectionFactory
     */

    @Bean("redisTokenFactory")
    public RedisConnectionFactory redisTokenFactory(JedisPoolConfig jedisPool,
                                                    RedisStandaloneConfiguration jedisTokenConfig) {
        JedisClientConfiguration.JedisClientConfigurationBuilder jedisClientConfigurationBuilder=JedisClientConfiguration.builder();
        JedisClientConfiguration jedisClientConfiguration=jedisClientConfigurationBuilder.usePooling().poolConfig(jedisPool).build();
        return new JedisConnectionFactory(jedisTokenConfig,jedisClientConfiguration);
    }

    /**
     * RedisTemplate配置 RedisTemplate与@Cacheable独立，需要重新设置序列化方式
     * @param redisConnectionFactory 连接池
     * @return 模板
     */
    @Bean
    public RedisTemplate<String,Object> redisTemplate(@Qualifier("redisTokenFactory") RedisConnectionFactory redisConnectionFactory) {
        RedisTemplate<String, Object> template = new RedisTemplate();
        template.setConnectionFactory(redisConnectionFactory);
        GenericJackson2JsonRedisSerializer jsonRedisSerializer = new GenericJackson2JsonRedisSerializer();
        // value值的序列化采用fastJsonRedisSerializer
        template.setValueSerializer(jsonRedisSerializer);
        template.setHashValueSerializer(jsonRedisSerializer);
        // key的序列化采用StringRedisSerializer
        template.setKeySerializer(new StringRedisSerializer());
        template.setHashKeySerializer(new StringRedisSerializer());
        return template;
    }

    /**
     * 缓存注解@Cache 配置
     */
    @Bean
    public RedisCacheManager cacheManager(@Qualifier("redisServiceFactory") RedisConnectionFactory factory) {
        GenericJackson2JsonRedisSerializer genericJackson2JsonRedisSerializer = new GenericJackson2JsonRedisSerializer();
        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();
        // 配置序列化
        RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig();
        RedisCacheConfiguration redisCacheConfiguration = config
                // 键序列化方式 redis字符串序列化
                .serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(stringRedisSerializer))
                // 值序列化方式 简单json序列化
                .serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(genericJackson2JsonRedisSerializer))
                //不缓存Null值
                .disableCachingNullValues()
                //默认缓存失效 3天
                .entryTtl(Duration.ofDays(2));
        return RedisCacheManager.builder(factory).cacheDefaults(redisCacheConfiguration).build();
    }

    /**
     * 重写缓存key的生成方式： 类名.方法名字&[参数列表]
     */
    @Bean
    public KeyGenerator keyGenerator(){
        //执行类名.+方法名字&+[参数列表]
        return (target, method, params) -> target.getClass().getName() + "." +
                method.getName() + "&" +
                Arrays.toString(params);
    }
}