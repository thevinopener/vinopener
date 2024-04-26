package com.ssafy.vinopener.global.oauth2.dto.response;

import lombok.Builder;

@Builder
public record GoogleAccountProfileResponse(
        Long id,
        String givenName,
        String name,
        String email,
        Boolean verifiedEmail,
        String picture
) {

}
