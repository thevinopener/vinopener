package com.ssafy.vinopener.domain.preference.repository;

import com.ssafy.vinopener.domain.preference.data.entity.PreferenceEntity;
import java.util.Optional;

public interface PreferenceRepositoryQuery {

    Optional<PreferenceEntity> findByUserId(Long userId);

}
