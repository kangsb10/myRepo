package kr.or.ddit.admin.shopping;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.service.buyer.IBuyerService;
import kr.or.ddit.service.buyer.IBuyerServiceImpl;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.vo.BuyerVO;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop/popup")
public class AdminShoppingPopupController {
	
	@Autowired
	private IBuyerService service;

	
	
	@RequestMapping("/buyerCodeSearchWindow")
	public ModelAndView buyerCodeSearchWindow(ModelAndView mv) {
		
		mv.setViewName("user/shop/buyerCodeSearch");
		
		return mv;
	}

	@RequestMapping("/buyerCodeDataPush")
	public ModelAndView shoppingSearchBuyerCode(
			ModelAndView mv,
			@RequestParam(value = "buyer_nm", required = false) String buyer_nm) throws Exception {

		Map<String, String> params = new HashMap<String, String>();
		params.put("buyer_nm", buyer_nm);

		List<BuyerVO> buyerList = service.buyerList(params);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = "";
		try {
			jsonData = mapper.writeValueAsString(buyerList);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mv.addObject("jsonData", jsonData);
		mv.setViewName("jsonView");
		return mv;

	}

}
