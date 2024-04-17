package com.ssafy.vinopener.domain.wine.controller;

import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.service.WineService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/wines")
@RequiredArgsConstructor
public class WineController {
    private final WineService wineService;

    @GetMapping
    public ResponseEntity<List<WineGetResponse>> getList(
            // TODO: pagination 추가
    ) {
        return ResponseEntity.ok(wineService.getList());
    }

    @GetMapping("/{wineId}")
    public ResponseEntity<WineGetResponse> get(
            @PathVariable final Long wineId
    ) {
        return ResponseEntity.ok(wineService.get(wineId));
    }
}
