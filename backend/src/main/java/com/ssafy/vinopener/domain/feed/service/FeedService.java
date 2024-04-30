package com.ssafy.vinopener.domain.feed.service;

import com.ssafy.vinopener.domain.feed.data.dto.request.FeedCreateRequest;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse;
import com.ssafy.vinopener.domain.feed.data.entity.FeedEntity;
import com.ssafy.vinopener.domain.feed.data.entity.FeedLikeEntity;
import com.ssafy.vinopener.domain.feed.data.entity.FeedWineEntity;
import com.ssafy.vinopener.domain.feed.data.mapper.FeedLikeMapper;
import com.ssafy.vinopener.domain.feed.data.mapper.FeedMapper;
import com.ssafy.vinopener.domain.feed.data.mapper.FeedWineMapper;
import com.ssafy.vinopener.domain.feed.repository.FeedLikeRepository;
import com.ssafy.vinopener.domain.feed.repository.FeedRepository;
import com.ssafy.vinopener.domain.feed.repository.FeedWineRepository;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
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
    ) {
        // TODO : orElseThrow()
        String imageUrl = saveFile(feedCreateRequest.imageFile());
        UserEntity user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));

        FeedEntity feed = FeedEntity.builder()
                .user(user)
                .content(feedCreateRequest.content())
                .imageUrl(imageUrl)
                .isPublic(feedCreateRequest.isPublic())
                .build();

        feedRepository.save(feed);
        return feed.getId();
//        return feedRepository
//                .save(feedMapper.toEntity(userId, feedCreateRequest))
//                .getId();
    }

    private String saveFile(MultipartFile file) {
        Path path = Paths.get("C:\\Users\\SSAFY\\Downloads");

        try {
            Path targetLocation = path.resolve(file.getOriginalFilename());
            Files.copy(file.getInputStream(), targetLocation);

            // Return a URL or a path as string
            return targetLocation.toString();
        } catch (IOException e) {
            throw new RuntimeException("Failed to store file", e);
        }
    }

    @Transactional(readOnly = true)
    public List<FeedGetListResponse> getList(
            final Long userId
    ) {
//        List<FeedEntity> feeds = feedRepository.findAll();
//        return feeds.stream()
//                .map(feed -> {
//                    FeedWineEntity wine = feedWineRepository.findByFeedId(feed.getId())
//                            .orElseThrow(
//                                    () -> new EntityNotFoundException("Wine not found for feed ID: " + feed.getId()));
//                    FeedLikeEntity like = feedLikeRepository.findByFeedId(feed.getId())
//                            .orElseThrow(
//                                    () -> new EntityNotFoundException("Like not found for feed ID: " + feed.getId()));
//                    return feedMapper.toGetListResponse(feed, wine, like);
//                })
//                .toList();

        List<FeedEntity> feeds = feedRepository.findAll();
        return feeds.stream()
                .map(feed -> {
                    FeedWineEntity wine = feedWineRepository.findByFeedId(feed.getId());
                    FeedLikeEntity like = feedLikeRepository.findByFeedId(feed.getId());
                    return feedMapper.toGetListResponse(feed, wine, like);
                })
                .toList();

//        return feedRepository.findAllByUserId(userId)
//                .stream()
//                .map(feedMapper::toGetListResponse)
//                .toList();
    }

}
