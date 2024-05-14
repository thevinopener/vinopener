package coffee.ssafy.vinopenerbatch.domain.preference.repository;

import coffee.ssafy.vinopenerbatch.domain.preference.entity.PreferenceEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PreferenceRepository extends JpaRepository<PreferenceEntity, Long>, PreferenceRepositoryQuery {

}
