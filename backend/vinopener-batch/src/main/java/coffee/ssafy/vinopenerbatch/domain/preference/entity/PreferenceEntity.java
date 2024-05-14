package coffee.ssafy.vinopenerbatch.domain.preference.entity;

import coffee.ssafy.vinopenerbatch.domain.user.entity.UserEntity;
import coffee.ssafy.vinopenerbatch.global.common.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotNull;
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

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", updatable = false)
    private UserEntity user;

    @NotNull
    private Boolean isRed;

    @NotNull
    private Boolean isWhite;

    @NotNull
    private Boolean isRose;

    @NotNull
    private Boolean isSparkling;

    @NotNull
    private Boolean isDessert;

    @NotNull
    private Boolean isFortified;

    @NotNull
    private Integer minAbv;

    @NotNull
    private Integer maxAbv;

    @NotNull
    private Integer sweetness;

    @NotNull
    private Integer acidity;

    @NotNull
    private Integer tannin;

}
