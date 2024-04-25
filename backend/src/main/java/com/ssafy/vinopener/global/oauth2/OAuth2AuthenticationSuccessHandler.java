package com.ssafy.vinopener.global.oauth2;

import com.ssafy.vinopener.domain.user.data.entity.TokenEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.domain.user.service.TokenService;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.web.util.WebUtils;

@Component
@RequiredArgsConstructor
@Slf4j
public class OAuth2AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final TokenRepository tokenRepository;
    private final UserRepository userRepository;
    @Value("${oauth.authorizedRedirectUri}")
    private String redirectUri;
    private final JwtProvider jwtProvider;
    private final HttpCookieOAuth2Repository httpCookieOAuth2Repository;
    private final TokenService tokenService;

    @Value("${redis.ttl}")
    private long REDIS_TTL;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        String targetUrl = determineTargetUrl(request, response, authentication);

        if (response.isCommitted()) {
            log.debug("vinopener : Response has already been committed");
            return;
        }
        clearAuthenticationAttributes(request, response);
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }

    @Override
    public String determineTargetUrl(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) {
        UserPrincipal oAuth2User = (UserPrincipal) authentication.getPrincipal();

        //액세스 토큰 생성
        String accessToken = jwtProvider.issueUserAccessToken(oAuth2User);
        //리프레시 토큰 생성
        String refreshToken = jwtProvider.issueUserRefreshToken(oAuth2User);

        UserEntity user = userRepository.findByEmail(oAuth2User.getEmail()).orElse(null);
        if (user == null) {
            throw new RuntimeException("vinopener : user not found by email");
        }
        //생성된 토큰을 redis에 저장.
        TokenEntity token = TokenEntity.builder()
                .userId(user.getId())
                .refreshToken(refreshToken)
                .ttl(REDIS_TTL)
                .build();
        tokenRepository.save(token);

        //accessToken, refreshToken을 cookie에 담아 사용자에게 전달
        Cookie cookie = WebUtils.getCookie(request, HttpCookieOAuth2Repository.REDIRECT_URI_PARAM_COOKIE_NAME);
        return UriComponentsBuilder.fromUriString(cookie != null ? cookie.getValue() : getDefaultTargetUrl())
                .queryParam("accessToken", accessToken)
                .queryParam("refreshToken", refreshToken)
                .toUriString();
    }

    private void clearAuthenticationAttributes(HttpServletRequest request, HttpServletResponse response) {
        super.clearAuthenticationAttributes(request);
        httpCookieOAuth2Repository.removeAuthorizationRequestCookies(request, response);
    }

}
