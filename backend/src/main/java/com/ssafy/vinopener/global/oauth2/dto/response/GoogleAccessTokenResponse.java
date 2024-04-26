package com.ssafy.vinopener.global.oauth2.dto.response;

import lombok.Builder;

@Builder
public record GoogleAccessTokenResponse(
        String accessToken,
        String expiresIn,
        String refreshToken,
        String scope,
        String tokenType

) {

}
