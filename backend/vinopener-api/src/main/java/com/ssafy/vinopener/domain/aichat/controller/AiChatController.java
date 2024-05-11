package com.ssafy.vinopener.domain.aichat.controller;

import com.ssafy.vinopener.domain.aichat.data.dto.request.AiChatCreateRequest;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatCreateResponse;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatGetListResponse;
import com.ssafy.vinopener.domain.aichat.service.AiChatService;
import com.ssafy.vinopener.global.annotations.UserPrincipalId;
import com.ssafy.vinopener.global.config.SwaggerConfig;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.headers.Header;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import java.net.URI;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AiChatController.REQUEST_PATH)
@RequiredArgsConstructor
public class AiChatController {

    public static final String REQUEST_PATH = "/ai-chats";
    private final AiChatService aiChatService;

    /**
     * AI채팅 생성
     * <p>
     * 챗봇의 응답을 반환합니다.
     *
     * @param aiChatCreateRequest AI채팅 생성 요청
     * @param userId              유저 ID
     * @return AI채팅 챗봇 응답
     */
    @PostMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER),
            responses = @ApiResponse(responseCode = "201", headers = @Header(
                    name = HttpHeaders.LOCATION, description = REQUEST_PATH)))
    public ResponseEntity<AiChatCreateResponse> createAiChat(
            @RequestBody @Valid final AiChatCreateRequest aiChatCreateRequest,
            @UserPrincipalId final Long userId
    ) {
        return ResponseEntity
                .created(URI.create(REQUEST_PATH))
                .body(aiChatService.create(aiChatCreateRequest, userId));
    }

    /**
     * AI채팅 목록 조회
     *
     * @param userId 유저 ID
     * @return AI채팅 목록
     */
    @GetMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<List<AiChatGetListResponse>> getListAiChat(
            @UserPrincipalId final Long userId
    ) {
        return ResponseEntity.ok(aiChatService.getList(userId));
    }

    /**
     * AI채팅 목록 초기화
     *
     * @param userId 유저 ID
     */
    @DeleteMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<Void> clearAiChat(
            @UserPrincipalId final Long userId
    ) {
        aiChatService.clear(userId);
        return ResponseEntity.noContent().build();
    }

}
