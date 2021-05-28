package com.mall.wolmall.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.commons.lang3.RandomStringUtils;

public class CommonUtils {
    //고유 아이디 만들기 (yyyyMMddHHmmssSSS_랜덤문자6개)
    public static String getUniqueId() {
        String uniqueId = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        Calendar dateTime = Calendar.getInstance();
        uniqueId = sdf.format(dateTime.getTime());

        //yyyymmddhh24missSSS_랜덤문자6개
        uniqueId = uniqueId + "_" + RandomStringUtils.randomAlphanumeric(8);

        return uniqueId;
    }
}