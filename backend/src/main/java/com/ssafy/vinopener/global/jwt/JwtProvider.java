package com.ssafy.vinopener.global.jwt;

import com.ssafy.vinopener.global.config.props.JwtProps;
import com.ssafy.vinopener.global.exception.VinopenerException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.time.Duration;
import java.util.Date;

@Component
@RequiredArgsConstructor
public class JwtProvider {
    private final JwtProps jwtProps;

    public String issueAccessToken(Claims claims) {
        return issueToken(
                claims,
                jwtProps.getAccessExpiration(),
                jwtProps.getAccessSecretKey()
        );
    }

    public String issueRefreshToken(Claims claims) {
        return issueToken(
                claims,
                jwtProps.getRefreshExpiration(),
                jwtProps.getRefreshSecretKey()
        );
    }

    private String issueToken(Claims claims, Duration expiration, SecretKey secretKey) {
        Date now = new Date();
        return Jwts.builder()
                .claims(claims)
                .issuedAt(now)
                .expiration(new Date(now.getTime() + expiration.toMillis()))
                .signWith(secretKey)
                .compact();
    }

    private Claims parseToken(String token, SecretKey secretKey) {
        Claims payload;
        try {
            payload = Jwts.parser()
                    .verifyWith(secretKey)
                    .build()
                    .parseSignedClaims(token)
                    .getPayload();
        } catch (ExpiredJwtException e) {
            throw new VinopenerException(JwtErrorCode.EXPIRED_TOKEN);
        } catch (JwtException | IllegalArgumentException e) {
            throw new VinopenerException(JwtErrorCode.INVALID_TOKEN);
        }
        return payload;
    }
}
