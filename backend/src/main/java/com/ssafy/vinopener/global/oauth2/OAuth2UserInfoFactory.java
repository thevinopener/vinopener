package com.ssafy.vinopener.global.oauth2;

import java.util.Map;

public class OAuth2UserInfoFactory {

    public static OAuth2UserInfo getOAuth2UserInfo(AuthProviderType authProviderType, Map<String, Object> attributes) {
        switch (authProviderType) {
//            case NAVER:
//                return new NaverOAuth2User(attributes);
//            case KAKAO:
//                return new KakaoOAuth2User(attributes);
            case GOOGLE:
                return new GoogleOAuth2User(attributes);

            default:
                throw new IllegalArgumentException("Invalid Provider Type.");
        }
    }

}
