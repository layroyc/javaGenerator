package com.hp.jwt;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.time.Duration;

/**
 * @ClassName: TokenSettings
 * TODO:类文件简单描述
 * @Author: xiexin
 * @UpdateUser: xiexin
 * @Version: 0.0.1
 *
 *
 * 此类 需要  InitializerUtil 激活
 */
@Component
@Data
@ConfigurationProperties(prefix = "jwt")
public class TokenSettings {
    private String secretKey;
    private Duration accessTokenExpireTime;
    private Duration refreshTokenExpireTime;
    private Duration refreshTokenExpireAppTime;
    private String issuer;



}
