package com.ssafy.vinopener.domain.aichat.repository;

import com.ssafy.vinopener.domain.aichat.data.entity.AssistantThreadEntity;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface AssistantThreadRepository extends JpaRepository<AssistantThreadEntity, Long> {

    Optional<AssistantThreadEntity> findByUserId(Long userId);

    @Transactional
    @Modifying
    @Query("DELETE FROM assistant_thread a WHERE a.user.id = :userId")
    void deleteAllByUserId(@Param("userId") Long userId);

}
