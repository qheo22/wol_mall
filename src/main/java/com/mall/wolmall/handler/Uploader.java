package com.mall.wolmall.handler;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface Uploader {
    String upload(MultipartFile multipartFile, String dirName) throws IOException;
}
