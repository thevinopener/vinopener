package com.ssafy.vinopener.domain.bookmark.controller;

import com.ssafy.vinopener.domain.bookmark.data.dto.request.BookmarkCreateRequest;
import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkGetListResponse;
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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(BookmarkController.REQUEST_PATH)
@RequiredArgsConstructor
public class BookmarkController {

    public static final String REQUEST_PATH = "/bookmarks";
    public static final String REQUEST_PATH_VARIABLE = "/{bookmarkId}";
    private final BookmarkService bookmarkService;

    @PostMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER),
            responses = @ApiResponse(responseCode = "201", headers = @Header(
                    name = HttpHeaders.LOCATION, description = REQUEST_PATH + REQUEST_PATH_VARIABLE)))
    public ResponseEntity<Void> createBookmark(
            @RequestBody @Valid final BookmarkCreateRequest bookmarkCreateRequest,
            @UserPrincipalId final Long userId
    ) {
        return ResponseEntity
                .created(URI.create(REQUEST_PATH + bookmarkService.create(bookmarkCreateRequest, userId)))
                .build();
    }

    @GetMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<List<BookmarkGetListResponse>> getListBookmark(
            // TODO : pagination 추가
            @UserPrincipalId final Long userId
    ) {
        List<BookmarkGetListResponse> bookmarks = bookmarkService.getList(userId);
        return ResponseEntity.ok(bookmarks);
    }

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

}
