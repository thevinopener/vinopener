package coffee.ssafy.vinopenerbatch.domain.wine.repository;

import coffee.ssafy.vinopenerbatch.domain.wine.entity.FlavourTasteEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FlavourTasteRepository extends JpaRepository<FlavourTasteEntity, Long> {

    List<FlavourTasteEntity> findAllByIdIn(List<Long> ids);

    List<FlavourTasteEntity> findAllByNameIn(List<String> names);

}
