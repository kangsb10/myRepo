package kr.or.ddit.user.shopping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.service.buyer.IBuyerService;
import kr.or.ddit.service.buyer.IBuyerServiceImpl;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.shopping.IShoppingService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PaymentVO;
import kr.or.ddit.vo.ShoppingVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/shop/")
public class ShoppingController {
	@Autowired
	private IShoppingService service;
	
	
	@Autowired
	private IBuyerService buyservice;

	@RequestMapping("shopList")
	public Model shoppingList(Model model
							  , Map<String, String> params
							  , HttpServletRequest request
							  , @RequestParam(value="input_search", required=false) String search_keyword
//							  , String search_keycode
							  ,@RequestParam(required=false) String lprod_nm ) throws Exception {

		String currentPage = request.getParameter("currentPage");
	     if(currentPage==null){
	        currentPage = "1";
	     }
	      
	     params.put("search_keyword", search_keyword);
//	     params.put("search_keycode", search_keycode);
	     params.put("lprod_gu", lprod_nm);
	         
	     int totalCount = service.totalCount(params);
	     RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
	     params.put("startCount", pagingUtiles.getStartCount());
	     params.put("endCount", pagingUtiles.getEndCount());
		
		 List<ShoppingVO> shoppingList = this.service.shoppingList(params);
//		 System.out.println(shoppingList.get(0).getItems().get(0).getGoods_file_save_name());
		 
		 
		 model.addAttribute("shoppingList", shoppingList);
	     model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
	     model.addAttribute("search_keyword", search_keyword);
//	     model.addAttribute("search_keycode", search_keycode);
	     model.addAttribute("lprod_gu", lprod_nm);
	     
		return model;

	}
	@RequestMapping("shopView")
	public ModelMap shopView(ModelMap modelMap
							 , @RequestParam String goods_id
							 , Map<String, String> params) throws Exception{
		params.put("goods_id", goods_id);
		
		ShoppingVO shoppingInfo = service.shoppingInfo(params);
		
		modelMap.addAttribute("shoppingInfo", shoppingInfo);
		
		return modelMap;
	}
	
	
	
	@RequestMapping("/1shopForm")
	public ModelAndView shoppingRegForm(ModelAndView mv)throws Exception {

		mv.setViewName("user/shop/prodForm_mod");

		return mv;
	}
	
	
	@RequestMapping("/insertPayment")
	public String insertPayment(PaymentVO paymentInfo) throws Exception{
		service.insertPaymentInfo(paymentInfo);
		System.out.println(paymentInfo);
		return "redirect:/user/shop/shopList.do";
	}
	
	
//	@RequestMapping("/buyerCodeSearchWindow")
//	public ModelAndView buyerCodeSearchWindow(ModelAndView mv) {
//		
//		mv.setViewName("user/shop/buyerCodeSearch");
//		
//		return mv;
//	}
//
//	@RequestMapping("/buyerCodeSearch")
//	public ModelAndView shoppingSearchBuyerCode(
//			ModelAndView mv,
//			@RequestParam(value = "buyer_name", required = false) String buyer_name) throws Exception {
//
//		Map<String, String> params = new HashMap<String, String>();
//		params.put("buyer_name", buyer_name);
//
//		List<BuyerVO> buyerList = service.buyerList(params);
//		
//		mv.addObject("result", buyerList);
//		mv.setViewName("user/shop/buyerCodeSearch");
//
//		return mv;
//	}

}
