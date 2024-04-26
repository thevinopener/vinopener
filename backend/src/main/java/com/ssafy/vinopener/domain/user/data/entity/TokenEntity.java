package com.ssafy.vinopener.domain.user.data.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.redis.core.TimeToLive;

@RedisHash(value = "refreshToken")
@AllArgsConstructor
@Getter
@Builder
public class TokenEntity {

    @Id
    private Long userId;
    private String refreshToken;

    @TimeToLive
    private Long ttl;

    public static TokenEntity of(final Long userId, final String refreshToken, final Long ttl) {
        return TokenEntity.builder()
                .userId(userId)
                .refreshToken(refreshToken)
                .ttl(ttl)
                .build();
    }

}
