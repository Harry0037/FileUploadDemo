package com.gzry.core.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Huan on 2018/5/4.
 */
@Controller
@RequestMapping("/Test")
public class TestController {

    @RequestMapping("/Test")
    @ResponseBody
    public String test(){
        return "hello world";
    }
}
