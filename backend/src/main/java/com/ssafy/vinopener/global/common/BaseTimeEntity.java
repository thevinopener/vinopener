package com.ssafy.vinopener.global.common;

import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
@Getter
public abstract class BaseTimeEntity {
    @Column(nullable = false, insertable = false, updatable = false)
    private LocalDateTime createdTime;

    @Column(nullable = false, insertable = false, updatable = false)
    private LocalDateTime updatedTime;
}
