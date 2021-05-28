package com.mall.wolmall.service;

import com.mall.wolmall.model.PropertyModel;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PropertyServiceImpl implements PropertyService {


    @Value("${aws.s3.url}")
    private String s3BaseUrl;

//    @Override
//    public VersionModel getVersion() {
//        return propertyMapper.selectVersion();
//    }

    public PropertyModel getProperty() {
//        VersionModel versionModel = Optional.ofNullable(propertyMapper.selectVersion()).orElse(new VersionModel());

        PropertyModel model = new PropertyModel();

//        model.setLiveVersion(null != versionModel.getVersionName() ? versionModel.getVersionName() : "0.0.0");
        model.setS3BaseUrl(s3BaseUrl);

        return model;
    }
}
