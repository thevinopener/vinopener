package com.ssafy.vinopener.domain.bookmark.service;

import com.ssafy.vinopener.domain.bookmark.data.dto.request.BookmarkCreateRequest;
import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkGetListResponse;
import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
import com.ssafy.vinopener.domain.bookmark.data.mapper.BookmarkMapper;
import com.ssafy.vinopener.domain.bookmark.exception.BookmarkErrorCode;
import com.ssafy.vinopener.domain.bookmark.repository.BookmarkRepository;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class BookmarkService {

    private final BookmarkRepository bookmarkRepository;
    private final BookmarkMapper bookmarkMapper;
    private final WineRepository wineRepository;
    private final UserRepository userRepository;

    /**
     * 즐겨찾기에 와인 추가
     *
     * @param request 즐겨찾기에 추가 요청할 wineId
     * @param userId  유저 ID
     * @return 북마크 ID
     */
    @Transactional
    public Long create(final BookmarkCreateRequest request,
            Long userId) {
        var wine = wineRepository.findById(request.wineId())
                .orElseThrow(() -> new VinopenerException(BookmarkErrorCode.WINE_NOT_FOUND));

//        BookmarkEntity bookmark = bookmarkMapper.toEntity(userId, request, wine);
        return bookmarkRepository
                .save(bookmarkMapper.toEntity(userId, request, wine))
                .getId();
    }

    /**
     * 즐겨찾기에 와인 삭제
     *
     * @param userId 유저 ID
     * @param wineId 와인 ID
     */
    @Transactional
    public void delete(final Long userId, final Long wineId) {
        checkExists(userId, wineId);
        bookmarkRepository.deleteByUserIdAndWineId(userId, wineId);
    }

    /**
     * 즐겨찾기 목록 조회
     *
     * @param userId 유저 ID
     * @return 즐겨찾기한 와인 목록
     */
    @Transactional
    public List<BookmarkGetListResponse> getList(Long userId) {
        List<BookmarkEntity> bookmarks = bookmarkRepository.findAllByUserId(userId);
        return bookmarks.stream()
                .map(bookmarkMapper::toGetListResponse)
                .collect(Collectors.toList());
    }

    /**
     * 즐겨찾기 존재 여부 확인
     *
     * @param userId 유저 ID
     * @param wineId 와인 ID
     */
    private void checkExists(final Long userId, final Long wineId) {
        if (!bookmarkRepository.existsByUserIdAndWineId(userId, wineId)) {
            throw new VinopenerException(BookmarkErrorCode.BOOKMARK_NOT_FOUND);
        }
    }

}
