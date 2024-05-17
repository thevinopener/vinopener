package com.ssafy.vinopener.domain.preference.service;

import com.ssafy.vinopener.domain.preference.data.dto.request.PreferenceCreateOrUpdateRequest;
import com.ssafy.vinopener.domain.preference.data.dto.response.PreferenceGetResponse;
import com.ssafy.vinopener.domain.preference.data.mapper.PreferenceMapper;
import com.ssafy.vinopener.domain.preference.exception.PreferenceErrorCode;
import com.ssafy.vinopener.domain.preference.repository.PreferenceRepository;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.BehaviorRecommendationType;
import com.ssafy.vinopener.domain.recommendation.repository.BehaviorRecommendationRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class PreferenceService {

    private final PreferenceRepository preferenceRepository;
    private final PreferenceMapper preferenceMapper;
    private final BehaviorRecommendationRepository behaviorRecommendationRepository;

    /**
     * 선호도 생성
     *
     * @param createRequest 선호도 생성 요청
     * @param userId        유저 ID
     */
    @Transactional
    public void create(
            final PreferenceCreateOrUpdateRequest createRequest,
            final Long userId
    ) {
        preferenceRepository
                .save(preferenceMapper.toEntity(createRequest, userId));
        behaviorRecommendationRepository.deleteAllByUserIdAndBehaviorRecommendationType(userId,
                BehaviorRecommendationType.PREFERENCE);
    }

    /**
     * 선호도 상세 조회
     *
     * @param userId 유저 ID
     * @return 선호도
     */
    @Transactional(readOnly = true)
    public PreferenceGetResponse get(
            final Long userId
    ) {
        return preferenceRepository.findByUserId(userId)
                .map(preferenceMapper::toGetResponse)
                .orElseThrow(() -> new VinopenerException(PreferenceErrorCode.PREFERENCE_NOT_FOUND));
    }

    /**
     * 선호도 수정
     *
     * @param updateRequest 선호도 수정 요청
     * @param userId        유저 ID
     */
    @Transactional
    public void update(
            final PreferenceCreateOrUpdateRequest updateRequest,
            final Long userId
    ) {
        var preferenceId = preferenceRepository.findByUserId(userId)
                .orElseThrow(() -> new VinopenerException(PreferenceErrorCode.PREFERENCE_NOT_FOUND))
                .getId();
        preferenceRepository.save(preferenceMapper.toEntity(preferenceId, updateRequest, userId));
        behaviorRecommendationRepository.deleteAllByUserIdAndBehaviorRecommendationType(userId,
                BehaviorRecommendationType.PREFERENCE);
    }

}
