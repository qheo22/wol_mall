package com.mall.wolmall.controller.page;


import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminLoginController {

    @GetMapping("/login")
    public String login() {

        if(isAuthenticated()) {
            // 로그인 상태 redirect
            System.out.println("redirect:/admin");
            return "redirect:/admin/upload";
        }

        return "admin_login";
    }

    private boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication == null || AnonymousAuthenticationToken.class.
                isAssignableFrom(authentication.getClass())) {
            return false;
        }
        return authentication.isAuthenticated();
    }

}
