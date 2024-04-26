package com.ssafy.vinopener.domain.user.data.entity;

import com.ssafy.vinopener.global.common.BaseTimeEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity(name = "user")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
public class UserEntity extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;
    private String email;
    private String nickname;
    private String imageUrl;
    

}