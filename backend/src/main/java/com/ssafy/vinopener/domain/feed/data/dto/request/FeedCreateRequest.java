package com.ssafy.vinopener.domain.feed.data.dto.request;

import jakarta.validation.constraints.NotNull;
import java.util.Set;
import org.springframework.web.multipart.MultipartFile;

public record FeedCreateRequest(
        @NotNull String content,

        // 피드 내용 이미지
        MultipartFile imageFile,
        @NotNull boolean isPublic,

        @NotNull Set<Long> wineIds

) {

}
