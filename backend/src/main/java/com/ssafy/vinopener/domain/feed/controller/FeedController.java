package com.ssafy.vinopener.domain.feed.controller;

import com.ssafy.vinopener.domain.feed.data.dto.request.FeedCreateRequest;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse;
import com.ssafy.vinopener.domain.feed.service.FeedService;
import com.ssafy.vinopener.global.annotations.UserPrincipalId;
import com.ssafy.vinopener.global.config.SwaggerConfig;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.headers.Header;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import java.io.IOException;
import java.net.URI;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(FeedController.REQUEST_PATH)
@RequiredArgsConstructor
public class FeedController {

    public static final String REQUEST_PATH = "/feeds";
    public static final String REQUEST_PATH_VARIABLE = "/{feedId}";
    private final FeedService feedService;

    /**
     * 피드 생성
     *
     * @param feedCreateRequest 피드 생성 요청
     * @param userId            유저 ID
     * @return
     */
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER),
            responses = @ApiResponse(responseCode = "201", headers = @Header(
                    name = HttpHeaders.LOCATION, description = REQUEST_PATH + REQUEST_PATH_VARIABLE
            )))
    public ResponseEntity<Void> createFeed(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    content = @Content(
                            mediaType = MediaType.MULTIPART_FORM_DATA_VALUE,
                            schema = @Schema(implementation = FeedCreateRequest.class)
                    ),
                    required = true,
                    description = "The multipart request containing feed data and an image file"
            )
            @ModelAttribute @Valid FeedCreateRequest feedCreateRequest,
            @UserPrincipalId final Long userId
    ) throws NoSuchAlgorithmException, IOException {
        Long feedId = feedService.create(feedCreateRequest, userId);
//        URI location = URI.create(REQUEST_PATH + "/" + feedId);
//        return ResponseEntity.created(location).build();
        return ResponseEntity
                .created(URI.create(REQUEST_PATH + "/" + feedService.create(feedCreateRequest, feedId)))
                .build();
    }

    /**
     * 피드 전체 목록 조회
     *
     * @param userId
     * @return
     */
//    @GetMapping
//    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
//    public ResponseEntity<List<FeedGetListResponse>> getListFeed(
//            // TODO: pagination 추가
//            @UserPrincipalId final Long userId
//    ) {
//        return ResponseEntity.ok(feedService.getList(userId));
//    }

//    @GetMapping(REQUEST_PATH_VARIABLE)
//    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
//    public ResponseEntity<FeedGetResponse> getFeed(
//            @PathVariable final Long feedId,
//            @UserPrincipalId final Long userId
//    ) {
////        return ResponseEntity.ok(feedService.get)
//    }
    @GetMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public List<FeedGetListResponse> getListFeed(
    ) {
        // TODO : Paginaiton 추가
        return feedService.getList();
    }

}
