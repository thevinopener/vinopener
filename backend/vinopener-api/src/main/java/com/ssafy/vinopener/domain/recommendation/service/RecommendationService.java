package com.ssafy.vinopener.domain.recommendation.service;

import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import com.ssafy.vinopener.domain.recommendation.data.entity.BehaviorRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.BehaviorRecommendationType;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.ContentRecommendationType;
import com.ssafy.vinopener.domain.recommendation.data.mapper.RecommendationMapper;
import com.ssafy.vinopener.domain.recommendation.repository.BehaviorRecommendationRepository;
import com.ssafy.vinopener.domain.recommendation.repository.ContentRecommendationRepository;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.global.recommendation.RecommendationProcessor;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class RecommendationService {

    private final ContentRecommendationRepository contentRecommendationRepository;
    private final BehaviorRecommendationRepository behaviorRecommendationRepository;
    private final RecommendationProcessor recommendationProcessor;
    private final RecommendationMapper recommendationMapper;

    /**
     * 조회수 / 셀러 / 평점 기반 추천
     *
     * @param type VIEW, CELLAR, RATE // 조회수, 셀러, 평점 기반
     * @return 추천된 와인 List (10개)
     */
    public List<RecommendationGetListResponse> getContentRecommendation(ContentRecommendationType type) {
        List<ContentRecommendationEntity> contentRecommendationEntityList
                = contentRecommendationRepository.findAllByContentRecommendationType(type);

        return contentRecommendationEntityList.stream()
                .map(recommendationMapper::toGetListResponse)
                .toList();
    }

    /**
     * 사용자 선호도 설문 기반 추천
     *
     * @param userId 유저 ID
     * @return 추천된 와인 List (10개)
     */
    public List<RecommendationGetListResponse> getPreferenceRecommendation(Long userId) {
        List<BehaviorRecommendationEntity> existingEntityList =
                behaviorRecommendationRepository.findAllByBehaviorRecommendationTypeAndUserId(
                        BehaviorRecommendationType.PREFERENCE, userId
                );

        List<WineEntity> resultList;
        //기존 테이블 내용이 없으면, 새로 추천해서 결과를 테이블에 추가한다.
        if (existingEntityList.isEmpty()) {
            resultList = recommendationProcessor.createPreferenceRecommendation(userId);
            return resultList.stream()
                    .map(recommendationMapper::toGetListResponse)
                    .toList();
        }
        //내용이 있으면, 갱신 시간 이내인지 확인한다.
        else {
            return existingEntityList.stream()
                    .map(recommendationMapper::toGetListResponse)
                    .toList();
        }

    }

    /**
     * 사용자가 작성한 테이스팅 노트 기반 추천
     *
     * @param userId 유저 ID
     * @return 추천된 와인 List (10개)
     */
    public List<RecommendationGetListResponse> getTastingNoteRecommendation(Long userId) {
        List<BehaviorRecommendationEntity> existingEntityList =
                behaviorRecommendationRepository.findAllByBehaviorRecommendationTypeAndUserId(
                        BehaviorRecommendationType.TASTING_NOTE, userId
                );

        List<WineEntity> resultList;
        if (existingEntityList.isEmpty()) {
            resultList = recommendationProcessor.createTastingNoteRecommendation(userId);
            return resultList.stream()
                    .map(recommendationMapper::toGetListResponse)
                    .toList();
        } else {
            return existingEntityList.stream()
                    .map(recommendationMapper::toGetListResponse)
                    .toList();
        }
    }

    /**
     * 와인 상세 조회 시, 해당 와인과 가장 유사한 와인을 추천
     *
     * @param wineId 와인 ID
     * @return 추천된 와인 List (10개)
     */
    public List<RecommendationGetListResponse> getWineDetailRecommendation(Long wineId) {
        List<WineEntity> resultList
                = recommendationProcessor.createWineDetailRecommendation(wineId);

        return resultList.stream()
                .map(recommendationMapper::toGetListResponse)
                .toList();
    }

}
