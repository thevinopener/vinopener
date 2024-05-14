package coffee.ssafy.vinopenerbatch.domain.wine.entity;

import coffee.ssafy.vinopenerbatch.global.common.BaseTimeEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Entity(name = "flavour_type")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
public class FlavourTypeEntity extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "flavour_type_id")
    private Long id;

    @NotNull
    private String name;

}
