package com.ssafy.vinopener.domain.wine.data.entity;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.common.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.*;

@Entity(name = "Wine")
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
    private String grape;
    private String country;
    private String region;
    private Integer priceMin;
    private Integer priceMax;
    private Integer priceAvg;
    private String winery;
    private Integer year;
    @Column(columnDefinition = "enum")
    private WineType type;
    private Integer view;

    public void updateView() {
        this.view++;
    }
}
