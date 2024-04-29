package com.ssafy.vinopener.domain.feed.data.dto.request;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public record FeedCreateRequest(
        String content,
        MultipartFile imageFile,
        boolean isPublic,

        List<Long> wineIds
) {

}
