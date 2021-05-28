package com.mall.wolmall.security.handler;

import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    public LoginSuccessHandler(String defaultTargetUrl) {
        setDefaultTargetUrl(defaultTargetUrl);
    }
}

