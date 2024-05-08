package com.ssafy.vinopener.domain.wine.service;

import com.ssafy.vinopener.domain.bookmark.repository.BookmarkRepository;
import com.ssafy.vinopener.domain.cellar.repository.CellarRepository;
import com.ssafy.vinopener.domain.tastingnote.repository.TastingNoteRepository;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetListResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineTypeGetListResponse;
import com.ssafy.vinopener.domain.wine.data.entity.FlavourTasteEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineFlavourEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.domain.wine.data.mapper.WineMapper;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.domain.wine.repository.FlavourTasteRepository;
import com.ssafy.vinopener.domain.wine.repository.WineFlavourRepository;
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
    private final BookmarkRepository bookmarkRepository;
    private final CellarRepository cellarRepository;
    private final TastingNoteRepository tastingNoteRepository;
    private final WineFlavourRepository wineFlavourRepository;
    private final FlavourTasteRepository flavourTasteRepository;

    /**
     * 와인 목록 조회
     *
     * @return 와인 목록
     */
//    @Transactional(readOnly = true)
//    public List<WineGetListResponse> getList() {
//        return wineRepository.findAll().stream()
//                .map(wineMapper::toGetListResponse)
//                .toList();
//    }

    /**
     * 와인 상세 조회
     * <p>
     * 조회수를 갱신합니다.
     *
     * @param wineId 와인 ID
     * @return 와인
     */
//    @Transactional
//    public WineGetResponse get(final Long wineId) {
//        return wineRepository.findById(wineId)
//                .map(WineEntity::increaseView)
//                .map(wineMapper::toGetResponse)
//                .orElseThrow(() -> new VinopenerException(WineErrorCode.WINE_NOT_FOUND));
//    }

    /**
     * 와인 목록 조회(북마크, 셀러, 테이스팅 노트 여부 포함)
     *
     * @param userId 유저 ID
     */
    @Transactional(readOnly = true)
    public List<WineGetListResponse> getList(
            final Long userId
    ) {
        List<WineEntity> wines = wineRepository.findAll();

        return wines.stream()
                .map(wine -> {
                    boolean isBookmark = bookmarkRepository.existsByWineIdAndUserId(wine.getId(), userId);
                    boolean isCellar = cellarRepository.existsByWineIdAndUserId(wine.getId(), userId);
                    int totalNotes = tastingNoteRepository.countByWineIdAndUserId(wine.getId(), userId);
                    return wineMapper.toGetListResponse(wine, isBookmark, isCellar, totalNotes);
                })
                .toList();
    }

    /**
     * 와인 상세 조회(북마크, 셀러, 테이스팅 노트 여부 포함)
     *
     * @param wineId 와인 ID
     * @param userId 유저 ID
     */
    @Transactional(readOnly = true)
    public WineGetResponse get(
            final Long wineId,
            final Long userId
    ) {
        WineEntity wine = wineRepository.findById(wineId)
                .map(WineEntity::increaseView)
                .orElseThrow(() -> new VinopenerException(WineErrorCode.WINE_NOT_FOUND));

        List<WineFlavourEntity> wineFlavours = wineFlavourRepository.findByWineId(wineId);
        List<Long> flavourTasteIds = wineFlavours.stream()
                .map(wf -> wf.getFlavourTaste().getId())
                .toList();

        List<FlavourTasteEntity> flavourTastes = flavourTasteRepository.findAllByIdIn(flavourTasteIds);

        boolean isBookmark = bookmarkRepository.existsByWineIdAndUserId(wineId, userId);
        boolean isCellar = cellarRepository.existsByWineIdAndUserId(wineId, userId);
        int totalNotes = tastingNoteRepository.countByWineIdAndUserId(wineId, userId);

        return wineMapper.toGetResponse(wine, flavourTastes, isBookmark, isCellar, totalNotes);
    }

    @Transactional(readOnly = true)
    public List<WineTypeGetListResponse> getTypeList(
            final WineType type
    ) {
        return wineRepository.findByType(type).stream()
                .map(wineMapper::toGetTypeResponse)
                .toList();
    }

    @Transactional
    public List<WineEntity> searchWine(
            String seoName
    ) {
        return wineRepository.findBySeoNameContainsIgnoreCase(seoName);
    }

}
