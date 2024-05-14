package com.ssafy.vinopener.domain.cellar.controller;

import com.ssafy.vinopener.domain.cellar.data.dto.request.CellarCreateRequest;
import com.ssafy.vinopener.domain.cellar.data.dto.request.CellarUpdateRequest;
import com.ssafy.vinopener.domain.cellar.data.dto.response.CellarGetListResponse;
import com.ssafy.vinopener.domain.cellar.data.dto.response.CellarStatusGetResponse;
import com.ssafy.vinopener.domain.cellar.service.CellarService;
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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(CellarController.REQUEST_PATH)
@RequiredArgsConstructor
public class CellarController {

    public static final String REQUEST_PATH = "/cellars";
    public static final String REQUEST_PATH_VARIABLE = "/{cellarId}";
    private final CellarService cellarService;

    /**
     * 셀러 아이템 생성
     *
     * @param cellarCreateRequest 셀러 아이템 생성 요청
     * @param userId              유저 ID
     */
    @PostMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER),
            responses = @ApiResponse(responseCode = "201", headers = @Header(
                    name = HttpHeaders.LOCATION, description = REQUEST_PATH + REQUEST_PATH_VARIABLE
            )))
    public ResponseEntity<Void> createCellar(
            @RequestBody @Valid final CellarCreateRequest cellarCreateRequest,
            @UserPrincipalId final Long userId
    ) {
        return ResponseEntity
                .created(URI.create(REQUEST_PATH + "/" + cellarService.create(cellarCreateRequest, userId)))
                .build();
    }

    /**
     * 셀러 아이템 목록 조회
     *
     * @param userId 유저 ID
     * @return 셀러 아이템 목록
     */
    @GetMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<List<CellarGetListResponse>> getListCellar(
            // TODO: pagination 추가
            @UserPrincipalId final Long userId
    ) {
        return ResponseEntity.ok(cellarService.getList(userId));
    }

    /**
     * 셀러 아이템 목록 조회 : 페이지 네이션
     *
     * @param userId 유저 ID
     * @param page   시작 페이지(생략 가능, 0)
     * @param size   페이지 당 출력 개수(생략 가능, 10)
     * @param sort   정렬 기준(생략 가능, ID)
     * @return 셀러 아이템 목록
     */
//    @GetMapping
//    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
//    public ResponseEntity<Page<CellarGetListResponse>> getListCellar(
//            @UserPrincipalId final Long userId,
//            @RequestParam(defaultValue = "0") int page,
//            @RequestParam(defaultValue = "10") int size,
//            @RequestParam(defaultValue = "id") String sort
//
//    ) {
//        Pageable pageable = PageRequest.of(page, size, Sort.by(sort));
//        return ResponseEntity.ok(cellarService.getList(userId, pageable));
//    }

    /**
     * 셀러 아이템 상세 조회
     *
     * @param cellarId 셀러 ID
     * @param userId   유저 ID
     * @return 셀러 아이템 상세 정보
     */
//    @GetMapping(REQUEST_PATH_VARIABLE)
//    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
//    public ResponseEntity<CellarGetResponse> getCellar(
//            @PathVariable final Long cellarId,
//            @UserPrincipalId final Long userId
//    ) {
//        return ResponseEntity.ok(cellarService.get(cellarId, userId));
//    }

    /**
     * 셀러 아이템 존재 여부
     *
     * @param wineId 와인 ID
     * @param userId 유저 ID
     */
    @GetMapping({"/{wineId}"})
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<CellarStatusGetResponse> getCellarStatus(
            @PathVariable final Long wineId,
            @UserPrincipalId final Long userId
    ) {
        CellarStatusGetResponse response = cellarService.getCellarStatus(wineId, userId);
        return ResponseEntity.ok(response);
    }

    /**
     * 셀러 아이템 수정(마신 날짜)
     *
     * @param cellarId            셀러 아이템 ID
     * @param cellarUpdateRequest 셀러 수정 요청
     * @param userId              유저 ID
     */
    @PutMapping(REQUEST_PATH_VARIABLE)
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<Void> updateCellar(
            @PathVariable final Long cellarId,
            @RequestBody @Valid final CellarUpdateRequest cellarUpdateRequest,
            @UserPrincipalId final Long userId
    ) {
        cellarService.update(cellarId, cellarUpdateRequest, userId);
        return ResponseEntity.noContent().build();
    }

    /**
     * 셀러 아이템 삭제
     *
     * @param cellarId 셀러 아이템 ID
     * @param userId   유저 ID
     */
    @DeleteMapping(REQUEST_PATH_VARIABLE)
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<Void> deleteCellar(
            @PathVariable final Long cellarId,
            @UserPrincipalId final Long userId
    ) {
        cellarService.delete(cellarId, userId);
        return ResponseEntity.noContent().build();
    }

    /**
     * 셀러 아이템 삭제 : wineID
     *
     * @param wineId 와인 ID
     * @param userId 유저 ID
     */
    @DeleteMapping("/delete" + "/{wineId}")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<Void> deleteByWineId(
            @PathVariable final Long wineId,
            @UserPrincipalId final Long userId
    ) {
        cellarService.deleteByWineId(wineId, userId);
        return ResponseEntity.noContent().build();
    }

}
