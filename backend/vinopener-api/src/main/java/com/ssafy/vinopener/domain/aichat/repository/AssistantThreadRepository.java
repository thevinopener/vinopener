package com.ssafy.vinopener.domain.aichat.repository;

import com.ssafy.vinopener.domain.aichat.data.entity.AssistantThreadEntity;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

public interface AssistantThreadRepository extends JpaRepository<AssistantThreadEntity, Long> {

    Optional<AssistantThreadEntity> findByUserId(Long userId);

    @Transactional
    void deleteAllByUserId(Long userId);

}
