package com.ssafy.vinopener.domain.recommendation.service;

import com.ssafy.vinopener.domain.cellar.repository.CellarRepositoryQueryImpl;
import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.ContentRecommendationType;
import com.ssafy.vinopener.domain.recommendation.data.mapper.RecommendationMapper;
import com.ssafy.vinopener.domain.recommendation.repository.BehaviorRecommendationRepository;
import com.ssafy.vinopener.domain.recommendation.repository.ContentRecommendationRepository;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import com.ssafy.vinopener.global.recommendation.RecommendationProcessor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class RecommendationService {

    private final ContentRecommendationRepository contentRecommendationRepository;
    private final BehaviorRecommendationRepository behaviorRecommendationRepository;
    private final RecommendationProcessor recommendationProcessor;
    private final RecommendationMapper recommendationMapper;
    private final JwtProvider jwtProvider;
    private final CellarRepositoryQueryImpl cellarRepositoryQueryImpl;
    private final int RENEWAL_HOUR = 3;

    public List<RecommendationGetListResponse> getViewRecommendation() {
        List<ContentRecommendationEntity> contentRecommendationEntityList
                = contentRecommendationRepository.findAllByContentRecommendationType(
                ContentRecommendationType.VIEW
        );

        log.info("contentRecommendationEntityList: {}", contentRecommendationEntityList);

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
                log.info("RecommendationService : deleteAllByContentRecommendationType");
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

        log.info("contentRecommendationEntityList: {}", contentRecommendationEntityList);

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

    public List<RecommendationGetListResponse> getPreferenceRecommendation() {
        return null;
    }

    public List<RecommendationGetListResponse> getTastingNoteRecommendation() {
        return null;
    }

}
