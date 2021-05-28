package com.mall.wolmall.security.provider;

import com.mall.wolmall.security.social.FacebookClient;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.util.HashMap;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class SocialServiceProvider {

    public static final int SOCIAL_TYPE_FACEBOOK = 0;
    public static final int SOCIAL_TYPE_GOOGLE = 1;

    private final FacebookClient facebookClient;

    public String ssoExtractor(String extractorToken, int socialType, String userName) {

        switch(socialType) {
            case SOCIAL_TYPE_FACEBOOK: {
                ResponseEntity<HashMap<String, Object>> response = facebookClient.me(extractorToken);
                if(response.hasBody()) {
                    assert response.getBody() != null;
                    return response.getBody().get("id").toString();
                }

                return null;
            }
            case SOCIAL_TYPE_GOOGLE:
                return userName;
            default:
                return null;
        }
    }
}
