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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    private static final Logger logger = LoggerFactory.getLogger(WineService.class);

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
     * 와인 목록 조회 : 페이지네이션
     *
     * @param userId   유저 ID
     * @param pageable 페이지네이션
     */
//    @Transactional(readOnly = true)
//    public Page<WineGetListResponse> getList(
//            final Long userId,
//            Pageable pageable
//    ) {
//        Page<WineEntity> wines = wineRepository.findAll(pageable);
//        logger.info("##### Pageable result - page: {}, size: {}, total elements: {}, number of elements: {}",
//                wines.getNumber(), wines.getSize(), wines.getTotalElements(), wines.getNumberOfElements());
//        return wines.map(wine -> {
//            boolean isBookmark = bookmarkRepository.existsByWineIdAndUserId(wine.getId(), userId);
//            boolean isCellar = cellarRepository.existsByWineIdAndUserId(wine.getId(), userId);
//            int totalNotes = tastingNoteRepository.countByWineIdAndUserId(wine.getId(), userId);
//            return wineMapper.toGetListResponse(wine, isBookmark, isCellar, totalNotes);
//        });
//    }

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

    /**
     * 와인 타입별 조회
     *
     * @param type 타입
     */
    @Transactional(readOnly = true)
    public List<WineTypeGetListResponse> getTypeList(
            final WineType type
    ) {

        return wineRepository.findByType(type).stream()
                .map(wineMapper::toGetTypeResponse)
                .toList();
    }

    /**
     * 와인 타입별 조회 : 페이지네이션
     *
     * @param type     와인 타입
     * @param pageable 페이지네이션
     * @return
     */
//    @Transactional(readOnly = true)
//    public Page<WineTypeGetListResponse> getTypeList(
//            final WineType type,
//            Pageable pageable
//    ) {
//        Page<WineEntity> wines = wineRepository.findByType(type, pageable);
//        return wines.map(wineMapper::toGetTypeResponse);
//    }

    /**
     * 와인 국가별 조회
     *
     * @param country 검색할 국가명
     * @param userId  유저 ID
     */
    @Transactional(readOnly = true)
    public List<WineGetListResponse> getCountryList(
            final String country,
            final Long userId
    ) {
        List<WineEntity> wines = wineRepository.findByCountry(country);

        if (wines.isEmpty()) {
            throw new VinopenerException(WineErrorCode.WINE_NOT_FOUND);
        }

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
     * 와인 국가별 검색 : 페이지네이션
     *
     * @param country  국가
     * @param userId   유저 ID
     * @param pageable 페이지네이션
     */
//    @Transactional(readOnly = true)
//    public Page<WineGetListResponse> getCountryList(
//            final String country,
//            final Long userId,
//            Pageable pageable
//    ) {
//        Page<WineEntity> wines = wineRepository.findByCountry(country, pageable);
//
//        if (wines.isEmpty()) {
//            throw new VinopenerException(WineErrorCode.WINE_NOT_FOUND);
//        }
//
//        return wines.map(wine -> {
//            boolean isBookmark = bookmarkRepository.existsByWineIdAndUserId(wine.getId(), userId);
//            boolean isCellar = cellarRepository.existsByWineIdAndUserId(wine.getId(), userId);
//            int totalNotes = tastingNoteRepository.countByWineIdAndUserId(wine.getId(), userId);
//            return wineMapper.toGetListResponse(wine, isBookmark, isCellar, totalNotes);
//        });
//    }

    /**
     * 와인 검색
     *
     * @param query 검색어
     */
    @Transactional(readOnly = true)
    public List<WineGetListResponse> searchWine(
            final String query,
            final Long userId
    ) {
        List<WineEntity> wines = wineRepository.findBySeoNameContainsIgnoreCase(query);

        logger.info("현재 반환된 wines List : {}", wines);

        if (wines.isEmpty()) {
            throw new VinopenerException(WineErrorCode.WINE_NOT_FOUND);
        }

        return wines.stream()
                .map(wine -> {
                    logger.info("현재 참조 중인 wine Entity : {}", wine);
                    boolean isBookmark = bookmarkRepository.existsByWineIdAndUserId(wine.getId(), userId);
                    boolean isCellar = cellarRepository.existsByWineIdAndUserId(wine.getId(), userId);
                    int totalNotes = tastingNoteRepository.countByWineIdAndUserId(wine.getId(), userId);
                    return wineMapper.toGetListResponse(wine, isBookmark, isCellar, totalNotes);
                })
                .toList();
    }

    /**
     * 와인 검색 : 페이지네이션
     *
     * @param query  검색어
     * @param userId 유저 ID
     */
//    @Transactional(readOnly = true)
//    public Page<WineGetListResponse> searchWine(
//            final String query,
//            final Long userId,
//            Pageable pageable
//    ) {
//        Page<WineEntity> wines = wineRepository.findBySeoNameContainsIgnoreCase(query, pageable);
//
//        if (wines.isEmpty()) {
//            throw new VinopenerException(WineErrorCode.WINE_NOT_FOUND);
//        }
//
//        return wines.map(wine -> {
//            boolean isBookmark = bookmarkRepository.existsByWineIdAndUserId(wine.getId(), userId);
//            boolean isCellar = cellarRepository.existsByWineIdAndUserId(wine.getId(), userId);
//            int totalNotes = tastingNoteRepository.countByWineIdAndUserId(wine.getId(), userId);
//            return wineMapper.toGetListResponse(wine, isBookmark, isCellar, totalNotes);
//        });
//    }

}
