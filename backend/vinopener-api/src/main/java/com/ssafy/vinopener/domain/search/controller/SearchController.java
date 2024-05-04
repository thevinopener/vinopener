package com.ssafy.vinopener.domain.search.controller;

import com.ssafy.vinopener.domain.feed.controller.FeedController;
import com.ssafy.vinopener.domain.search.service.SearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(FeedController.REQUEST_PATH)
@RequiredArgsConstructor
public class SearchController {

    public static final String REQUEST_PATH = "/searchs";
    public static final String REQUEST_PATH_VARIABLE = "/{searchId}";
    private final SearchService searchService;

}
