package com.ssafy.vinopener.global.s3;

import com.ssafy.vinopener.global.config.props.S3Props;
import java.io.IOException;
import java.net.URI;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;

@Service
@RequiredArgsConstructor
public class S3Service {

    private final S3Props s3Props;
    private final S3Client s3Client;

    public URI putObject(final String keyPrefix, final MultipartFile file)
            throws NoSuchAlgorithmException, IOException {
        final var digest = MessageDigest.getInstance("SHA-256");
        final var fileHash = HexFormat.of().formatHex(digest.digest(file.getBytes()));
        final var key = keyPrefix + fileHash + ".jpg";
        s3Client.putObject(builder -> builder
                        .bucket(s3Props.bucket())
                        .key(key)
                        .build(),
                RequestBody.fromInputStream(file.getInputStream(), file.getSize()));

//        System.out.println("Public Base URL: " + s3Props.publicBaseUrl());
//        System.out.println("Full Image URL: " + s3Props.publicBaseUrl() + "/" + key);
        return URI.create(s3Props.publicBaseUrl() + "/" + key);
    }

}
