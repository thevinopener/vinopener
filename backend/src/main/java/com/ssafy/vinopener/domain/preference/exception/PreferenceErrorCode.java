package com.ssafy.vinopener.domain.preference.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum PreferenceErrorCode implements ErrorCode {
    PREFERENCE_NOT_FOUND(Status.NOT_FOUND, "선호도를 찾을 수 없습니다.");

    private final Status status;
    private final String detail;

}
