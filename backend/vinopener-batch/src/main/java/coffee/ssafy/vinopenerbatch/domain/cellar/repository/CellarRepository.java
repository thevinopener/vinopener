package coffee.ssafy.vinopenerbatch.domain.cellar.repository;

import coffee.ssafy.vinopenerbatch.domain.cellar.entity.CellarEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface CellarRepository extends JpaRepository<CellarEntity, Long> {

    List<CellarEntity> findAllByUserId(Long userId);

    Optional<CellarEntity> findByIdAndUserId(Long id, Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

    boolean existsByIdAndUserId(Long id, Long userId);

    boolean existsByWineIdAndUserId(Long windId, Long userId);

}
