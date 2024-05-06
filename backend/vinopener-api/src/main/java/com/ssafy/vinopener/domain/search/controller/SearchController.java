package com.ssafy.vinopener.domain.search.controller;

import com.ssafy.vinopener.domain.search.data.dto.request.SearchCreateRequest;
import com.ssafy.vinopener.domain.search.data.dto.response.SearchGetListResponse;
import com.ssafy.vinopener.domain.search.service.SearchService;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(SearchController.REQUEST_PATH)
@RequiredArgsConstructor
public class SearchController {

    public static final String REQUEST_PATH = "/searches";
    public static final String REQUEST_PATH_VARIABLE = "/{searchId}";
    private final SearchService searchService;

    /**
     * 검색 기록 생성
     *
     * @param searchCreateRequest 검색기록 생성 요청
     * @param userId              유저 ID
     */
    @PostMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER),
            responses = @ApiResponse(responseCode = "201", headers = @Header(
                    name = HttpHeaders.LOCATION, description = REQUEST_PATH + REQUEST_PATH_VARIABLE
            )))
    public ResponseEntity<Void> createSearch(
            @RequestBody @Valid final SearchCreateRequest searchCreateRequest,
            @UserPrincipalId final Long userId
    ) {
        return ResponseEntity
                .created(URI.create(REQUEST_PATH + "/" + searchService.create(searchCreateRequest, userId)))
                .build();
    }

    /**
     * 검색 기록 목록 조회
     *
     * @param userId 유저 ID
     */
    @GetMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<List<SearchGetListResponse>> getList(
            @UserPrincipalId final Long userId
    ) {
        return ResponseEntity.ok(searchService.getList(userId));
    }

    /**
     * 검색 기록 개별 삭제
     *
     * @param searchId 검색 기록 ID
     * @param userId   유저 ID
     */
    @DeleteMapping("/each" + "/{searchId}")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<Void> delete(
            @PathVariable final Long searchId,
            @RequestParam final Long userId
    ) {
        searchService.delete(searchId, userId);
        return ResponseEntity.noContent().build();
    }

    /**
     * 검색 기록 전체 삭제
     *
     * @param userId 유저 ID
     */
    @DeleteMapping("/all" + "/{userId}")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<Void> deleteAll(
            @RequestParam final Long userId
    ) {
        searchService.deleteAll(userId);
        return ResponseEntity.noContent().build();
    }

}
