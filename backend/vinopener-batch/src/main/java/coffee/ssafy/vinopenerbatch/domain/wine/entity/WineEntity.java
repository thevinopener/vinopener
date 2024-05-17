package coffee.ssafy.vinopenerbatch.domain.wine.entity;

import coffee.ssafy.vinopenerbatch.domain.wine.entity.enums.WineType;
import coffee.ssafy.vinopenerbatch.global.common.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;

@Entity(name = "wine")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
public class WineEntity extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "wine_id")
    private Long id;

    @NotNull
    private String name;

    @NotNull
    private String seoName;

    @NotNull
    private String imageUrl;

    @NotNull
    private String grape;

    @NotNull
    private String winery;

    @NotNull
    private String country;

    @NotNull
    private BigDecimal price;

    @NotNull
    private BigDecimal rating;

    @NotNull
    private Integer vintage;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM")
    private WineType type;

    @NotNull
    private BigDecimal acidity;

    @NotNull
    private BigDecimal intensity;

    @NotNull
    private BigDecimal sweetness;

    @NotNull
    private BigDecimal tannin;

    @NotNull
    private BigDecimal abv;

    @NotNull
    private Integer view;

    public WineEntity increaseView() {
        this.view++;
        return this;
    }

    public WineEntity increaseViewByCount(int count) {
        this.view += count;
        return this;
    }
}
