package kr.or.ddit.user.knowhow;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/kh")
public class KnowhowController {

	@RequestMapping("/khList")
	public ModelAndView knowHowList(ModelAndView mv){
		
		
		mv.setViewName("user/knowhow/khList");
		
		return mv;
	}
}
