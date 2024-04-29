package com.ssafy.vinopener.domain.feed.data.dto.request;

import jakarta.validation.constraints.NotNull;
import java.util.Set;
import org.springframework.web.multipart.MultipartFile;

public record FeedCreateRequest(
        @NotNull String content,
        MultipartFile imageFile,
        @NotNull boolean isPublic,

        Set<Long> feedLikeId,

        Set<Long> feedWineId

) {

}
