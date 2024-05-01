package com.ssafy.vinopener.domain.aichat.data.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import java.math.BigDecimal;
import java.util.List;
import lombok.Builder;
import org.springframework.lang.Nullable;

/**
 * openai snake_case 권장
 */
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public record AiChatCreateAiMessageInfo(
        @Nullable AiChatCreateResponseAiMessageInfoCommand command,
        String message
) {

    @Builder
    public record AiChatCreateResponseAiMessageInfoCommand(
            CommandSection section,
            CommandColor color,
            List<CommandFlavour> flavours,
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

        @Builder
        public record CommandColor(
                Long id,
                String name
        ) {

        }

        @Builder
        public record CommandFlavour(
                Long id,
                String taste
        ) {

        }

    }

}
