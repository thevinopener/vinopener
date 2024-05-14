package com.ssafy.vinopener.domain.search.service;

import com.ssafy.vinopener.domain.search.data.dto.response.SearchGetListResponse;
import com.ssafy.vinopener.domain.search.data.entity.SearchEntity;
import com.ssafy.vinopener.domain.search.data.mapper.SearchMapper;
import com.ssafy.vinopener.domain.search.repository.SearchRepository;
import com.ssafy.vinopener.domain.user.exception.UserErrorCode;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class SearchService {

    private final SearchMapper searchMapper;
    private final SearchRepository searchRepository;
    private final UserRepository userRepository;

    /**
     * 검색 기록 생성
     *
     * @param query  검색어
     * @param userId 유저 ID
     */
    @Transactional
    public long create(
            final String query,
            final Long userId
    ) {
        // 이미 검색어와 동일한 검색기록이 있는지 확인 후 존재한다면 삭제
        searchRepository.findByUserIdAndContent(userId, query.trim())
                .ifPresent(existingSearch -> {
                    searchRepository.deleteByIdAndUserId(existingSearch.getId(), userId);
                });

        SearchEntity search = SearchEntity.builder()
                .user(userRepository.findById(userId)
                        .orElseThrow(() -> new VinopenerException(UserErrorCode.USER_NOT_FOUND)))
                .content(query.trim())
                .build();

        return searchRepository.save(search).getId();
    }

    /**
     * 검색 기록 목록 조회
     *
     * @param userId 유저 ID
     */
    @Transactional(readOnly = true)
    public List<SearchGetListResponse> getList(
            final Long userId
    ) {
        return searchRepository.findAllByUserId(userId).stream()
                .map(searchMapper::toGetListResponse)
                .toList();
    }

    /**
     * 검색 기록 개별 삭제
     *
     * @param searchId 검색 기록 ID
     * @param userId   유저 ID
     */
    @Transactional
    public void delete(
            final Long searchId,
            final Long userId
    ) {
        searchRepository.deleteByIdAndUserId(searchId, userId);
    }

    /**
     * 검색 기록 전체 삭제
     *
     * @param userId 유저 ID
     */
    @Transactional
    public void deleteAll(
            final Long userId
    ) {
        searchRepository.deleteAllByUserId(userId);
    }

}
