package com.ssafy.vinopener.domain.chat.service;

import com.ssafy.vinopener.domain.chat.data.dto.request.WineChatCreateRequest;
import com.ssafy.vinopener.domain.chat.data.dto.response.WineChatGetOrGetListResponse;
import com.ssafy.vinopener.domain.chat.data.mapper.WineChatMapper;
import com.ssafy.vinopener.domain.chat.repository.WineChatRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class WineChatService {

    @PersistenceContext
    private final EntityManager entityManager;
    private final WineChatRepository wineChatRepository;
    private final WineChatMapper wineChatMapper;

    /**
     * 와인채팅 생성
     *
     * @param wineChatCreateRequest 와인채팅 생성 요청
     * @param wineId                와인 ID
     * @param userId                유저 ID
     * @return 와인채팅
     */
    @Transactional
    public WineChatGetOrGetListResponse createAndGet(
            final WineChatCreateRequest wineChatCreateRequest,
            final Long wineId,
            final Long userId
    ) {
        var wineEntity = wineChatRepository.save(
                wineChatMapper.toEntity(wineChatCreateRequest, wineId, userId));
        log.info("wineEntity: {}", wineEntity);
        return wineChatMapper.toGetOrGetListResponse(wineEntity);
    }

    /**
     * 와인채팅 상세 조회
     *
     * @param wineId 와인 ID
     * @return 와인채팅 목록
     */
    @Transactional(readOnly = true)
    public List<WineChatGetOrGetListResponse> getList(
            final Long wineId
    ) {
        return wineChatRepository.findAllByWineId(wineId).stream()
                .map(wineChatMapper::toGetOrGetListResponse)
                .toList();
    }

}
