package com.ssafy.vinopener.domain.aichat.repository;

import com.ssafy.vinopener.domain.aichat.data.entity.AiChatEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AiChatRepository extends JpaRepository<AiChatEntity, Long> {

    List<AiChatEntity> findAllByUserId(Long userId);

    void deleteAllByUserId(Long userId);

}
