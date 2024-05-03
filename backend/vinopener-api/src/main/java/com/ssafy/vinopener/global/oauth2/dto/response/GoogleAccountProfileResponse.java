package com.ssafy.vinopener.global.oauth2.dto.response;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Builder;

@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public record GoogleAccountProfileResponse(
        String id,
        String givenName,
        String name,
        String email,
        Boolean verifiedEmail,
        String picture
) {

}
