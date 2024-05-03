package com.ssafy.vinopener.domain.wine.repository;

import com.ssafy.vinopener.domain.wine.data.entity.WineChatEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WineChatRepository extends JpaRepository<WineChatEntity, Long> {

    List<WineChatEntity> findAllByWineId(Long wineId);

}
