package com.ssafy.vinopener.domain.tastingnote.service;

import com.ssafy.vinopener.domain.aichat.data.entity.AssistantThreadEntity;
import com.ssafy.vinopener.domain.aichat.repository.AssistantThreadRepository;
import com.ssafy.vinopener.domain.tastingnote.data.dto.request.TastingNoteCreateRequest;
import com.ssafy.vinopener.domain.tastingnote.data.dto.request.TastingNoteUpdateRequest;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetListResponse;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse;
import com.ssafy.vinopener.domain.tastingnote.data.mapper.TastingNoteFlavourMapper;
import com.ssafy.vinopener.domain.tastingnote.data.mapper.TastingNoteMapper;
import com.ssafy.vinopener.domain.tastingnote.exception.TastingNoteErrorCode;
import com.ssafy.vinopener.domain.tastingnote.repository.TastingNoteRepository;
import com.ssafy.vinopener.global.aiassistant.AssistantStream;
import com.ssafy.vinopener.global.exception.VinopenerException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class TastingNoteService {

    @PersistenceContext
    private final EntityManager entityManager;
    private final TastingNoteRepository tastingNoteRepository;
    private final TastingNoteMapper tastingNoteMapper;
    private final TastingNoteFlavourMapper tastingNoteFlavourMapper;
    private final AssistantThreadRepository assistantThreadRepository;
    private final AssistantStream assistantStream;

    /**
     * 테이스팅노트 생성
     *
     * @param createRequest 테이스팅노트 생성 요청
     * @param userId        유저 ID
     * @return 테이스팅노트 ID
     */
    @Transactional
    public Long create(
            final TastingNoteCreateRequest createRequest,
            final Long userId
    ) {
        final var tastingNote = tastingNoteMapper.toEntity(createRequest, userId);
        tastingNote.getFlavours().addAll(createRequest.flavourTasteIds().stream()
                .map(flavourTasteId -> tastingNoteFlavourMapper.toEntity(tastingNote, flavourTasteId))
                .toList());
        return tastingNoteRepository.save(tastingNote).getId();
    }

    /**
     * 테이스팅노트 목록 조회
     *
     * @param userId 유저 ID
     * @return 테이스팅노트 목록
     */
    @Transactional
    public List<TastingNoteGetListResponse> getList(
            final Long userId
    ) {
        AssistantThreadEntity assistantThreadEntity
                = assistantThreadRepository.findByUserId(userId).orElse(null);

        if (assistantThreadEntity != null) {
            assistantStream.cleanConversation(assistantThreadEntity.getThreadId());
        }
        assistantThreadRepository.deleteAllByUserId(userId);

        return tastingNoteRepository.findAllByUserId(userId).stream()
                .map(tastingNoteMapper::toGetListResponse)
                .toList();
    }

    /**
     * 테이스팅노트 상세 조회
     *
     * @param id     테이스팅노트 ID
     * @param userId 유저 ID
     * @return 테이스팅노트
     */
    @Transactional(readOnly = true)
    public TastingNoteGetResponse get(
            final Long id,
            final Long userId
    ) {
        return tastingNoteRepository.findByIdAndUserId(id, userId)
                .map(tastingNoteMapper::toGetResponse)
                .orElseThrow(() -> new VinopenerException(TastingNoteErrorCode.TASTING_NOTE_NOT_FOUND));
    }

    /**
     * 테이스팅노트 수정
     *
     * @param id            테이스팅노트 ID
     * @param updateRequest 테이스팅노트 수정 요청
     * @param userId        유저 ID
     */
    @Transactional
    public void update(
            final Long id,
            final TastingNoteUpdateRequest updateRequest,
            final Long userId
    ) {
        final var tastingNote = tastingNoteRepository.save(tastingNoteMapper.toEntity(id, updateRequest));
        // 향기 목록을 가져오기 위해 사용
        entityManager.refresh(tastingNote);
        // 향기 교집합
        final var intersection = tastingNote.getFlavours().stream()
                .map(flavour -> flavour.getFlavourTaste().getId())
                .collect(Collectors.toSet());
        intersection.retainAll(updateRequest.flavourTasteIds());
        // 수정 요청에 없는 향기 삭제
        tastingNote.getFlavours().removeIf(flavour -> !intersection.contains(flavour.getFlavourTaste().getId()));
        // 기존 목록에 없는 향기 추가
        updateRequest.flavourTasteIds().removeAll(intersection);
        tastingNote.getFlavours().addAll(updateRequest.flavourTasteIds().stream()
                .map(flavourTasteId -> tastingNoteFlavourMapper.toEntity(tastingNote, flavourTasteId))
                .toList());
    }

    /**
     * 테이스팅노트 삭제
     *
     * @param id     테이스팅노트 ID
     * @param userId 유저 ID
     */
    @Transactional
    public void delete(
            final Long id,
            final Long userId
    ) {
        tastingNoteRepository.deleteByIdAndUserId(id, userId);
    }

}
