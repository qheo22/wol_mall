package com.mall.wolmall.security.social;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class FacebookClient {

    private static final String FACEBOOK_HOST = "https://graph.facebook.com";

    public ResponseEntity<HashMap<String, Object>> me(String access_token) {
        RestTemplate template = new RestTemplate();

        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + access_token);

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(headers);

        Map<String, String> params = new HashMap<>();
        params.put("access_token", access_token);

        ParameterizedTypeReference<HashMap<String, Object>> responseType = new ParameterizedTypeReference<HashMap<String, Object>>() {};

        return template.exchange(FACEBOOK_HOST + "/me", HttpMethod.GET, entity, responseType, params);
    }
}
