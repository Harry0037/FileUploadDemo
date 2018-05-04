package com.gzry.core.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
