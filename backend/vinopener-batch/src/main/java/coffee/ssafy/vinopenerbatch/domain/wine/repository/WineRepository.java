package coffee.ssafy.vinopenerbatch.domain.wine.repository;

import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WineRepository extends JpaRepository<WineEntity, Long> {


}
