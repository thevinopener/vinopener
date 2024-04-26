package com.ssafy.vinopener.global.oauth2;

import com.ssafy.vinopener.global.config.props.GoogleClientProps;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class GoogleClient {

    private GoogleClientProps googleClientProps;

}
