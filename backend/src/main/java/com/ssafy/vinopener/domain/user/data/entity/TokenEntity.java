package com.ssafy.vinopener.domain.user.data.entity;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.redis.core.index.Indexed;

@RedisHash(value = "refreshToken", timeToLive = 60 * 60 * 3L)
@AllArgsConstructor
@Getter
@Builder
public class TokenEntity {

    @Id
    private Long id;
    private String refreshToken;
    @Indexed
    private String accessToken;

    public static TokenEntity of(final Long id, final String refreshToken) {
        return TokenEntity.builder()
                .id(id)
                .refreshToken(refreshToken)
                .build();
    }

}
