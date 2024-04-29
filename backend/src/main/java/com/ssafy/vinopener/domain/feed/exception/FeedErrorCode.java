package com.ssafy.vinopener.domain.feed.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum FeedErrorCode implements ErrorCode {
    IMAGE_NOT_FOUND(Status.NOT_FOUND, "이미지를 찾을 수 없습니다."),
    FEED_NOT_FOUND(Status.NOT_FOUND, "피드를 찾을 수 없습니다."),
    WINE_NOT_FOUND(Status.NOT_FOUND, "와인을 찾을 수 없습니다."),
    USER_NOT_FOUND(Status.NOT_FOUND, "유저를 찾을 수 없습니다.");

    private final Status status;
    private final String detail;
}
