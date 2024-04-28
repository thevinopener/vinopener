package com.ssafy.vinopener.domain.cellar.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum CellarErrorCode implements ErrorCode {
    USER_NOT_FOUND(Status.NOT_FOUND, "유저를 찾을 수 없습니다."),
    WINE_NOT_FOUND(Status.NOT_FOUND, "와인을 찾을 수 없습니다."),
    CELLAR_NOT_FOUND(Status.NOT_FOUND, "셀러 목록을 찾을 수 없습니다.");

    private final Status status;
    private final String detail;
}
