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

    public List<RecommendationGetListResponse> getViewRecommendation() {
        List<ContentRecommendationEntity> contentRecommendationEntityList
                = contentRecommendationRepository.findAllByContentRecommendationType(
                ContentRecommendationType.VIEW
        );

        if (!contentRecommendationEntityList.isEmpty()) {

            Duration duration = Duration.between(
                    contentRecommendationEntityList.getFirst().getCreatedTime(),
                    LocalDateTime.now()
            );
            //createTime 으로부터 아직 갱신 시간이 되지 않았다.
            if (duration.toHours() < RENEWAL_HOUR) {
                return contentRecommendationRepository.findAllByContentRecommendationType(
                                ContentRecommendationType.VIEW)
                        .stream().map(recommendationMapper::toGetListResponse)
                        .toList();

            }
            // 갱신 시간이 지나 새로 갱신해야할 경우
            else {
                contentRecommendationRepository.deleteAllByContentRecommendationType(ContentRecommendationType.VIEW);
                recommendationProcessor.createRecommendation(ContentRecommendationType.VIEW);
                return contentRecommendationRepository.findAllByContentRecommendationType(
                                ContentRecommendationType.VIEW)
                        .stream().map(recommendationMapper::toGetListResponse)
                        .toList();
            }
        }
        // 최초 실행시엔 테이블이 비어있을 수 있음.
        else {
            recommendationProcessor.createRecommendation(ContentRecommendationType.VIEW);
            return contentRecommendationRepository.findAllByContentRecommendationType(ContentRecommendationType.VIEW)
                    .stream().map(recommendationMapper::toGetListResponse)
                    .toList();
        }

    }

    public List<RecommendationGetListResponse> getCellarRecommendation() {
        List<ContentRecommendationEntity> contentRecommendationEntityList
                = contentRecommendationRepository.findAllByContentRecommendationType(
                ContentRecommendationType.CELLAR
        );

        if (!contentRecommendationEntityList.isEmpty()) {
            Duration duration = Duration.between(
                    contentRecommendationEntityList.getFirst().getCreatedTime(),
                    LocalDateTime.now()
            );
            //createTime 으로부터 아직 갱신 시간이 되지 않았다.
            if (duration.toHours() < RENEWAL_HOUR) {
                return contentRecommendationRepository.findAllByContentRecommendationType(
                                ContentRecommendationType.CELLAR)
                        .stream().map(recommendationMapper::toGetListResponse)
                        .toList();

            }
            // 갱신 시간이 지나 새로 갱신해야할 경우
            else {
                contentRecommendationRepository.deleteAllByContentRecommendationType(ContentRecommendationType.CELLAR);
                recommendationProcessor.createRecommendation(ContentRecommendationType.CELLAR);
                return contentRecommendationRepository.findAllByContentRecommendationType(
                                ContentRecommendationType.CELLAR)
                        .stream().map(recommendationMapper::toGetListResponse)
                        .toList();
            }

        } else {
            recommendationProcessor.createRecommendation(ContentRecommendationType.CELLAR);
            return contentRecommendationRepository.findAllByContentRecommendationType(ContentRecommendationType.CELLAR)
                    .stream().map(recommendationMapper::toGetListResponse)
                    .toList();

        }

    }

    public List<RecommendationGetListResponse> getRateRecommendation() {

        List<ContentRecommendationEntity> contentRecommendationEntityList
                = contentRecommendationRepository.findAllByContentRecommendationType(
                ContentRecommendationType.RATE
        );

        if (!contentRecommendationEntityList.isEmpty()) {

            Duration duration = Duration.between(
                    contentRecommendationEntityList.getFirst().getCreatedTime(),
                    LocalDateTime.now()
            );
            //createTime 으로부터 아직 갱신 시간이 되지 않았다.
            if (duration.toHours() < RENEWAL_HOUR) {
                return contentRecommendationRepository.findAllByContentRecommendationType(
                                ContentRecommendationType.RATE)
                        .stream().map(recommendationMapper::toGetListResponse)
                        .toList();

            }
            // 갱신 시간이 지나 새로 갱신해야할 경우
            else {
                contentRecommendationRepository.deleteAllByContentRecommendationType(ContentRecommendationType.RATE);
                recommendationProcessor.createRecommendation(ContentRecommendationType.RATE);
                return contentRecommendationRepository.findAllByContentRecommendationType(
                                ContentRecommendationType.RATE)
                        .stream().map(recommendationMapper::toGetListResponse)
                        .toList();
            }
        }
        // 최초 실행시엔 테이블이 비어있을 수 있음.
        else {
            recommendationProcessor.createRecommendation(ContentRecommendationType.RATE);
            return contentRecommendationRepository.findAllByContentRecommendationType(ContentRecommendationType.RATE)
                    .stream().map(recommendationMapper::toGetListResponse)
                    .toList();
        }
    }

    public List<RecommendationGetListResponse> getPreferenceRecommendation(Long userId) {

        //일단, 테이블에 내용이 있는지 확인한다.
        List<BehaviorRecommendationEntity> existingEntityList =
                behaviorRecommendationRepository.findAllByUserId(userId);
        List<WineEntity> resultList;

        //내용이 없으면, 새로 추천해서 테이블에 추가한다.
        if (existingEntityList.isEmpty()) {
            resultList = recommendationProcessor.createRecommendation(
                    BehaviorRecommendationType.PREFERENCE, userId);
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
                resultList = recommendationProcessor.createRecommendation(
                        BehaviorRecommendationType.PREFERENCE, userId);
            }
        }

        // 추천 결과를 return
        return resultList.stream()
                .map(recommendationMapper::toGetListResponse)
                .toList();
    }

    public List<RecommendationGetListResponse> getTastingNoteRecommendation() {
        return null;
    }

}
