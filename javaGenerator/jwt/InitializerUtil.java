package com.hp.jwt;

import org.springframework.stereotype.Component;

/**
 *创建初始化配置代理类
  * 这是 初始化  TokenSettings 类得
 */
@Component
public class InitializerUtil {

    public InitializerUtil(TokenSettings tokenSettings){
        JwtTokenUtil.setTokenSettings(tokenSettings);
    }
}
