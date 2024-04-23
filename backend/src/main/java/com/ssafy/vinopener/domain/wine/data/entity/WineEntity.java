package com.ssafy.vinopener.domain.wine.data.entity;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.common.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
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
    @Column(name = "wine_id")
    private Long id;
    private String nameKo;
    private String nameEn;
    private String imageUrl;
    private String grape;
    private String country;
    private String region;
    private Integer priceMin;
    private Integer priceMax;
    private Integer priceAvg;
    private Integer score;
    private String winery;
    private Integer vintage;
    @Column(columnDefinition = "enum")
    private WineType type;
    private Integer view;

    public WineEntity increaseView() {
        this.view++;
        return this;
    }

}
