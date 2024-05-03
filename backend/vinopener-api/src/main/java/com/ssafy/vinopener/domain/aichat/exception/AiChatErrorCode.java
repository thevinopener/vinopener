package com.ssafy.vinopener.domain.aichat.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum AiChatErrorCode implements ErrorCode {
    ;

    private final Status status;
    private final String detail;

}
