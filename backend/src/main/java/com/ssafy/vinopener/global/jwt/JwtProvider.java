package com.ssafy.vinopener.global.jwt;

import com.ssafy.vinopener.global.config.props.JwtProps;
import com.ssafy.vinopener.global.exception.VinopenerException;
import com.ssafy.vinopener.global.oauth2.UserPrincipal;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import java.time.Duration;
import java.util.Date;
import javax.crypto.SecretKey;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class JwtProvider {

    private static final String CLAIMS_ID = "id";
    private static final String CLAIMS_SHOP_ID = "shopId";
    private static final String CLAIMS_AUTHORITY = "authority";
    private final JwtProps jwtProps;

    public String issueUserAccessToken(UserPrincipal principal) {
        return issueAccessToken(Jwts.claims()
                .add(CLAIMS_ID, principal.getId())
                .add(CLAIMS_AUTHORITY, principal.getAuthority())
                .build());
    }

    //refreshToken은 accessToken보다 더 적은 데이터가 들어가서 구성된다. 그걸 고려해서 수정해야함.
    public String issueUserRefreshToken(UserPrincipal principal) {
        return issueRefreshToken(Jwts.claims()
                .add(CLAIMS_ID, principal.getId())
                .add(CLAIMS_AUTHORITY, principal.getAuthority())
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

    private String issueToken(Claims claims, Duration expiration, SecretKey secretKey) {
        Date now = new Date();
        return Jwts.builder()
                .claims(claims)
                .issuedAt(now)
                .expiration(new Date(now.getTime() + expiration.toMillis()))
                .signWith(secretKey)
                .compact();
    }

    //토큰 정보를 검증하는 메소드. (구현 필요)
    public boolean validateToken(String token) {
        return false;
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
