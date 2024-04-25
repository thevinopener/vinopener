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
import jakarta.validation.constraints.NotNull;
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
    @NotNull
    private Long userId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "wine_id", updatable = false)
    private WineEntity wine;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "color_id")
    private ColorEntity color;

    @NotNull
    private BigDecimal sweetness;

    @NotNull
    private BigDecimal intensity;

    @NotNull
    private BigDecimal acidity;

    @NotNull
    private BigDecimal alcohol;

    @NotNull
    private BigDecimal tannin;

    @NotNull
    private String opinion;

    @NotNull
    private BigDecimal rating;

}