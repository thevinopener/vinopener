package com.ssafy.vinopener.global.common;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import java.time.LocalDateTime;
import lombok.Getter;

/**
 * {@code schema.sql}에서 {@code DEFAULT CURRENT_TIMESTAMP}, {@code ON UPDATE CURRENT_TIMESTAMP}를 정의했습니다. 그러므로
 * {@code @EntityListeners(AuditingEntityListener.class)}, {@code @CreatedDate}, {@code @LastModifiedDate}를 사용하지 않습니다.
 */
@MappedSuperclass
@Getter
public abstract class BaseTimeEntity {

    @Column(nullable = false, insertable = false, updatable = false)
    private LocalDateTime createdTime;

    @Column(nullable = false, insertable = false, updatable = false)
    private LocalDateTime updatedTime;

}
