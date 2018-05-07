package com.gzry.core.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * Created by Huan on 2018/5/4.
 */
@Controller
public class UploadController {

    @RequestMapping("/upload")
    public String upload()
    {
        return "fileUpload";
    }

    @RequestMapping("/doUpload")
    public String doUpload(@RequestParam("file")MultipartFile file){
        if (!file.isEmpty()){
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), new File("d:\\"+file.getOriginalFilename()));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "success";
    }
}
