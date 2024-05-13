package com.ssafy.vinopener.domain.wine.controller;

import com.ssafy.vinopener.domain.search.service.SearchService;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetListResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineTypeGetListResponse;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.domain.wine.service.WineService;
import com.ssafy.vinopener.global.annotations.UserPrincipalId;
import com.ssafy.vinopener.global.config.SwaggerConfig;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import java.util.Collections;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

    private static final Logger logger = LoggerFactory.getLogger(WineController.class);

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
//    @GetMapping
//    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
//    public ResponseEntity<List<WineGetListResponse>> getListWine(
//            @UserPrincipalId final Long userId
//    ) {
//        // TODO : 페이지네이션
//        return ResponseEntity.ok(wineService.getList(userId));
//    }

    /**
     * 와인 목록 조회 : 페이지네이션
     *
     * @param userId 유저 ID
     * @param page   시작 페이지(생략 가능, 0)
     * @param size   페이지 당 출력 개수(생략 가능, 10)
     * @param sort   정렬 기준(생략 가능, ID)
     * @return 와인 목록
     */
    @GetMapping
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<Page<WineGetListResponse>> getListWine(
            @UserPrincipalId final Long userId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sort
    ) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sort));
        logger.info("@@@ 페이지네이션 -> page: {}, size: {}, sort: {}", page, size, sort);
        return ResponseEntity.ok(wineService.getList(userId, pageable));
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
//    @GetMapping("/types/{type}")
//    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
//    public ResponseEntity<List<WineTypeGetListResponse>> getTypeList(
//            @PathVariable @Valid final WineType type
//    ) {
//        // TODO : 페이지네이션
//        return ResponseEntity.ok(wineService.getTypeList(type));
//    }

    /**
     * 와인 타입별 조회 : 페이지네이션
     *
     * @param type 와인 타입 요청
     * @param page 시작 페이지(생략 가능, 0)
     * @param size 페이지 당 출력 개수(생략 가능, 10)
     * @param sort 정렬 기준(생략 가능, ID)
     */
    @GetMapping("/types/{type}")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<Page<WineTypeGetListResponse>> getTypeList(
            @PathVariable @Valid final WineType type,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sort
    ) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sort));
        return ResponseEntity.ok(wineService.getTypeList(type, pageable));
    }

    /**
     * 국가별 와인 검색
     *
     * @param country 국가
     * @param userId  유저ID
     */
//    @GetMapping("/country/{country}")
//    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
//    public ResponseEntity<List<WineGetListResponse>> searchCountryWine(
//            @PathVariable @Valid String country,
//            @UserPrincipalId final Long userId
//    ) {
//        return ResponseEntity.ok(wineService.getCountryList(country, userId));
//    }

    /**
     * 국가별 와인 검색 : 페이지네이션
     *
     * @param country 국가
     * @param userId  유저 ID
     * @param page    시작 페이지(생략 가능, 0)
     * @param size    페이지 당 출력 개수(생략 가능, 10)
     * @param sort    정렬 기준(생략 가능, ID)
     * @return 국가별 와인 목록
     */
    @GetMapping("/country/{country}")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<Page<WineGetListResponse>> searchCountryWine(
            @PathVariable @Valid String country,
            @UserPrincipalId final Long userId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sort
    ) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sort));
        return ResponseEntity.ok(wineService.getCountryList(country, userId, pageable));
    }

    /**
     * 일반 와인 검색
     *
     * @param query 검색어
     * @return 검색어에 해당하는 와인 목록
     */
    @GetMapping("/search")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<Page<WineGetListResponse>> searchWine(
            @RequestParam(value = "query", required = false) String query,
            @UserPrincipalId final Long userId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sort
    ) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sort));
        if (query != null && !query.trim().isEmpty()) {
            searchService.create(query, userId);
            return ResponseEntity.ok(wineService.searchWine(query, userId, pageable));
        } else {
            Page<WineGetListResponse> emptyPage = new PageImpl<>(Collections.emptyList(), pageable, 0);
            return ResponseEntity.ok(emptyPage);
        }
    }

}
