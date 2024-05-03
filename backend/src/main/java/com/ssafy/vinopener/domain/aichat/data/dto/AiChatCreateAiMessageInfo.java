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
        AiChatCreateResponseAiMessageInfoCommand command,
        String message
) {

    @Builder
    public record AiChatCreateResponseAiMessageInfoCommand(
            CommandSection section,
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

        public enum CommandSection {
            WINE,
            COLOR,
            FLAVOUR,
            STRUCTURE,
            OPINION,
            RATING,
            COMPLETE,
            EXIT
        }

    }

}
