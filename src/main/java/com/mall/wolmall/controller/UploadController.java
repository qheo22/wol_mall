package com.mall.wolmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class UploadController {


    @GetMapping("/upload")
    public String uploadPage(Model model, HttpServletRequest request) {
        return "admin_upload";
    }
}

