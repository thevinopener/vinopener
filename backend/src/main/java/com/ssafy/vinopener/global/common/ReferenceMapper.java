package com.ssafy.vinopener.global.common;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.RequiredArgsConstructor;
import org.mapstruct.TargetType;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ReferenceMapper {

    @PersistenceContext
    private final EntityManager entityManager;

    public <T> T resolve(@TargetType final Class<T> entityClass, final Long id) {
        return entityManager.getReference(entityClass, id);
    }

}
