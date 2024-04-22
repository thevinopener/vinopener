package com.ssafy.vinopener.global.oauth2;

import java.util.Map;

public class GoogleOAuth2User extends OAuth2UserInfo {

    public GoogleOAuth2User(Map<String, Object> attributes) {
        super(attributes);
    }

    @Override
    public String getOAuth2Id() {
        return (String) attributes.get("sub");
    }

    @Override
    public String getEmail() {
        return "";
    }

    @Override
    public String getName() {
        return "";
    }

    @Override
    public String getNickname() {
        return "";
    }

    @Override
    public String profile_imgae() {
        return "";
    }

    @Override
    public String getAge() {
        return "";
    }

}
