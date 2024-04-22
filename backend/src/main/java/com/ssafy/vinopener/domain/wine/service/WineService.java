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

    /**
     * 와인 목록 조회
     *
     * @return 와인 목록
     */
    @Transactional(readOnly = true)
    public List<WineGetListResponse> getList() {
        return wineRepository.findAll().stream()
                .map(wineMapper::toGetListResponse)
                .toList();
    }

    /**
     * 와인 상세 조회
     * <p>
     * 조회수를 갱신합니다.
     *
     * @param wineId 와인 ID
     * @return 와인
     */
    @Transactional
    public WineGetResponse get(final Long wineId) {
        return wineRepository.findById(wineId)
                .map(WineEntity::increaseView)
                .map(wineMapper::toGetResponse)
                .orElseThrow(() -> new VinopenerException(WineErrorCode.WINE_NOT_FOUND));
    }

}
