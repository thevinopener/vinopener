package com.ssafy.vinopener.global.config.props;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "openai")
public record OpenAiProps(
        String apiKey,
        String organizationId,
        String projectId
) {

}
