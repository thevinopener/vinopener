package com.ssafy.vinopener.domain.wine.service;

import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetListResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.mapper.WineMapper;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class WineService {

    private final WineRepository wineRepository;
    private final WineMapper wineMapper;

    @Transactional(readOnly = true)
    public List<WineGetListResponse> getList() {
        return wineRepository.findAll().stream()
                .map(wineMapper::toGetListResponse)
                .toList();
    }

    @Transactional
    public WineGetResponse get(final Long wineId) {
        return wineRepository.findById(wineId)
                .map(WineEntity::increaseView)
                .map(wineMapper::toGetResponse)
                .orElseThrow(() -> new VinopenerException(WineErrorCode.WINE_NOT_FOUND));
    }

}
