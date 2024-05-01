package com.ssafy.vinopener.domain.recommendation.service;

import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.ContentRecommendationType;
import com.ssafy.vinopener.domain.recommendation.data.mapper.RecommendationMapper;
import com.ssafy.vinopener.domain.recommendation.repository.BehaviorRecommendationRepository;
import com.ssafy.vinopener.domain.recommendation.repository.ContentRecommendationRepository;
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

    public List<RecommendationGetListResponse> getViewRecommendation() {
        List<ContentRecommendationEntity> contentRecommendationEntityList
                = contentRecommendationRepository.findAllByContentRecommendationType(
                ContentRecommendationType.VIEW
        );

        log.info("contentRecommendationEntityList: {}", contentRecommendationEntityList);

        if (!contentRecommendationEntityList.isEmpty()) {

            Duration duration = Duration.between(
                    contentRecommendationEntityList.get(0).getCreatedTime(),
                    LocalDateTime.now()
            );
            //createTime 으로부터 아직 갱신 시간이 되지 않았다.
            if (duration.toHours() < 3) {
                return contentRecommendationRepository.findAllByContentRecommendationType(
                                ContentRecommendationType.VIEW)
                        .stream().map(recommendationMapper::toGetListResponse)
                        .toList();

            }
            // 갱신 시간이 지나 새로 갱신해야할 경우
            else {
                contentRecommendationRepository.deleteAllByContentRecommendationType(ContentRecommendationType.VIEW);
                recommendationProcessor.createRecommendation();
                return contentRecommendationRepository.findAllByContentRecommendationType(
                                ContentRecommendationType.VIEW)
                        .stream().map(recommendationMapper::toGetListResponse)
                        .toList();
            }
        }
        // 최초 실행시엔 테이블이 비어있을 수 있음.
        else {
            recommendationProcessor.createRecommendation();
            return contentRecommendationRepository.findAllByContentRecommendationType(ContentRecommendationType.VIEW)
                    .stream().map(recommendationMapper::toGetListResponse)
                    .toList();
        }

    }

    public List<RecommendationGetListResponse> getCellarRecommendation() {
        return null;
    }

    public List<RecommendationGetListResponse> getRateRecommendation() {
        return null;
    }

    public List<RecommendationGetListResponse> getPreferenceRecommendation() {
        return null;
    }

    public List<RecommendationGetListResponse> getTastingNoteRecommendation() {
        return null;
    }

}
