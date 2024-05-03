package com.ssafy.vinopener.domain.preference.repository;

import com.ssafy.vinopener.domain.preference.data.entity.PreferenceEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PreferenceRepository extends JpaRepository<PreferenceEntity, Long>, PreferenceRepositoryQuery {

}
