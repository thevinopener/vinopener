package com.ssafy.vinopener.domain.aichat.data.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ssafy.vinopener.global.config.TimeFormatConfig;
import io.swagger.v3.oas.annotations.media.Schema;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import lombok.Builder;
import org.springframework.lang.Nullable;

@Builder
public record AiChatCreateResponse(
        Long id,
        @Nullable AiChatCreateResponseCommand command,
        String message,
        @Schema(type = "string", example = TimeFormatConfig.LOCAL_DATE_TIME_EXAMPLE)
        @JsonFormat(pattern = TimeFormatConfig.LOCAL_DATE_TIME_PATTERN)
        LocalDateTime createdTime
) {

    @Builder
    public record AiChatCreateResponseCommand(
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
