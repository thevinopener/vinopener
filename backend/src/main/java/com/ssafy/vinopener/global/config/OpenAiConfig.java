package com.ssafy.vinopener.global.config;

import com.ssafy.vinopener.global.config.props.OpenAiProps;
import io.github.sashirestela.openai.SimpleOpenAI;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class OpenAiConfig {

    private final OpenAiProps openAiProps;

    @Bean
    public SimpleOpenAI simpleOpenAI() {
        return SimpleOpenAI.builder()
                .apiKey(openAiProps.apiKey())
                .organizationId(openAiProps.organizationId())
                .projectId(openAiProps.projectId())
                .build();
    }

}
