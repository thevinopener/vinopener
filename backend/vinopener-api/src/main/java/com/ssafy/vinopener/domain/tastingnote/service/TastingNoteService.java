package com.ssafy.vinopener.domain.tastingnote.service;

import com.ssafy.vinopener.domain.tastingnote.data.dto.request.TastingNoteCreateRequest;
import com.ssafy.vinopener.domain.tastingnote.data.dto.request.TastingNoteUpdateRequest;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetListResponse;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse;
import com.ssafy.vinopener.domain.tastingnote.data.mapper.TastingNoteMapper;
import com.ssafy.vinopener.domain.tastingnote.exception.TastingNoteErrorCode;
import com.ssafy.vinopener.domain.tastingnote.repository.TastingNoteRepository;
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
     * 테이스팅노트 생성
     *
     * @param tastingNoteCreateRequest 테이스팅노트 생성 요청
     * @param userId                   유저 ID
     * @return 테이스팅노트 ID
     */
    @Transactional
    public Long create(
            final TastingNoteCreateRequest tastingNoteCreateRequest,
            final Long userId
    ) {
        return tastingNoteRepository
                .save(tastingNoteMapper.toEntity(tastingNoteCreateRequest, userId))
                .getId();
    }

    /**
     * 테이스팅노트 목록 조회
     *
     * @param userId 유저 ID
     * @return 테이스팅노트 목록
     */
    @Transactional(readOnly = true)
    public List<TastingNoteGetListResponse> getList(
            final Long userId
    ) {
        return tastingNoteRepository.findAllByUserId(userId).stream()
                .map(tastingNoteMapper::toGetListResponse)
                .toList();
    }

    /**
     * 테이스팅노트 상세 조회
     *
     * @param tastingNoteId 테이스팅노트 ID
     * @param userId        유저 ID
     * @return 테이스팅노트
     */
    @Transactional(readOnly = true)
    public TastingNoteGetResponse get(
            final Long tastingNoteId,
            final Long userId
    ) {
        return tastingNoteRepository.findByIdAndUserId(tastingNoteId, userId)
                .map(tastingNoteMapper::toGetResponse)
                .orElseThrow(() -> new VinopenerException(TastingNoteErrorCode.TASTING_NOTE_NOT_FOUND));
    }

    /**
     * 테이스팅노트 수정
     *
     * @param tastingNoteId            테이스팅노트 ID
     * @param tastingNoteUpdateRequest 테이스팅노트 수정 요청
     * @param userId                   유저 ID
     */
    @Transactional
    public void update(
            final Long tastingNoteId,
            final TastingNoteUpdateRequest tastingNoteUpdateRequest,
            final Long userId
    ) {
        tastingNoteRepository.save(tastingNoteMapper.toEntity(tastingNoteId, tastingNoteUpdateRequest));
    }

    /**
     * 테이스팅노트 삭제
     *
     * @param tastingNoteId 테이스팅노트 ID
     * @param userId        유저 ID
     */
    @Transactional
    public void delete(
            final Long tastingNoteId,
            final Long userId
    ) {
        tastingNoteRepository.deleteByIdAndUserId(tastingNoteId, userId);
    }

}