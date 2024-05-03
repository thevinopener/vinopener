package com.ssafy.vinopener.domain.user.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum UserErrorCode implements ErrorCode {
    USER_NOT_FOUND(Status.NOT_FOUND, "사용자가 존재하지 않습니다.");

    private final Status status;
    private final String detail;
}
