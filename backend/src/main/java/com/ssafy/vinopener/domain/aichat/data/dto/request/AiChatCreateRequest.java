package com.ssafy.vinopener.domain.aichat.data.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record AiChatCreateRequest(
        @NotBlank @Size(max = 255) String message
) {

}
