package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TokenService {

    private final TokenRepository tokenRepository;

//    @Transactional
//    public void saveTokenInfo(Long id, String refreshToken) {
//        tokenRepository.save(new TokenEntity(id, refreshToken));
//    }
//
//    @Transactional
//    public void removeTokenInfo(String accessToken) {
//        //참고용 코드임. 수정 필요
//        tokenRepository.findByAccessToken(accessToken)
//                .ifPresent(refreshToken -> tokenRepository.delete(refreshToken));
//    }

}
