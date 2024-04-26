package com.ssafy.vinopener.domain.chat.data.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record WineChatCreateRequest(
        @NotBlank @Size(max = 255) String message
) {

}
