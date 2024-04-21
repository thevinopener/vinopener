package com.ssafy.vinopener.global.common;

import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import java.time.LocalDateTime;
import lombok.Getter;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
@Getter
public abstract class BaseTimeEntity {

    @Column(nullable = false, insertable = false, updatable = false)
    private LocalDateTime createdTime;

    @Column(nullable = false, insertable = false, updatable = false)
    private LocalDateTime updatedTime;

}
