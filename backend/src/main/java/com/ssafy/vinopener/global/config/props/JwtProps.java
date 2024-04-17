package com.ssafy.vinopener.global.config.props;

import io.jsonwebtoken.security.Keys;
import lombok.Getter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.convert.DurationUnit;

import javax.crypto.SecretKey;
import java.time.Duration;
import java.time.temporal.ChronoUnit;
import java.util.Base64;

@ConfigurationProperties(prefix = "jwt")
@Getter
public class JwtProps {
    private final SecretKey accessSecretKey;
    private final Duration accessExpiration;
    private final SecretKey refreshSecretKey;
    private final Duration refreshExpiration;

    public JwtProps(String accessSecretKeyBase64,
                    @DurationUnit(ChronoUnit.SECONDS) Duration accessExpirationSeconds,
                    String refreshSecretKeyBase64,
                    @DurationUnit(ChronoUnit.SECONDS) Duration refreshExpirationSeconds) {
        Base64.Decoder decoder = Base64.getDecoder();
        this.accessSecretKey = Keys.hmacShaKeyFor(decoder.decode(accessSecretKeyBase64));
        this.accessExpiration = accessExpirationSeconds;
        this.refreshSecretKey = Keys.hmacShaKeyFor(decoder.decode(refreshSecretKeyBase64));
        this.refreshExpiration = refreshExpirationSeconds;
    }
}
