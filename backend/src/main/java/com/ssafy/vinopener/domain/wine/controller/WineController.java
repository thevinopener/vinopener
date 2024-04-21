package com.ssafy.vinopener.domain.wine.controller;

import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetListResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.service.WineService;
import io.swagger.v3.oas.annotations.Operation;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/wines")
@RequiredArgsConstructor
public class WineController {

    private final WineService wineService;

    @GetMapping
    @Operation(summary = "와인 목록 조회")
    public ResponseEntity<List<WineGetListResponse>> getList(
        // TODO: pagination 추가
    ) {
        return ResponseEntity.ok(wineService.getList());
    }

    @GetMapping("/{wineId}")
    @Operation(summary = "와인 상세 조회")
    public ResponseEntity<WineGetResponse> get(
        @PathVariable final Long wineId
    ) {
        return ResponseEntity.ok(wineService.get(wineId));
    }
}
