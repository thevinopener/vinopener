package com.ssafy.vinopener.domain.wine.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum WineErrorCode implements ErrorCode {
    WINE_NOT_FOUND(Status.NOT_FOUND, Details.WINE_NOT_FOUND);

    private final Status status;
    private final String detail;

    public static class Details {

        public static final String WINE_NOT_FOUND = "와인을 찾을 수 없습니다.";

    }
}
