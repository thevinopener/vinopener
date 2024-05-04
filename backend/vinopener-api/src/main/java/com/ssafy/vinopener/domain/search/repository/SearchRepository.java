package com.ssafy.vinopener.domain.search.repository;

import com.ssafy.vinopener.domain.search.data.entity.SearchEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SearchRepository extends JpaRepository<SearchEntity, Long> {

    List<SearchEntity> findAllByUserId(Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

}
