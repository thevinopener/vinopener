package com.ssafy.vinopener.domain.recommendation.service;

import com.ssafy.vinopener.domain.cellar.repository.CellarRepositoryQueryImpl;
import com.ssafy.vinopener.domain.preference.data.entity.PreferenceEntity;
import com.ssafy.vinopener.domain.preference.data.mapper.PreferenceMapper;
import com.ssafy.vinopener.domain.preference.exception.PreferenceErrorCode;
import com.ssafy.vinopener.domain.preference.repository.PreferenceRepository;
import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.ContentRecommendationType;
import com.ssafy.vinopener.domain.recommendation.data.mapper.RecommendationMapper;
import com.ssafy.vinopener.domain.recommendation.repository.BehaviorRecommendationRepository;
import com.ssafy.vinopener.domain.recommendation.repository.ContentRecommendationRepository;
import com.ssafy.vinopener.domain.recommendation.repository.RecommendationRepositoryQueryImpl;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.exception.VinopenerException;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import com.ssafy.vinopener.global.recommendation.RecommendationProcessor;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
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
    private final JwtProvider jwtProvider;
    private final CellarRepositoryQueryImpl cellarRepositoryQueryImpl;
    private final int RENEWAL_HOUR = 3;
    private final PreferenceRepository preferenceRepository;
    private final PreferenceMapper preferenceMapper;
    private final RecommendationRepositoryQueryImpl recommendationRepositoryQuery;
    private final RecommendationRepositoryQueryImpl recommendationRepositoryQueryImpl;

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

    public List<RecommendationGetListResponse> getPreferenceRecommendation(Long userId) {
        PreferenceEntity preferenceEntity = preferenceRepository.findByUserId(userId).orElse(null);
        if (preferenceEntity == null) {
            throw new VinopenerException(PreferenceErrorCode.PREFERENCE_NOT_FOUND);
        }

        // 사용자가 선호하는 타입의 와인만 먼저 DB에서 골라낸다.
        Set<WineType> wineTypeSet = preferenceMapper.map(preferenceEntity);
        List<WineEntity> wineEntityList = recommendationRepositoryQueryImpl.findByWineTypeSet(wineTypeSet);

        // 선택된 WineList와 사용자의 선호도를 각각 코사인 유사도로 비교하여 가장 유사한 와인을 가져 10개 가져온다.
        List<WineEntity> resultList
                = recommendationProcessor.processCosineSimilarity(wineEntityList, preferenceEntity);
        // 그 10개를 behavior_recommendation 테이블에 넣는다(생성 및 업데이트).

        return null;
    }

    public List<RecommendationGetListResponse> getTastingNoteRecommendation() {
        return null;
    }

}
