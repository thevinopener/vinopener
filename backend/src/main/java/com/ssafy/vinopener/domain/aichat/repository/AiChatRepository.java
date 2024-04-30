package com.ssafy.vinopener.domain.aichat.repository;

import com.ssafy.vinopener.domain.aichat.data.entity.AiChatEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AiChatRepository extends JpaRepository<AiChatEntity, Long> {

    List<AiChatEntity> findAllByUserId(Long userId);

    void deleteAllByUserId(Long userId);

}
