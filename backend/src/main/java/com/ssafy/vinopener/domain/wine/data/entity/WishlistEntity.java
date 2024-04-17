package com.ssafy.vinopener.domain.wine.data.entity;

import com.ssafy.vinopener.global.common.BaseTimeEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity(name = "Wishlist")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
public class WishlistEntity extends BaseTimeEntity {
    @Id
    @Column(name = "wishlist_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "wine_id")
    private WineEntity wine;
}
