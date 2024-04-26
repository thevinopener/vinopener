package com.ssafy.vinopener.domain.chat.controller;

import com.ssafy.vinopener.domain.chat.data.dto.response.WineChatGetOrGetListResponse;
import com.ssafy.vinopener.domain.chat.service.WineChatService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(WineChatController.REQUEST_PATH)
@RequiredArgsConstructor
public class WineChatController {

    public static final String REQUEST_PATH = "/wines/{wineId}/chat";
    private final WineChatService wineChatService;

    /**
     * 와인채팅 목록 조회
     *
     * @param wineId 와인 ID
     * @return 와인채팅 목록
     */
    @GetMapping
    public ResponseEntity<List<WineChatGetOrGetListResponse>> getListWineChat(
            @PathVariable final Long wineId
    ) {
        return ResponseEntity.ok(wineChatService.getList(wineId));
    }

}
