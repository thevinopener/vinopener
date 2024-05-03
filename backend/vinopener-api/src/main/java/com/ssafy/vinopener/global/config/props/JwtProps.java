package com.ssafy.vinopener.global.config.props;

import io.jsonwebtoken.security.Keys;
import java.time.Duration;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import javax.crypto.SecretKey;
import lombok.Getter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.convert.DurationUnit;

@ConfigurationProperties(prefix = "jwt")
@Getter
public class JwtProps {

    private final SecretKey accessSecretKey;
    private final Duration accessExpiration;
    private final SecretKey refreshSecretKey;
    private final Duration refreshExpiration;

    public JwtProps(
            final String accessSecretKeyBase64,
            final @DurationUnit(ChronoUnit.SECONDS) Duration accessExpirationSeconds,
            final String refreshSecretKeyBase64,
            final @DurationUnit(ChronoUnit.SECONDS) Duration refreshExpirationSeconds
    ) {
        Base64.Decoder decoder = Base64.getDecoder();
        this.accessSecretKey = Keys.hmacShaKeyFor(decoder.decode(accessSecretKeyBase64));
        this.accessExpiration = accessExpirationSeconds;
        this.refreshSecretKey = Keys.hmacShaKeyFor(decoder.decode(refreshSecretKeyBase64));
        this.refreshExpiration = refreshExpirationSeconds;
    }

}
