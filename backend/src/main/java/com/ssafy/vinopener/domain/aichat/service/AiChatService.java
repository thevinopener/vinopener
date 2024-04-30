package com.ssafy.vinopener.domain.aichat.service;

import com.ssafy.vinopener.domain.aichat.data.dto.request.AiChatCreateRequest;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatGetListResponse;
import com.ssafy.vinopener.domain.aichat.data.mapper.AiChatMapper;
import com.ssafy.vinopener.domain.aichat.repository.AiChatRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AiChatService {

    private final AiChatRepository aiChatRepository;
    private final AiChatMapper aiChatMapper;

    /**
     * AI채팅 생성
     *
     * @param preferenceCreateRequest AI채팅 생성 요청
     * @param userId                  유저 ID
     */
    @Transactional
    public void create(
            final AiChatCreateRequest preferenceCreateRequest,
            final Long userId
    ) {
        aiChatRepository.save(aiChatMapper.toEntity(preferenceCreateRequest, userId));
    }

    /**
     * AI채팅 목록 조회
     *
     * @param userId 유저 ID
     * @return AI채팅 목록
     */
    @Transactional(readOnly = true)
    public List<AiChatGetListResponse> getList(
            final Long userId
    ) {
        return aiChatRepository.findAllByUserId(userId).stream()
                .map(aiChatMapper::toGetResponse)
                .toList();
    }

    /**
     * AI채팅 초기화
     *
     * @param userId 유저 ID
     */
    @Transactional
    public void clear(Long userId) {
        aiChatRepository.deleteAllByUserId(userId);
    }

}
