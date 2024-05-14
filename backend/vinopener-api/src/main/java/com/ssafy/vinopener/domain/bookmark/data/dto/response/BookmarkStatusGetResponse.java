package com.ssafy.vinopener.domain.bookmark.data.dto.response;

import lombok.Builder;

@Builder
public record BookmarkStatusGetResponse(
        boolean isBookmark
) {

}
