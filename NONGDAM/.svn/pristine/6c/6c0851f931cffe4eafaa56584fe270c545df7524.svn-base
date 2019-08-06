package kr.or.ddit.cropsdoctor.controller;

import kr.or.ddit.cropsdoctor.utiles.NaverUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/naver")
public class NaverController {
	
	private static NaverUtil util = new NaverUtil();
	
	@RequestMapping("/maps")
	public ModelAndView naverMaps(ModelAndView mv, 
								@RequestParam(value="latLong") String latLong){
		
//		NaverUtil util = new NaverUtil();
		String jsonStr = util.searchNYSbyMyLocation(latLong);
		
		mv.addObject("NYSlocation", jsonStr);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	@RequestMapping("/csr")
	public ModelAndView csr(@RequestParam(value="recordFile") MultipartFile recordFile,
							ModelAndView mv){
		
		String jsonStr = util.speechToText(recordFile);
		
		System.out.println(recordFile.toString());
	
		mv.addObject("STT",jsonStr);
		mv.setViewName("jsonConvertView");
	
		return mv;
	}
	
	
	
}
