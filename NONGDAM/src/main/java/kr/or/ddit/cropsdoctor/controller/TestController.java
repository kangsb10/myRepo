package kr.or.ddit.cropsdoctor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class TestController {
	
	@RequestMapping("test")
	public String test() {
		
		return "test";
	}
	
	
}
