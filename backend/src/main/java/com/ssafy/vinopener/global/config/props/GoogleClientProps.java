package com.ssafy.vinopener.global.config.props;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "spring.security.oauth2.client.registration.google")
public record GoogleClientProps(
        String clientId,
        String clientSecret,
        String redirectUri,
        String profileUrl,
        String accessTokenUrl,
        String authorizationCode
) {

}
