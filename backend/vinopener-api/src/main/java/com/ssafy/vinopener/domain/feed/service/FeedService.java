package com.ssafy.vinopener.domain.feed.service;

import com.ssafy.vinopener.domain.feed.data.dto.request.FeedCreateRequest;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetResponse;
import com.ssafy.vinopener.domain.feed.data.entity.FeedEntity;
import com.ssafy.vinopener.domain.feed.data.entity.FeedWineEntity;
import com.ssafy.vinopener.domain.feed.data.mapper.FeedLikeMapper;
import com.ssafy.vinopener.domain.feed.data.mapper.FeedMapper;
import com.ssafy.vinopener.domain.feed.data.mapper.FeedWineMapper;
import com.ssafy.vinopener.domain.feed.exception.FeedErrorCode;
import com.ssafy.vinopener.domain.feed.repository.FeedLikeRepository;
import com.ssafy.vinopener.domain.feed.repository.FeedRepository;
import com.ssafy.vinopener.domain.feed.repository.FeedWineRepository;
import com.ssafy.vinopener.domain.user.exception.UserErrorCode;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import com.ssafy.vinopener.global.s3.S3Service;
import java.io.IOException;
import java.net.URI;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
public class FeedService {

    private final FeedRepository feedRepository;
    private final FeedWineRepository feedWineRepository;
    private final FeedLikeRepository feedLikeRepository;
    private final FeedMapper feedMapper;
    private final FeedWineMapper feedWineMapper;
    private final FeedLikeMapper feedLikeMapper;
    private final UserRepository userRepository;
    private final WineRepository wineRepository;
    private final S3Service s3Service;

    /**
     * 피드 생성
     *
     * @param feedCreateRequest 피드 생성 요청
     * @param userId            유저 ID
     * @return 생성된 피드 ID
     */
    @Transactional
    public Long create(
            final FeedCreateRequest feedCreateRequest,
            final Long userId
    ) throws NoSuchAlgorithmException, IOException {
        MultipartFile imageFile = feedCreateRequest.imageFile();
        String keyPrefix = "feeds/" + userId + "/";
        URI imageUrl = s3Service.putObject(keyPrefix, imageFile);

        FeedEntity feed = FeedEntity.builder()
                .user(userRepository.findById(userId)
                        .orElseThrow(() -> new VinopenerException(UserErrorCode.USER_NOT_FOUND)))
                .content(feedCreateRequest.content())
                .imageUrl(imageUrl.toString())
                .isPublic(feedCreateRequest.isPublic())
                .build();

        feed = feedRepository.save(feed);

        createFeedWines(feed, feedCreateRequest.wineIds());

        return feed.getId();
    }

    private void createFeedWines(FeedEntity feed, Set<Long> wineIds) {
        wineIds.forEach(wineId -> {
            WineEntity wine = wineRepository.findById(wineId)
                    .orElseThrow(() -> new VinopenerException(WineErrorCode.WINE_NOT_FOUND));
            FeedWineEntity feedWine = FeedWineEntity.builder()
                    .feed(feed)
                    .wine(wine)
                    .build();
            feedWineRepository.save(feedWine);
        });
    }

    @Transactional(readOnly = true)
    public List<FeedGetListResponse> getList() {
        List<FeedEntity> feeds = feedRepository.findAll();

        return feeds.stream()
                .map(feed -> {
                    int totalLikes = feedLikeRepository.countByFeedId(feed.getId());
                    List<FeedWineEntity> feedWines = feedWineRepository.findAllByFeedId(feed.getId());
                    return feedMapper.toGetListResponse(feed, feedWines, totalLikes);
                })
                .toList();

    }

    @Transactional(readOnly = true)
    public FeedGetResponse getFeed(
            Long feedId
    ) {
        feedExists(feedId);
        FeedEntity feed = feedRepository.findById(feedId)
                .orElseThrow(() -> new VinopenerException(FeedErrorCode.FEED_NOT_FOUND));
        int totalLikes = feedLikeRepository.countByFeedId(feed.getId());
        List<FeedWineEntity> wines = feedWineRepository.findByFeedId(feedId);

        return feedMapper.toGetResponse(feed, wines, totalLikes);
    }

    @Transactional(readOnly = true)
    public List<FeedGetListResponse> getMyFeedList(
            final Long userId
    ) {
        List<FeedEntity> feeds = feedRepository.findAllByUserId(userId);
        return feeds.stream()
                .map(feed -> {
                    int totalLikes = feedLikeRepository.countByFeedId(feed.getId());
                    List<FeedWineEntity> feedWines = feedWineRepository.findByFeedId(feed.getId());
                    return feedMapper.toGetListResponse(feed, feedWines, totalLikes);
                })
                .toList();
    }

    @Transactional(readOnly = true)
    public Optional<FeedGetResponse> getMyFeed(
            final Long feedId,
            final Long userId
    ) {
        feedExists(feedId);
        FeedEntity feed = feedRepository.findByIdAndUserId(feedId, userId)
                .orElseThrow(() -> new VinopenerException(FeedErrorCode.FEED_NOT_FOUND));
        int totalLikes = feedLikeRepository.countByFeedId(feed.getId());
        List<FeedWineEntity> wines = feedWineRepository.findByFeedId(feedId);
        return Optional.of(feedMapper.toGetResponse(feed, wines, totalLikes));
    }

    private void feedExists(
            final Long feedId
    ) {
        feedRepository.findById(feedId)
                .orElseThrow(() -> new VinopenerException(FeedErrorCode.FEED_NOT_FOUND));
    }


    /*
    1. 전체 피드::getList()           -> findByAll
    2. 상세조회::get()                -> findByFeedId
    3. 내 피드 목록::getMyList()      -> findByAllIdAndUserId
    4. 내 피드 상세 조회::getMyFeed() -> findByIdAndUserId
     */

}
