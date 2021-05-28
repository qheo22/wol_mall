package com.mall.wolmall.handler;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Objects;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class S3Uploader implements Uploader {

    private final AmazonS3Client amazonS3Client;

    @Value("${cloud.aws.s3.bucket}")
    public String bucket;

    public String upload(MultipartFile multipartFile, String dirName) throws IOException {
        File uploadFile = convert(multipartFile);//.orElseThrow(() -> new IllegalArgumentException("MultipartFile -> File 로의 변경이 실패했습니다"));
        return upload(uploadFile, dirName);
    }

    private String upload(File uploadFile, String dirName) {
        String fileName = dirName + "/" + uploadFile.getName();
        String uploadImageUrl = putS3(uploadFile, fileName);
        File thumb250File = ThumbnailFactory.createThumbnail(uploadFile, 250, ".s");
        String thumb250FileName = dirName + "/" + thumb250File.getName();
        String uploadThumb250ImageUrl = putS3(thumb250File, thumb250FileName);

        File thumb500File = ThumbnailFactory.createThumbnail(uploadFile, 500, ".m");
        String thumb500FileName = dirName + "/" + thumb500File.getName();
        String uploadThumb500ImageUrl = putS3(thumb500File, thumb500FileName);

        removeNewFile(thumb250File);
        removeNewFile(thumb500File);
        removeNewFile(uploadFile);

        System.out.println("썸네일 업로드 성공 ?? = " + uploadThumb250ImageUrl + " / " + uploadThumb500ImageUrl);

        return uploadImageUrl;
    }

    private String putS3(File uploadFile, String fileName) {
        amazonS3Client.putObject(new PutObjectRequest(bucket, fileName, uploadFile).withCannedAcl(CannedAccessControlList.PublicRead));
        String url = amazonS3Client.getUrl(bucket, fileName).toExternalForm();
        log.info("업로드 파일 경로!!! = " + url);
        return url;
    }

    private void removeNewFile(File targetFile) {
        if(targetFile.delete()) {
            log.info(String.format("파일 (%s) 이 삭제되었습니다.", targetFile));
        } else {
            log.info(String.format("파일 (%s) 이 삭제되지 못했습니다.", targetFile));
        }
    }

    public File convert(MultipartFile file) throws IOException {
        File convFile = new File(Objects.requireNonNull(file.getOriginalFilename()));
        if(convFile.createNewFile()) {
            FileOutputStream fos = new FileOutputStream(convFile);
            fos.write(file.getBytes());
            fos.close();
            return convFile;
        }
        return convFile;
    }
}
