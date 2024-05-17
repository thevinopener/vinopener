package com.ssafy.vinopener.domain.bookmark.service;

import com.ssafy.vinopener.domain.bookmark.data.dto.request.BookmarkCreateRequest;
import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkGetListResponse;
import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkStatusGetResponse;
import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
import com.ssafy.vinopener.domain.bookmark.data.mapper.BookmarkMapper;
import com.ssafy.vinopener.domain.bookmark.exception.BookmarkErrorCode;
import com.ssafy.vinopener.domain.bookmark.repository.BookmarkRepository;
import com.ssafy.vinopener.domain.user.exception.UserErrorCode;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
     * @param bookmarkCreateRequest 즐겨찾기에 추가 요청
     * @param userId                유저 ID
     * @return 북마크 ID
     */
    @Transactional
    public Long create(final BookmarkCreateRequest bookmarkCreateRequest,
            Long userId) {
        userRepository.findById(userId)
                .orElseThrow(() -> new VinopenerException(UserErrorCode.USER_NOT_FOUND));

        var wine = wineRepository.findById(bookmarkCreateRequest.wineId())
                .orElseThrow(() -> new VinopenerException(WineErrorCode.WINE_NOT_FOUND));

        if (bookmarkRepository.existsByWineIdAndUserId(wine.getId(),userId)) {
            throw new VinopenerException(BookmarkErrorCode.BOOKMARK_ALREADY_EXISTS);
        }

        return bookmarkRepository
                .save(bookmarkMapper.toEntity(userId, bookmarkCreateRequest, wine))
                .getId();
    }

    /**
     * 즐겨찾기에 와인 삭제
     *
     * @param bookmarkId 북마크 ID
     * @param userId     유저 ID
     */
    @Transactional
    public void delete(
            final Long bookmarkId,
            final Long userId) {
        checkExists(bookmarkId, userId);
        bookmarkRepository.deleteByIdAndUserId(bookmarkId, userId);
    }

    /**
     * 즐겨찾기 삭제 : wineID
     *
     * @param userId 유저 ID
     * @param wineId 와인 ID
     */
    @Transactional
    public void deleteByWineId(final Long userId, final Long wineId) {
        if (bookmarkRepository.existsByWineIdAndUserId(wineId, userId)) {
            bookmarkRepository.deleteByWineIdAndUserId(wineId, userId);
            return;
        }

        throw new VinopenerException(BookmarkErrorCode.NOT_BOOKMARKED_WINE);
    }

    /**
     * 즐겨찾기 목록 조회
     *
     * @param userId 유저 ID
     * @return 즐겨찾기한 와인 목록
     */
    @Transactional(readOnly = true)
    public List<BookmarkGetListResponse> getList(Long userId) {
        return bookmarkRepository.findAllByUserId(userId).stream()
                .map(bookmarkMapper::toGetListResponse)
                .toList();
    }

    /**
     * 즐겨찾기 목록 조회 : 페이지네이션
     *
     * @param userId 유저 ID
     */
    @Transactional(readOnly = true)
    public Page<BookmarkGetListResponse> getPageList(
            final Long userId,
            Pageable pageable
    ) {
        Page<BookmarkEntity> bookmarks = bookmarkRepository.findAllByUserId(userId, pageable);
        return bookmarks.map(bookmarkMapper::toGetListResponse);
    }

    /**
     * 즐겨찾기 존재 여부 확인 : 와인 ID
     *
     * @param wineId 와인 ID
     * @param userId 유저 ID
     */
    @Transactional(readOnly = true)
    public BookmarkStatusGetResponse getBookmarkStatus(
            final Long wineId,
            final Long userId
    ) {
        boolean isBookmark = bookmarkRepository.existsByWineIdAndUserId(wineId, userId);
        return bookmarkMapper.toGetStatusResponse(isBookmark);
    }

    /**
     * 즐겨찾기 존재 여부 확인
     *
     * @param bookmarkId 북마크 ID
     * @param userId     유저 ID
     */
    private void checkExists(final Long bookmarkId, final Long userId) {
        if (!bookmarkRepository.existsByIdAndUserId(bookmarkId, userId)) {
            throw new VinopenerException(BookmarkErrorCode.BOOKMARK_NOT_FOUND);
        }
    }

}
