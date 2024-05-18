package coffee.ssafy.vinopenerbatch.global.writer;

import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.enums.ContentRecommendationType;
import coffee.ssafy.vinopenerbatch.domain.recommendation.repository.ContentRecommendationRepositoryQuery;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineViewEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.repository.WineRepository;
import coffee.ssafy.vinopenerbatch.domain.wine.repository.WineViewRepository;
import coffee.ssafy.vinopenerbatch.global.recommendation.RecommendationProcessor;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.batch.item.Chunk;
import org.springframework.batch.item.ItemWriter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@RequiredArgsConstructor
public class UpdateViewWriter implements ItemWriter<String> {
    private final RecommendationProcessor recommendationProcessor;
    private final ContentRecommendationRepositoryQuery contentRecommendationRepositoryQuery;
    private final WineViewRepository wineViewRepository;
    private final WineRepository wineRepository;

    @Transactional
    @Override
    public void write(Chunk<? extends String> items) throws Exception {
        Iterable<WineViewEntity> wineViewEntityList = wineViewRepository.findAll();
        wineViewEntityList.forEach(wineViewEntity -> {
            WineEntity wineEntity = wineRepository.findById(wineViewEntity.getWineId())
                    .orElseThrow(() -> new EntityNotFoundException("Wine not found"));
            wineEntity.increaseViewByCount(wineViewEntity.getViewCount().intValue());
            wineRepository.save(wineEntity);
            wineViewRepository.delete(wineViewEntity);

        });

        contentRecommendationRepositoryQuery.deleteAllByContentRecommendationType(ContentRecommendationType.VIEW);
        recommendationProcessor.createRecommendation(ContentRecommendationType.VIEW);
    }
}
