package com.ssafy.vinopener.global.oauth2.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;

@Builder
public record GoogleAccountProfileResponse(
        @JsonProperty("id") String id,
        @JsonProperty("given_name") String givenName,
        @JsonProperty("name") String name,
        @JsonProperty("email") String email,
        @JsonProperty("verified_email") Boolean verifiedEmail,
        @JsonProperty("picture") String picture
) {

}
