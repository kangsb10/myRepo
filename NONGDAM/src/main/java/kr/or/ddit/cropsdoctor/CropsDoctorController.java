package kr.or.ddit.cropsdoctor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CropsDoctorController {
	
	/**
	 * @author 강새벽
	 * @param mv
	 * @return ModelAndView
	 */
	@RequestMapping("/cropsDoctor")
	public ModelAndView cropsDoctor(ModelAndView mv){
		
		mv.setViewName("cropsdoctor/cropsDoctor");
		
		return mv;
	}

}
