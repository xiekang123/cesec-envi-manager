package cc.envi.wulian.controller;

import cc.envi.common.utils.FebsUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

    @GetMapping("demo")
    public String demo(){
        return FebsUtil.view("wulian/demo");
    }
}
