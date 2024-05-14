package coffee.ssafy.vinopenerbatch.domain.tastingnote.entity;

import coffee.ssafy.vinopenerbatch.domain.user.entity.UserEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineEntity;
import coffee.ssafy.vinopenerbatch.global.common.BaseTimeEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

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

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", updatable = false)
    private UserEntity user;

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

    @Builder.Default
    @OneToMany(mappedBy = "tastingNote", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<TastingNoteFlavourEntity> flavours = new HashSet<>();

}
