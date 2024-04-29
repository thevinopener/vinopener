package com.ssafy.vinopener.domain.feed.service;

import com.ssafy.vinopener.domain.feed.repository.FeedRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FeedService {

    private final FeedRepository feedRepository;
//    private final FeedMapper feedMapper;
}
