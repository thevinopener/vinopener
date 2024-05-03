package com.ssafy.vinopener.domain.user.data.dto.response;

import lombok.Builder;

@Builder
public record UserGetResponse(
        Long id,
        String email,
        String nickname,
        String imageUrl
) {

}
