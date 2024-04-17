package com.ssafy.vinopener.domain.wine.service;

import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.data.mapper.WineMapper;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class WineService {
    private final WineRepository wineRepository;
    private final WineMapper wineMapper;

    @Transactional(readOnly = true)
    public List<WineGetResponse> getList() {
        return wineRepository.findAll().stream()
                .map(wineMapper::toGetResponse)
                .toList();
    }

    @Transactional
    public WineGetResponse get(final Long wineId) {
        return wineRepository.findById(wineId)
                .map(wine -> {
                    wine.updateView();
                    return wineMapper.toGetResponse(wine);
                })
                .orElseThrow(() -> new VinopenerException(WineErrorCode.WINE_NOT_FOUND));
    }
}
