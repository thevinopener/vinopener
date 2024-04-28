package com.ssafy.vinopener.global.oauth2.dto.request;

public record GoogleAccessTokenRequest(
        String clientId,
        String clientSecret,
        String code,
        String grant_type,
        String redirect_uri
) {

}
