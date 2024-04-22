package com.ssafy.vinopener.domain.user.data.entity;

import com.ssafy.vinopener.global.common.BaseTimeEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity(name = "User")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
public class UserEntity extends BaseTimeEntity {

    @Id
    @Column(name = "user_id")
    private Long id;
    private String email;
    private String nickname;
    private String imageUrl;

}

/**
 * CREATE TABLE `User` ( `user_id`      BIGINT PRIMARY KEY AUTO_INCREMENT, `email`        VARCHAR(320) NOT NULL UNIQUE,
 * `nickname`     VARCHAR(16)  NOT NULL UNIQUE, `image_url`    VARCHAR(512), `created_time` TIMESTAMP    NOT NULL
 * DEFAULT CURRENT_TIMESTAMP, `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 * );
 */