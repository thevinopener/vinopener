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
import java.time.Duration;
import java.time.LocalDateTime;
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
    private final int RENEWAL_HOUR = 3;

    /**
     * 조회수 / 셀러 / 평점 기반 추천
     *
     * @param type VIEW, CELLAR, RATE // 조회수, 셀러, 평점 기반
     * @return 추천된 와인 List (10개)
     */
    public List<RecommendationGetListResponse> getContentRecommendation(ContentRecommendationType type) {
        List<ContentRecommendationEntity> contentRecommendationEntityList
                = contentRecommendationRepository.findAllByContentRecommendationType(type);
        List<WineEntity> resultList;

        //기존 테이블 내용이 없으면, 새로 추천해서 결과를 테이블에 추가한다.
        if (contentRecommendationEntityList.isEmpty()) {
            resultList = recommendationProcessor.createRecommendation(type);
        }
        //내용이 있으면, 갱신 시간 이내인지 확인한다.
        else {
            Duration duration = Duration.between(
                    contentRecommendationEntityList.getFirst().getCreatedTime(),
                    LocalDateTime.now()
            );

            if (duration.toHours() < RENEWAL_HOUR) {
                return contentRecommendationEntityList.stream()
                        .map(recommendationMapper::toGetListResponse)
                        .toList();
            } else {
                contentRecommendationRepository.deleteAllByContentRecommendationType(type);
                resultList = recommendationProcessor.createRecommendation(type);
            }
        }
        return resultList.stream()
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
        }
        //내용이 있으면, 갱신 시간 이내인지 확인한다.
        else {
            Duration duration = Duration.between(
                    existingEntityList.getFirst().getCreatedTime(),
                    LocalDateTime.now()
            );
            if (duration.toHours() < RENEWAL_HOUR) {
                return existingEntityList.stream()
                        .map(recommendationMapper::toGetListResponse)
                        .toList();
            } else {
                behaviorRecommendationRepository.deleteAllByUserId(userId);
                resultList = recommendationProcessor.createPreferenceRecommendation(userId);
            }
        }

        // 추천 결과를 return
        return resultList.stream()
                .map(recommendationMapper::toGetListResponse)
                .toList();
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

        //내용이 없으면, 새로 추천해서 테이블에 추가한다.
        if (existingEntityList.isEmpty()) {
            resultList = recommendationProcessor.createTastingNoteRecommendation(userId);
        }
        //내용이 있으면, 갱신 시간 이내인지 확인한다.
        else {
            Duration duration = Duration.between(
                    existingEntityList.getFirst().getCreatedTime(),
                    LocalDateTime.now()
            );
            //createTime 으로부터 아직 갱신 시간이 되지 않았다. >> Table을 그대로 return
            if (duration.toHours() < RENEWAL_HOUR) {
                return existingEntityList.stream()
                        .map(recommendationMapper::toGetListResponse)
                        .toList();
            }
            //새로 갱신해야 한다. == 재추천.
            else {
                behaviorRecommendationRepository.deleteAllByUserId(userId);
                resultList = recommendationProcessor.createTastingNoteRecommendation(userId);
            }
        }

        // 추천 결과를 return
        return resultList.stream()
                .map(recommendationMapper::toGetListResponse)
                .toList();
    }

    public List<RecommendationGetListResponse> getWineDetailRecommendation(Long wineId) {
        //일단 각 와인별 가장 유사한 와인 추천의 경우, 전부 테이블로 결과를 보관하기엔 무리가 있다고 판단됨.
        //따라서 wineDetail 추천은 요청이 들어오는 즉시 처리하는걸로 일단 구현하였음.

        List<WineEntity> resultList
                = recommendationProcessor.createWineDetailRecommendation(wineId);

        return resultList.stream()
                .map(recommendationMapper::toGetListResponse)
                .toList();
    }

}
