package com.ssafy.vinopener.global.config.props;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "s3")
public record S3Props(
        String accessKeyId,
        String secretAccessKey,
        String region,
        String bucket,
        String endpoint,
        String publicBaseUrl
) {

}
