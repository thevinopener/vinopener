package coffee.ssafy.vinopenerbatch.domain.wine.entity;

import coffee.ssafy.vinopenerbatch.global.common.BaseTimeEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Entity(name = "flavour_taste")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
public class FlavourTasteEntity extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "flavour_taste_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "flavour_type_id", updatable = false)
    private FlavourTypeEntity flavourType;

    @NotNull
    private String name;

}
