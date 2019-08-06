package kr.or.ddit.admin.main;

import kr.or.ddit.service.customercenter.ICustomerCenterService;
import kr.or.ddit.vo.CustomerCenterVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	
	@Autowired
	private ICustomerCenterService service;
	
	
	@RequestMapping(value="/main/main_mod")
	public ModelAndView indexMod(ModelAndView mv) throws Exception{
		
		int cnt = service.countAnswer();
		mv.addObject("cnt", cnt);
		return mv;
	}
}
