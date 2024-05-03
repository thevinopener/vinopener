package com.ssafy.vinopener.global.config.props;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "redis")
public record RedisProps(
        Long ttl
) {

}
