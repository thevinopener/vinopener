package com.ssafy.vinopener.domain.bookmark.controller;

import com.ssafy.vinopener.domain.bookmark.data.dto.request.BookmarkCreateRequest;
import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkGetListResponse;
import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkStatusGetResponse;
import com.ssafy.vinopener.domain.bookmark.service.BookmarkService;
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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
@RequestMapping(BookmarkController.REQUEST_PATH)
@RequiredArgsConstructor
public class BookmarkController {

    public static final String REQUEST_PATH = "/bookmarks";
    public static final String REQUEST_PATH_VARIABLE = "/{bookmarkId}";
    private final BookmarkService bookmarkService;

    /**
     * 즐겨찾기 생성
     *
     * @param bookmarkCreateRequest 즐겨찾기 생성 요청
     * @param userId                유저 ID
     * @return 생성된 즐겨찾기 PATH
     */
    @PostMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER),
            responses = @ApiResponse(responseCode = "201", headers = @Header(
                    name = HttpHeaders.LOCATION, description = REQUEST_PATH + REQUEST_PATH_VARIABLE)))
    public ResponseEntity<Void> createBookmark(
            @RequestBody @Valid final BookmarkCreateRequest bookmarkCreateRequest,
            @UserPrincipalId final Long userId
    ) {
        return ResponseEntity
                .created(URI.create(REQUEST_PATH + "/" + bookmarkService.create(bookmarkCreateRequest, userId)))
                .build();
    }

    /**
     * 즐겨찾기 목록 조회
     *
     * @param userId 유저 ID
     * @return 즐겨찾기 목록
     */
    @GetMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<List<BookmarkGetListResponse>> getListBookmark(
            @UserPrincipalId final Long userId
    ) {
        List<BookmarkGetListResponse> bookmarks = bookmarkService.getList(userId);
        return ResponseEntity.ok(bookmarks);
    }

    /**
     * 즐겨찾기 목록 조회 : 페이지 네이션
     *
     * @param userId 유저 ID
     * @param page   시작 페이지(생략 가능, 0)
     * @param size   페이지 당 출력 개수(생략 가능, 10)
     * @param sort   정렬 기준(생략 가능, ID)
     * @return 즐겨찾기 목록
     */
    @GetMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<Page<BookmarkGetListResponse>> getListBookmark(
            @UserPrincipalId final Long userId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sort
    ) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sort));
        return ResponseEntity.ok(bookmarkService.getPageList(userId, pageable));
    }

    /**
     * 즐겨찾기 삭제
     *
     * @param bookmarkId 삭제할 즐겨찾기 ID
     * @param userId     유저 ID
     */
    @DeleteMapping("/{bookmarkId}")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<Void> deleteBookmark(
            @PathVariable final Long bookmarkId,
            @UserPrincipalId final Long userId
    ) {
        bookmarkService.delete(bookmarkId, userId);
        return ResponseEntity.noContent().build();
    }

    /**
     * 즐겨찾기 삭제 : wineId
     *
     * @param wineId 와인 ID
     * @param userId 유저 ID
     */
    @DeleteMapping("delete/{wineId}")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<Void> deleteByWineId(
            @PathVariable final Long wineId,
            @UserPrincipalId final Long userId) {
        bookmarkService.deleteByWineId(wineId, userId);
        return ResponseEntity.noContent().build();
    }

    /**
     * 즐겨찾기 존재 여부
     *
     * @param wineId 와인 ID
     * @param userId 유저 ID
     */
    @GetMapping("/{wineId}")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<BookmarkStatusGetResponse> getBookmarkStatus(
            @PathVariable final Long wineId,
            @UserPrincipalId final Long userId
    ) {
        BookmarkStatusGetResponse response = bookmarkService.getBookmarkStatus(wineId, userId);
        return ResponseEntity.ok(response);
    }

}
