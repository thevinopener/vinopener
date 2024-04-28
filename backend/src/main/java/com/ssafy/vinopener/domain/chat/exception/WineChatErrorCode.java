package com.ssafy.vinopener.domain.chat.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum WineChatErrorCode implements ErrorCode {
    ;

    private final Status status;
    private final String detail;

}
