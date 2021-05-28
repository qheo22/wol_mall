package com.mall.wolmall.security.model;

import lombok.Data;

@Data
public class AuthenticationResponse {

    private String accessToken;

    public AuthenticationResponse(String jwt) {
        this.accessToken = jwt;
    }
}
