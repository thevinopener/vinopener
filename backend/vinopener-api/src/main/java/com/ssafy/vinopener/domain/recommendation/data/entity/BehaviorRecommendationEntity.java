package com.ssafy.vinopener.domain.recommendation.data.entity;

import com.ssafy.vinopener.domain.recommendation.data.entity.enums.BehaviorRecommendationType;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.global.common.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity(name = "behavior_recommendation")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
public class BehaviorRecommendationEntity extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recommendation_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", updatable = false)
    private UserEntity user;

    @Setter
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "wine_id", updatable = false)
    private WineEntity wine;

    @Enumerated(EnumType.STRING)
    @Column(name = "behavior_recommendation_type", columnDefinition = "ENUM")
    private BehaviorRecommendationType behaviorRecommendationType;

}
