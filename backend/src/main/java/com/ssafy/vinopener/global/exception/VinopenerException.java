package com.ssafy.vinopener.global.exception;

import org.zalando.problem.AbstractThrowableProblem;

public class VinopenerException extends AbstractThrowableProblem {
    public VinopenerException(ErrorCode errorCode) {
        super(
                null,
                errorCode.getStatus().name(),
                errorCode.getStatus(),
                errorCode.getDetail()
        );
    }
}
