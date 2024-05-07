package com.ssafy.vinopener.domain.wine.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.math.BigDecimal;
import java.util.List;
import lombok.Builder;

@Builder
public record WineGetResponse(
        Long id,
        String name,
        String seoName,
        String imageUrl,
        String grape,
        String winery,
        String country,
        BigDecimal price,
        BigDecimal rating,
        Integer vintage,
        WineType type,
        BigDecimal acidity,
        BigDecimal intensity,
        BigDecimal sweetness,
        BigDecimal tannin,
        BigDecimal abv,
        Integer view,

        // 북마크 추가 여부
        boolean isBookmark,

        // 셀러 추가 여부
        boolean isCellar,

        // 작성한 테이스팅 노트 개수
        int totalNotes,

        List<WineGetListResponseFlavourTaste> tastes
) {

    @Builder
    public record WineGetListResponseFlavourTaste(
            Long id,
            String name
    ) {

    }

}
