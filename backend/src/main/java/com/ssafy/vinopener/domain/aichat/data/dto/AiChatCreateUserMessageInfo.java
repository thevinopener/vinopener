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
public record AiChatCreateUserMessageInfo(
        AiChatCreateUserMessageInfoState state,
        String message
) {

    @Builder
    public record AiChatCreateUserMessageInfoState(
            Boolean created,
            String wineName,
            String colorName,
            List<String> flavourTasteNames,
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
