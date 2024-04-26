package com.ssafy.vinopener.domain.bookmark.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum BookmarkErrorCode implements ErrorCode {
    // 즐겨찾기를 조회할 유저 정보가 올바르지 않을 경우.
    USER_NOT_FOUND(Status.NOT_FOUND, Details.USER_NOT_FOUND),
    // 즐겨찾기에 등록할 와인 정보가 올바르지 않을 경우.
    WINE_NOT_FOUND(Status.NOT_FOUND, Details.WINE_NOT_FOUND),
    BOOKMARK_NOT_FOUND(Status.NOT_FOUND, Details.BOOKMARK_NOT_FOUND);


    private final Status status;
    private final String detail;

    public static class Details{
        public static final String USER_NOT_FOUND = "유저를 찾을 수 없습니다.";
        public static final String WINE_NOT_FOUND = "와인을 찾을 수 없습니다.";
        public static final String BOOKMARK_NOT_FOUND = "즐겨찾기 목록을 찾을 수 없습니다.";
    }
}
