package com.ssafy.vinopener.domain.preference.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum PreferenceErrorCode implements ErrorCode {
    PREFERENCE_NOT_FOUND(Status.NOT_FOUND, Details.PREFERENCE_NOT_FOUND);

    private final Status status;
    private final String detail;

    public static class Details {

        private static final String PREFERENCE_NOT_FOUND = "선호도를 찾을 수 없습니다.";

    }

}
