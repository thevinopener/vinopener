package coffee.ssafy.vinopenerbatch.domain.recommendation.repository;

import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.enums.WineType;

import java.util.List;
import java.util.Set;

public interface RecommendationRepositoryQuery {

    List<WineEntity> findByWineTypeSet(Set<WineType> wineTypeLIst);

}
