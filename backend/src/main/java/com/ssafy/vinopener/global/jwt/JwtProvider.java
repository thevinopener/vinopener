package com.ssafy.vinopener.global.jwt;

import com.ssafy.vinopener.global.config.props.JwtProps;
import com.ssafy.vinopener.global.exception.VinopenerException;
import com.ssafy.vinopener.global.oauth2.UserPrincipal;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import java.time.Duration;
import java.util.Base64;
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
    private final Base64.Decoder decoder = Base64.getDecoder();

    public String issueUserAccessToken(UserPrincipal principal) {
        return issueAccessToken(Jwts.claims()
                .add(CLAIMS_ID, principal.getId())
                .add(CLAIMS_EMAIL, principal.getEmail())
                .add(CLAIMS_AUTHORITY, principal.getAuthority())
                .build());
    }

    public String issueUserRefreshToken(UserPrincipal principal) {
        return issueRefreshToken(Jwts.claims()
                .add(CLAIMS_ID, principal.getId())
                .build());
    }

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

    public Authentication getAuthentication(String accessToken) {
        Claims claims = parseToken(accessToken, jwtProps.getAccessSecretKey());

        UserPrincipal userPrincipal = UserPrincipal.builder()
                .id(claims.get(CLAIMS_ID, Long.class))
                .email(claims.get(CLAIMS_EMAIL, String.class))
                .authority(claims.get(CLAIMS_AUTHORITY, String.class))
                .build();

        return new UsernamePasswordAuthenticationToken(userPrincipal, null, List.of(userPrincipal::getAuthority));
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
        } catch (ExpiredJwtException e) {
            throw new VinopenerException(JwtErrorCode.EXPIRED_TOKEN);
        } catch (JwtException | IllegalArgumentException e) {
            throw new VinopenerException(JwtErrorCode.INVALID_TOKEN);
        }
        return payload;
    }

}
