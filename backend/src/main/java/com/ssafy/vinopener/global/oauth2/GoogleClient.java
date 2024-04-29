package com.ssafy.vinopener.global.oauth2;

import com.ssafy.vinopener.global.config.props.GoogleClientProps;
import com.ssafy.vinopener.global.oauth2.dto.request.GoogleAccessTokenRequest;
import com.ssafy.vinopener.global.oauth2.dto.response.GoogleAccessTokenResponse;
import com.ssafy.vinopener.global.oauth2.dto.response.GoogleAccountProfileResponse;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Optional;
import javax.security.auth.login.LoginException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

@Component
@RequiredArgsConstructor
public class GoogleClient {

    private final GoogleClientProps googleClientProps;

    // https://docs.spring.io/spring-framework/reference/integration/rest-clients.html restClient 문서 참고
    private RestClient restClient = RestClient.create();

    public String getGoogleAccessToken(final String code) throws LoginException {
        final String decodedCode = URLDecoder.decode(code, StandardCharsets.UTF_8);
        final HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE);
        final HttpEntity<GoogleAccessTokenRequest> httpEntity = new HttpEntity<>(
                new GoogleAccessTokenRequest(
                        googleClientProps.clientId(),
                        googleClientProps.clientSecret(),
                        decodedCode,
                        googleClientProps.authorizationCode(),
                        googleClientProps.redirectUri()
                ),
                headers
        );

        final GoogleAccessTokenResponse response
                = restClient.post()
                .uri(googleClientProps.accessTokenUrl())
                .accept(MediaType.APPLICATION_JSON)
                .retrieve()
                .body(GoogleAccessTokenResponse.class);

        return Optional.ofNullable(response)
                .orElseThrow(() -> new LoginException("NOT_FOUND_GOOGLE_ACCESS_TOKEN_RESPONSE"))
                .accessToken();
    }

    public GoogleAccountProfileResponse getGoogleAccountProfile(final String accessToken) {
        final HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken);
        final HttpEntity<GoogleAccessTokenRequest> httpEntity = new HttpEntity<>(headers);
        return restClient.get()
                .uri(googleClientProps.profileUrl())
                .accept(MediaType.APPLICATION_JSON)
                .retrieve()
                .body(GoogleAccountProfileResponse.class);
    }

}
