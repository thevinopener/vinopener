package com.ssafy.vinopener.domain.preference.data.entity;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.common.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity(name = "preference")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
public class PreferenceEntity extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "preference_id")
    private Long id;

    // TODO: UserEntity
    @NotNull
    private Long userId;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM")
    private WineType type;

    @NotNull
    private Integer minAbv;

    @NotNull
    private Integer maxAbv;

    @NotNull
    private BigDecimal sweetness;

    @NotNull
    private BigDecimal acidity;

    @NotNull
    private BigDecimal tannin;

}
