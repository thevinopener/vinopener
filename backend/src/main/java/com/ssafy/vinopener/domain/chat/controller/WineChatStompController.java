package com.ssafy.vinopener.domain.chat.controller;

import com.ssafy.vinopener.domain.chat.data.dto.request.WineChatCreateRequest;
import com.ssafy.vinopener.domain.chat.data.dto.response.WineChatGetOrGetListResponse;
import com.ssafy.vinopener.domain.chat.service.WineChatService;
import com.ssafy.vinopener.global.common.UserDetailsId;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(WineChatStompController.REQUEST_PATH)
@RequiredArgsConstructor
public class WineChatStompController {

    public static final String REQUEST_PATH = "/wines/{wineId}/chat";
    private final WineChatService wineChatService;
    private final SimpMessagingTemplate messagingTemplate;

    @MessageMapping(REQUEST_PATH)
    @SendTo("/sub" + REQUEST_PATH)
    public WineChatGetOrGetListResponse createChatWineChat(
            @DestinationVariable("wineId") Long wineId,
            WineChatCreateRequest wineChatCreateRequest,
            @UserDetailsId final Long userId
    ) {
        return wineChatService.createAndGet(wineChatCreateRequest, wineId, userId);
    }

}
