package com.mall.wolmall.handler;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;

public class ThumbnailFactory {

    public static File createThumbnail(File originFile, int maxSize, String addName) {

        File thumbFile = null;

        try {
            int thumbnail_width = maxSize;
            int thumbnail_height = maxSize;

            String ext = getFileExt(originFile.getName());
            String newFileName = originFile.getName().replace("." + ext, "." + ext + addName);

            BufferedImage buffer_original_image = ImageIO.read(originFile);

            double imgWidth = buffer_original_image.getWidth();
            double imgHeight = buffer_original_image.getHeight();

            if(imgWidth < imgHeight) {
                thumbnail_width = (int)((imgWidth / imgHeight) * maxSize);
            } else {
                thumbnail_height = (int)((imgHeight / imgWidth) * maxSize);
            }

            int imgType = (buffer_original_image.getTransparency() == Transparency.OPAQUE) ? BufferedImage.TYPE_INT_RGB : BufferedImage.TYPE_INT_ARGB;
            BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, imgType);
            Graphics2D graphic = buffer_thumbnail_image.createGraphics();

            graphic.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
            graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);


            if(ext.equalsIgnoreCase("jpg")) {
                thumbFile = writeJpeg(buffer_thumbnail_image, newFileName, 1.0f);
            } else {
                thumbFile = new File(newFileName);
                ImageIO.write(buffer_thumbnail_image, ext.toLowerCase(), thumbFile);
            }

            graphic.dispose();
        } catch (Exception e) {
            e.printStackTrace(System.err);
            thumbFile = null;
        }

        return thumbFile;
    }

    private static String getFileExt(String fileName) { // "abc.txt" -> "txt", not ".txt"
        int i = fileName.lastIndexOf('.');
        int p = Math.max(fileName.lastIndexOf('/'), fileName.lastIndexOf('\\'));
        if(i > p) {
            return fileName.substring(i + 1);
        }
        return null;
    }

    private static File writeJpeg(BufferedImage image, String destFile, float quality) throws IOException {
        ImageWriter writer = null;
        FileImageOutputStream output = null;
        File thumbFile = new File(destFile);

        try {

            writer = ImageIO.getImageWritersByFormatName("jpeg").next();

            ImageWriteParam param = writer.getDefaultWriteParam();

            param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
            param.setCompressionQuality(quality);

            output = new FileImageOutputStream(thumbFile);
            writer.setOutput(output);

            IIOImage iioImage = new IIOImage(image, null, null);
            writer.write(null, iioImage, param);

        } catch (IOException ex) {
            thumbFile = null;
            throw ex;
        } finally {
            if(writer != null) {
                writer.dispose();
            }

            if(output != null) {
                output.close();
            }
        }


        return thumbFile;
    }
}
