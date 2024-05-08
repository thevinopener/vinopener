package com.ssafy.vinopener.global.jwt;

import com.ssafy.vinopener.domain.user.data.entity.TokenEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import com.ssafy.vinopener.global.config.props.JwtProps;
import com.ssafy.vinopener.global.exception.VinopenerException;
import com.ssafy.vinopener.global.oauth2.UserPrincipal;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.security.SecurityException;
import java.time.Duration;
import java.util.Date;
import java.util.List;
import javax.crypto.SecretKey;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class JwtProvider {

    private static final String CLAIMS_ID = "id";
    private static final String CLAIMS_EMAIL = "email";
    private static final String CLAIMS_AUTHORITY = "authority";
    private final JwtProps jwtProps;
    private final TokenRepository tokenRepository;
    private final long REDIS_TTL = 86400;

    public String issueUserAccessToken(UserEntity user) {

        return issueAccessToken(Jwts.claims()
                .add(CLAIMS_ID, user.getId())
                .add(CLAIMS_EMAIL, user.getEmail())
                .add(CLAIMS_AUTHORITY, "ROLE_USER")
                .build());
    }

    public String issueUserRefreshToken(UserEntity user) {
        String refreshToken = issueRefreshToken(Jwts.claims()
                .add(CLAIMS_ID, user.getId())
                .build());

        TokenEntity token = TokenEntity.builder()
                .userId(user.getId())
                .refreshToken(refreshToken)
                .ttl(REDIS_TTL)
                .build();
        tokenRepository.save(token);

        return refreshToken;
    }

    public Authentication getAuthentication(String accessToken) {
        Claims claims = parseToken(accessToken, jwtProps.getAccessSecretKey());

        UserPrincipal userPrincipal = UserPrincipal.builder()
                .id(claims.get(CLAIMS_ID, Long.class))
                .email(claims.get(CLAIMS_EMAIL, String.class))
                .authority(claims.get(CLAIMS_AUTHORITY, String.class))
                .build();

        return new UsernamePasswordAuthenticationToken(userPrincipal, null, List.of(userPrincipal::getAuthority));
    }

    public Long parseId(String token) {
        Claims payload;
        try {
            payload = Jwts.parser()
                    .verifyWith(jwtProps.getAccessSecretKey())
                    .build()
                    .parseSignedClaims(token)
                    .getPayload();

        } catch (SecurityException | MalformedJwtException e) {
            throw new VinopenerException(JwtErrorCode.MALFORMED_TOKEN);
        } catch (ExpiredJwtException e) {
            throw new VinopenerException(JwtErrorCode.EXPIRED_TOKEN);
        } catch (JwtException | IllegalArgumentException e) {
            throw new VinopenerException(JwtErrorCode.INVALID_TOKEN);
        }

        return Long.parseLong(payload.get("id").toString());
    }

    public Long parseIdForRefresh(String token) {
        Claims payload;
        try {
            payload = Jwts.parser()
                    .verifyWith(jwtProps.getAccessSecretKey())
                    .build()
                    .parseSignedClaims(token)
                    .getPayload();

        } catch (SecurityException | MalformedJwtException e) {
            throw new VinopenerException(JwtErrorCode.MALFORMED_TOKEN);
        } catch (ExpiredJwtException e) {
            return Long.parseLong(e.getClaims().get("id").toString());
        } catch (JwtException | IllegalArgumentException e) {
            throw new VinopenerException(JwtErrorCode.INVALID_TOKEN);
        }

        return Long.parseLong(payload.get("id").toString());
    }

    private String issueAccessToken(Claims claims) {
        return issueToken(
                claims,
                jwtProps.getAccessExpiration(),
                jwtProps.getAccessSecretKey()
        );
    }

    private String issueRefreshToken(Claims claims) {
        return issueToken(
                claims,
                jwtProps.getRefreshExpiration(),
                jwtProps.getRefreshSecretKey()
        );
    }

    private String issueToken(Claims claims, Duration expiration, SecretKey secretKey) {
        Date now = new Date();
        return Jwts.builder()
                .header().add("typ", "JWT").and()
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
        } catch (SecurityException | MalformedJwtException e) {
            throw new VinopenerException(JwtErrorCode.MALFORMED_TOKEN);
        } catch (ExpiredJwtException e) {
            throw new VinopenerException(JwtErrorCode.EXPIRED_TOKEN);
        } catch (JwtException | IllegalArgumentException e) {
            throw new VinopenerException(JwtErrorCode.INVALID_TOKEN);
        }
        return payload;
    }

}
