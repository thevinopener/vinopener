package com.ssafy.vinopener.domain.tastingnote.service;

import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetListResponse;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse;
import com.ssafy.vinopener.domain.tastingnote.data.mapper.TastingNoteMapper;
import com.ssafy.vinopener.domain.tastingnote.exception.TastingNoteErrorCode;
import com.ssafy.vinopener.domain.tastingnote.repository.TastingNoteRepository;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.global.exception.VinopenerException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class TastingNoteService {

    private final TastingNoteRepository tastingNoteRepository;
    private final TastingNoteMapper tastingNoteMapper;

    /**
     * 와인 목록 조회
     *
     * @return 와인 목록
     */
    @Transactional(readOnly = true)
    public List<TastingNoteGetListResponse> getList() {
        return tastingNoteRepository.findAll().stream()
                .map(tastingNoteMapper::toGetListResponse)
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
    public TastingNoteGetResponse get(final Long wineId) {
        return tastingNoteRepository.findById(wineId)
                .map(tastingNoteMapper::toGetResponse)
                .orElseThrow(() -> new VinopenerException(TastingNoteErrorCode.TASTING_NOTE_NOT_FOUND));
    }

}
