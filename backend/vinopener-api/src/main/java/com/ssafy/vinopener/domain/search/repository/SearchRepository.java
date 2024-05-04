package com.ssafy.vinopener.domain.search.repository;

import com.ssafy.vinopener.domain.search.data.entity.SearchEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SearchRepository extends JpaRepository<SearchEntity, Long> {

}
