package coffee.ssafy.vinopenerbatch.domain.wine.repository;

import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.enums.WineType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface WineRepository extends JpaRepository<WineEntity, Long> {

    // 타입별 검색
    List<WineEntity> findByType(WineType type);

    Page<WineEntity> findByType(WineType type, Pageable pageable);

    // 대소문자 구분하지 않고 검색
    List<WineEntity> findBySeoNameContainsIgnoreCase(String seoName);

    Page<WineEntity> findBySeoNameContainsIgnoreCase(String seoName, Pageable pageable);

    // 국가 검색
    List<WineEntity> findByCountry(String country);

    Page<WineEntity> findByCountry(String country, Pageable pageable);

    @Query("SELECT w FROM wine w WHERE w.id != :wineId")
    List<WineEntity> findAllExceptWineId(@Param("wineId") Long wineId);

}
