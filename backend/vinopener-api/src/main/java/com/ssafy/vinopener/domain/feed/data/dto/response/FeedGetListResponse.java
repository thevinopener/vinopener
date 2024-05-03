package com.ssafy.vinopener.domain.feed.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.math.BigDecimal;
import java.util.List;
import lombok.Builder;

@Builder
public record FeedGetListResponse(
        Long id,
        String content,
        String imageUrl,
        boolean isPublic,
        int totalLikes,

        FeedGetListUserResponse creator,

        List<FeedGetListWineResponse> wines
//        LocalDateTime createdTime

) {

    @Builder
    public record FeedGetListWineResponse(
            Long id,
            String name,
            String seoName,
            String imageUrl,
            String grape,
            String winery,
            String country,
            BigDecimal price,
            BigDecimal rating,
            BigDecimal vintage,
            WineType type,
            BigDecimal acidity,
            BigDecimal intensity,
            BigDecimal sweetness,
            BigDecimal tannin,
            BigDecimal abv,
            Integer view
    ) {

    }

    @Builder
    public record FeedGetListUserResponse(
            Long id,
            String nickname,
            String imageUrl
    ) {

    }

}
