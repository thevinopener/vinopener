package com.ssafy.vinopener.domain.bookmark.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum BookmarkErrorCode implements ErrorCode {
    // 즐겨찾기를 조회할 유저 정보가 올바르지 않을 경우.
    USER_NOT_FOUND(Status.NOT_FOUND, "유저를 찾을 수 없습니다."),
    // 즐겨찾기에 등록할 와인 정보가 올바르지 않을 경우.
    WINE_NOT_FOUND(Status.NOT_FOUND, "와인을 찾을 수 없습니다."),
    BOOKMARK_NOT_FOUND(Status.NOT_FOUND, "즐겨찾기 목록을 찾을 수 없습니다."),
    NOT_BOOKMARKED_WINE(Status.NOT_FOUND, "그 와인을 즐겨찾기 한 적 없습니다 ~");

    private final Status status;
    private final String detail;
}
