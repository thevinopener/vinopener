package coffee.ssafy.vinopenerbatch.domain.preference.repository;

import coffee.ssafy.vinopenerbatch.domain.preference.entity.PreferenceEntity;
import java.util.Optional;

public interface PreferenceRepositoryQuery {

    Optional<PreferenceEntity> findByUserId(Long userId);

}
