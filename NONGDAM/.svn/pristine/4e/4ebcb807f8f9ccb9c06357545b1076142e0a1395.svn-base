package kr.or.ddit.user.customercenter;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.cultivation.ICultivationMethodService;
import kr.or.ddit.service.customercenter.ICustomerCenterService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.CstmrAnswerVO;
import kr.or.ddit.vo.CustomerCenterVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user/customercenter/")
public class CustomerCenterController {
	@Autowired
	private ICustomerCenterService service;
	
	@RequestMapping("customerCenterList")
	public Model customerCenterList(Model model
									, Map<String, String> params
									, HttpServletRequest request
									, String search_keyword
									, String search_keycode
									, String currentPage) throws Exception{
		
		currentPage = request.getParameter("currentPage");
		if(currentPage == null){
			currentPage ="1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCount(params);
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
		List<CustomerCenterVO> customerCenterList = service.customerCenterList(params);
		
		model.addAttribute("customerCenterList", customerCenterList);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		model.addAttribute("currentPage", currentPage);
		
		return model;
	}
	
	@RequestMapping("customerCenterView")
	public ModelMap customerCenterView(ModelMap modelMap
									   , @RequestParam String cstmr_cnter_no
									   , Map<String, String> params
									   , HttpServletRequest request
									   , HttpServletResponse response
									   , String search_keyword
									   , String search_keycode
									   , String currentPage) throws Exception{
		params.put("cstmr_cnter_no", cstmr_cnter_no);
		
		CustomerCenterVO customerCenterInfo = service.customerConterInfo(params);
		CstmrAnswerVO cstmrAnswerInfo = service.cstmrAnswerInfo(params);
		Cookie[] cookie = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookie!=null && cookie.length>0){
			for(int i=0; i<cookie.length; i++){
				if(cookie[i].getName().equals("cookiecustomer" + customerCenterInfo.getCstmr_cnter_no())){
					viewCookie = cookie[i];
				}
			}
		}
		
		if(viewCookie == null){
			Cookie newCookie = new Cookie("cookiecustomer" + customerCenterInfo.getCstmr_cnter_no(), "|" + customerCenterInfo.getCstmr_cnter_no() + "|");
			response.addCookie(newCookie);
			service.updateHit(params);
		}else{
			String value = viewCookie.getValue();
			System.out.println("cookie = " + value);
		}
		
		modelMap.addAttribute("customerCenterInfo", customerCenterInfo);
		modelMap.addAttribute("cstmrAnswerInfo", cstmrAnswerInfo);
		modelMap.addAttribute("search_keyword", search_keyword);
		modelMap.addAttribute("search_keycode", search_keycode);
		modelMap.addAttribute("currentPage", currentPage);
		
		return modelMap;
	}
	
	@RequestMapping("customerCenterForm")
	public void customerCenterForm() throws Exception{}
	
	@RequestMapping("insertCustomerCenter")
	public String insertCustomerCenter(CustomerCenterVO customerCenterInfo
									   , RedirectAttributes redirectAttribute
									   ) throws Exception{
		this.service.insertCustomerCenter(customerCenterInfo);
		
		redirectAttribute.addFlashAttribute("message","게시물이 등록되었습니다.");
		
		return "redirect:/user/customercenter/customerCenterList.do";
		
	}
	
	@RequestMapping("deleteCustomerCenter")
	public String deleteCustomerCenter(@RequestParam String cstmr_cnter_no
									   , Map<String, String> params) throws Exception{
		params.put("cstmr_cnter_no", cstmr_cnter_no);
		
		this.service.deleteCustomerCenter(params);
		
		return "redirect:/user/customercenter/customerCenterList.do";
	}
	
	@RequestMapping("updateCustomerCenterForm")
	public ModelMap updateCustomerCenterForm(ModelMap modelMap
											 , @RequestParam String cstmr_cnter_no
											 , HttpServletRequest request
											 , Map<String, String> params
											 , CustomerCenterVO customerCenterInfo
											 , @RequestParam String search_keyword
											 , @RequestParam String search_keycode
											 , @RequestParam String currentPage) throws Exception{
		cstmr_cnter_no = request.getParameter("cstmr_cnter_no");
		params.put("cstmr_cnter_no", cstmr_cnter_no);
		
		customerCenterInfo = this.service.upCustomerConterInfo(params);
		
		modelMap.addAttribute("customerCenterInfo",customerCenterInfo);
		modelMap.addAttribute("cstmr_cnter_no",cstmr_cnter_no);
		modelMap.addAttribute("search_keyword", search_keyword);
		modelMap.addAttribute("search_keycode", search_keycode);
		modelMap.addAttribute("currentPage", currentPage);
		
		return modelMap;
	}
	
	@RequestMapping("updateCustomerCenter")
	public String updateCustomerCenter(CustomerCenterVO CustomerCenterInfo) throws Exception{
		this.service.updateCustomerCenter(CustomerCenterInfo);
		return "redirect:/user/customercenter/customerCenterList.do";
	}
	
	
//	문의내역
	@RequestMapping("statementList")
	public Model statementList(Model model
			, Map<String, String> params
			, HttpServletRequest request
			, String search_keyword
			, String search_keycode
			, @RequestParam String mber_id
			, String currentPage) throws Exception{
		
		currentPage = request.getParameter("currentPage");
		if(currentPage == null){
			currentPage ="1";
		}
		
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		params.put("mber_id", mber_id);
		int totalCount = service.totalCount1(params);
		
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
		List<CustomerCenterVO> customerCenterList = service.userStatementList(params);
		model.addAttribute("customerCenterList", customerCenterList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("mber_id", mber_id);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		
		return model;
	}
	
	@RequestMapping("statementView")
	public ModelMap statementView(ModelMap modelMap
			   , @RequestParam String cstmr_cnter_no
			   , Map<String, String> params
			   , String search_keyword
	     	   , String search_keycode
			   , String currentPage) throws Exception{
		params.put("cstmr_cnter_no", cstmr_cnter_no);
		
		CustomerCenterVO customerCenterInfo = service.customerConterInfo(params);
		CstmrAnswerVO cstmrAnswerInfo = service.cstmrAnswerInfo(params);
		
		modelMap.addAttribute("customerCenterInfo", customerCenterInfo);
		modelMap.addAttribute("cstmrAnswerInfo", cstmrAnswerInfo);
		modelMap.addAttribute("search_keyword", search_keyword);
		modelMap.addAttribute("search_keycode", search_keycode);
		modelMap.addAttribute("currentPage", currentPage);
		return modelMap;
	}
	
	@RequestMapping("deleteStatement")
	public String deleteStatement(@RequestParam String cstmr_cnter_no
									   , Map<String, String> params
									   , @RequestParam String mber_id) throws Exception{
		params.put("cstmr_cnter_no", cstmr_cnter_no);
		
		this.service.deleteCustomerCenter(params);
		
		return "redirect:/user/customercenter/statementList.do?mber_id=" + mber_id;
	}
	
	@RequestMapping("updateStatementForm")
	public ModelMap updateStatementForm(ModelMap modelMap
											 , @RequestParam String cstmr_cnter_no
											 , HttpServletRequest request
											 , Map<String, String> params
											 , CustomerCenterVO customerCenterInfo
											 , @RequestParam String search_keyword
									     	 , @RequestParam String search_keycode
											 , @RequestParam String currentPage) throws Exception{
		cstmr_cnter_no = request.getParameter("cstmr_cnter_no");
		params.put("cstmr_cnter_no", cstmr_cnter_no);
		
		customerCenterInfo = this.service.upCustomerConterInfo(params);
		
		modelMap.addAttribute("customerCenterInfo",customerCenterInfo);
		modelMap.addAttribute("cstmr_cnter_no",cstmr_cnter_no);
		modelMap.addAttribute("search_keyword", search_keyword);
		modelMap.addAttribute("search_keycode", search_keycode);
		modelMap.addAttribute("currentPage", currentPage);
		
		return modelMap;
	}
	
	@RequestMapping("updateStatement")
	public String updateStatement(CustomerCenterVO CustomerCenterInfo
								  , @RequestParam String mber_id) throws Exception{
		this.service.updateCustomerCenter(CustomerCenterInfo);
		return "redirect:/user/customercenter/statementList.do?mber_id=" + mber_id ;
	}
}
