package com.ssafy.vinopener.domain.aichat.data.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import java.math.BigDecimal;
import java.util.List;
import lombok.Builder;

/**
 * openai snake_case 권장
 */
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public record AiChatCreateAiMessageInfo(
        AiChatCreateAiMessageInfoSection section,
        AiChatCreateResponseAiMessageInfoState newState,
        String message
) {

    public enum AiChatCreateAiMessageInfoSection {
        WINE,
        COLOR,
        FLAVOUR,
        SWEETNESS,
        INTENSITY,
        ACIDITY,
        ALCOHOL,
        TANNIN,
        OPINION,
        RATING,
        COMPLETE,
        EXIT
    }

    @Builder
    public record AiChatCreateResponseAiMessageInfoState(
            String color,
            List<String> flavours,
            BigDecimal sweetness,
            BigDecimal intensity,
            BigDecimal acidity,
            BigDecimal alcohol,
            BigDecimal tannin,
            String opinion,
            BigDecimal rating
    ) {

    }

}
