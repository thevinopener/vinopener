package com.ssafy.vinopener.domain.tastingnote.data.entity;

import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.global.common.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.math.BigDecimal;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity(name = "tasting_note")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
public class TastingNoteEntity extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tasting_note_id")
    private Long id;

    // TODO: UserEntity
    private Long userId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "wine_id", nullable = false, updatable = false)
    private WineEntity wine;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "color_id", nullable = false, updatable = false)
    private ColorEntity color;

    @Column(precision = 2, scale = 1, nullable = false)
    private BigDecimal sweetness;

    @Column(precision = 2, scale = 1, nullable = false)
    private BigDecimal intensity;

    @Column(precision = 2, scale = 1, nullable = false)
    private BigDecimal acidity;

    @Column(precision = 2, scale = 1, nullable = false)
    private BigDecimal alcohol;

    @Column(precision = 2, scale = 1, nullable = false)
    private BigDecimal tannin;

    @Column(nullable = false)
    private String opinion;

    @Column(precision = 2, scale = 1, nullable = false)
    private BigDecimal rating;

    @Column(length = 512, nullable = false)
    private String imageUrl;

}
