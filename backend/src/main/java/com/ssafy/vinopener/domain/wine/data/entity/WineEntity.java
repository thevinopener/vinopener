package com.ssafy.vinopener.domain.wine.data.entity;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.common.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.math.BigDecimal;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity(name = "wine")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
public class WineEntity extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "wine_id")
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(length = 512, nullable = false)
    private String imageUrl;

    @Column(nullable = false)
    private String grape;

    @Column(nullable = false)
    private String winery;

    @Column(nullable = false)
    private String country;

    @Column(precision = 8, scale = 2, nullable = false)
    private BigDecimal price;

    @Column(precision = 2, scale = 1, nullable = false)
    private BigDecimal rating;

    @Column(nullable = false)
    private Integer vintage;

    @Column(columnDefinition = "ENUM")
    private WineType type;

    @Column(precision = 8, scale = 7, nullable = false)
    private BigDecimal acidity;

    @Column(precision = 8, scale = 7, nullable = false)
    private BigDecimal intensity;

    @Column(precision = 8, scale = 7, nullable = false)
    private BigDecimal sweetness;

    @Column(precision = 8, scale = 7, nullable = false)
    private BigDecimal tannin;

    @Column(precision = 4, scale = 1, nullable = false)
    private BigDecimal abv;

    @Column(nullable = false)
    private Integer view;

    public WineEntity increaseView() {
        this.view++;
        return this;
    }

}
