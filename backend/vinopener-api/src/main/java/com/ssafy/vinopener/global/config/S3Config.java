package com.ssafy.vinopener.global.config;

import com.ssafy.vinopener.global.config.props.S3Props;
import java.net.URI;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.S3Configuration;

@Configuration
@RequiredArgsConstructor
public class S3Config {

    private final S3Props s3Props;

    @Bean
    public S3Client s3Client() {
        var builder = S3Client.builder();
        builder
                .credentialsProvider(StaticCredentialsProvider.create(AwsBasicCredentials.create(
                        s3Props.accessKeyId(),
                        s3Props.secretAccessKey())))
                .region(Region.of(s3Props.region()))
                .serviceConfiguration(S3Configuration.builder()
                        .pathStyleAccessEnabled(true)
                        .build());
        if (!s3Props.endpoint().isEmpty()) {
            builder.endpointOverride(URI.create(s3Props.endpoint()));
        }
        return builder.build();
    }

}
