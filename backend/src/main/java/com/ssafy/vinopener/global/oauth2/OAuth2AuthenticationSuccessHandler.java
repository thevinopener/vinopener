package com.ssafy.vinopener.global.oauth2;

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

    @Value("${oauth.authorizedRedirectUri}")
    private String redirectUri;
    private final JwtProvider jwtProvider;
    private final HttpCookieOAuth2Repository httpCookieOAuth2Repository;

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
        String accessToken = jwtProvider.issueUserAccessToken(oAuth2User);

        Cookie cookie = WebUtils.getCookie(request, HttpCookieOAuth2Repository.REDIRECT_URI_PARAM_COOKIE_NAME);
        return UriComponentsBuilder.fromUriString(cookie != null ? cookie.getValue() : getDefaultTargetUrl())
                .queryParam("accessToken", accessToken)
                .toUriString();
    }

    private void clearAuthenticationAttributes(HttpServletRequest request, HttpServletResponse response) {
        super.clearAuthenticationAttributes(request);
        httpCookieOAuth2Repository.removeAuthorizationRequestCookies(request, response);
    }

}
