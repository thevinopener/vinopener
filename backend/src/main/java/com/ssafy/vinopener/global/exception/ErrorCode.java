package com.ssafy.vinopener.global.exception;

import org.zalando.problem.Status;

public interface ErrorCode {

    Status getStatus();

    String getDetail();
}
