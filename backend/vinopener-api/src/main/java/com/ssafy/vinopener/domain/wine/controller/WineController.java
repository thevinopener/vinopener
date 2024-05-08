package com.ssafy.vinopener.domain.wine.controller;

import com.ssafy.vinopener.domain.search.service.SearchService;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetListResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineTypeGetListResponse;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.domain.wine.service.WineService;
import com.ssafy.vinopener.global.annotations.UserPrincipalId;
import com.ssafy.vinopener.global.config.SwaggerConfig;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import java.util.Collections;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(WineController.REQUEST_PATH)
@RequiredArgsConstructor
public class WineController {

    public static final String REQUEST_PATH = "/wines";
    public static final String REQUEST_PATH_VARIABLE = "/{wineId}";

    private final WineService wineService;
    private final SearchService searchService;

    /**
     * 와인 목록 조회
     * <p>
     * 검색 조건에 따라 와인 목록을 조회합니다. 페이지네이션이 있습니다.
     *
     * @return 와인 목록
     */
//    @GetMapping
//    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
//    public ResponseEntity<List<WineGetListResponse>> getListWine(
//            // TODO: pagination 추가
//    ) {
//        return ResponseEntity.ok(wineService.getList());
//    }

    /**
     * 와인 상세 조회
     *
     * @param wineId 와인 ID
     * @return 와인
     */
//    @GetMapping("/{wineId}")
//    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
//    public ResponseEntity<WineGetResponse> getWine(
//            @PathVariable final Long wineId
//    ) {
//        return ResponseEntity.ok(wineService.get(wineId));
//    }

    /**
     * 와인 목록 조회(북마크, 셀러, 테이스팅 노트 여부 포함)
     *
     * @param userId 유저 ID
     */
    @GetMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<List<WineGetListResponse>> getListWine(
            @UserPrincipalId final Long userId
    ) {
        // TODO : 페이지네이션
        return ResponseEntity.ok(wineService.getList(userId));
    }

    /**
     * 와인 상세 조회(북마크, 셀러, 테이스팅 노트 여부 포함)
     *
     * @param wineId 와인 ID
     * @param userId 유저 ID
     * @return 와인 정보
     */
    @GetMapping(REQUEST_PATH_VARIABLE)
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<WineGetResponse> getWine(
            @PathVariable final Long wineId,
            @UserPrincipalId final Long userId
    ) {
        return ResponseEntity.ok(wineService.get(wineId, userId));
    }

    /**
     * 와인 타입별 조회
     *
     * @param type 와인 타입 요청
     * @return 타입별 와인 목록
     */
    @GetMapping("/types/{type}")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<List<WineTypeGetListResponse>> getTypeList(
            @PathVariable @Valid final WineType type
    ) {
        // TODO : 페이지네이션
        return ResponseEntity.ok(wineService.getTypeList(type));
    }

    /**
     * 와인 검색
     *
     * @param query 검색어
     * @return 검색어에 해당하는 와인 목록
     */
    @GetMapping("/search")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<List<WineEntity>> searchWine(
            @RequestParam(value = "query", required = false) String query,
            @UserPrincipalId final Long userId
    ) {
        if (query != null && !query.trim().isEmpty()) {
            searchService.create(query, userId);
            return ResponseEntity.ok(wineService.searchWine(query));
        } else {
            return ResponseEntity.ok(Collections.emptyList());
        }
    }

}
