package com.ssafy.vinopener.domain.chat.controller;

import com.ssafy.vinopener.domain.chat.data.dto.request.WineChatCreateRequest;
import com.ssafy.vinopener.domain.chat.data.dto.response.WineChatGetOrGetListResponse;
import com.ssafy.vinopener.domain.chat.service.WineChatService;
import jakarta.validation.Valid;
import java.util.Objects;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

@Controller
@MessageMapping(WineChatStompController.REQUEST_PATH)
@RequiredArgsConstructor
public class WineChatStompController {

    public static final String REQUEST_PATH = "/wines/{wineId}/chat";
    private final WineChatService wineChatService;

    /**
     * 와인 채팅 생성
     *
     * @param wineId                와인 ID
     * @param wineChatCreateRequest 와인 생성 요청
     * @param accessor              유저 ID를 포함하는 header accessor
     * @return 와인 채팅
     */
    @MessageMapping
//    @SendTo("/topic" + REQUEST_PATH)
    public WineChatGetOrGetListResponse createChatWineChat(
            @DestinationVariable final Long wineId,
            @Payload @Valid final WineChatCreateRequest wineChatCreateRequest,
            SimpMessageHeaderAccessor accessor
    ) {
        final var userId = (Long) Objects.requireNonNull(accessor.getSessionAttributes()).get("userId");
        return wineChatService.createAndGet(wineChatCreateRequest, wineId, userId);
    }

}
