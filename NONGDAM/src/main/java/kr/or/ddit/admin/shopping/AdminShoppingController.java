package kr.or.ddit.admin.shopping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.service.buyer.IBuyerService;
import kr.or.ddit.service.buyer.IBuyerServiceImpl;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.shopping.IShoppingService;
import kr.or.ddit.utiles.AES256Util;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ShoppingVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/shop")
public class AdminShoppingController {
	@Autowired
	private IShoppingService service;
	
	
	@Autowired
	private IBuyerService buyservice;

	@RequestMapping("/shopList")
	public Model shoppingList(Model model
							  , Map<String, String> params
							  , HttpServletRequest request
							  , String search_keyword
							  , String search_keycode) throws Exception {

		 String currentPage = request.getParameter("currentPage");
	     if(currentPage==null){
	        currentPage = "1";
	     }
	      
	     params.put("search_keyword", search_keyword);
	     params.put("search_keycode", search_keycode);
	         
	     int totalCount = service.totalCount(params);
	     RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
	     params.put("startCount", pagingUtiles.getStartCount());
	     params.put("endCount", pagingUtiles.getEndCount());
		
		 List<ShoppingVO> shoppingList = this.service.shoppingList(params);
		 System.out.println(shoppingList.get(0).getItems().get(0).getGoods_file_save_name());
		 
		 model.addAttribute("shoppingList", shoppingList);
	     model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
	     model.addAttribute("search_keyword", search_keyword);
	     model.addAttribute("search_keycode", search_keycode);
	     
		return model;

	}

	@RequestMapping("/prodForm")
	public ModelAndView shoppingRegForm(ModelAndView mv) {

		
		mv.setViewName("admin/shop/prodForm");

		return mv;
	}
	
//	@RequestMapping("/buyerCodeSearchWindow")
//	public ModelAndView buyerCodeSearchWindow(ModelAndView mv) {
//		
//		mv.setViewName("user/shop/buyerCodeSearch");
//		
//		return mv;
//	}
//
	@RequestMapping("/buyerCodeSearch")
	public ModelAndView shoppingSearchBuyerCode(
			ModelAndView mv,
			@RequestParam(value = "buyer_nm", required = false) String buyer_nm) throws Exception {

		Map<String, String> params = new HashMap<String, String>();
		params.put("buyer_nm", buyer_nm);

		List<BuyerVO> buyerList = buyservice.buyerList(params);
		
		mv.addObject("result", buyerList);
		mv.setViewName("jsonConvertView");
//		mv.setViewName("user/shop/buyerCodeSearch");

		return mv;
	}
	
	
	@RequestMapping("/prodCodeSearch")
	public ModelAndView shoppingSearchProdCode(
			ModelAndView mv,
			@RequestParam(value = "goods_nm", required = false) String goods_nm) throws Exception {
		
//		String prod_name = request.getParameter("prod_name");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("goods_nm", goods_nm);
		
		List<ShoppingVO> prodList = service.prodIdList(params);
		
		mv.addObject("result", prodList);
		mv.setViewName("jsonConvertView");
//		mv.setViewName("user/shop/buyerCodeSearch");
		
		return mv;
	}

	@RequestMapping("/insertProd")
	public String insertProd(ShoppingVO shoppingInfo
								, @RequestParam("files") MultipartFile[] items
								, RedirectAttributes redirectAttribute
								) throws Exception{
		
		
		this.service.insertShoppingInfo(shoppingInfo, items);
		
		redirectAttribute.addFlashAttribute("message",",상품이 등록되었!");
		
		return "redirect:/admin/shop/shopList.do?";
	}
	
	
}









