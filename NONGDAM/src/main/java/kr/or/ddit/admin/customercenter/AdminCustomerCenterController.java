package kr.or.ddit.admin.customercenter;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.sun.org.apache.bcel.internal.generic.RETURN;

@Controller
@RequestMapping("/admin/customercenter/")
public class AdminCustomerCenterController {
	@Autowired
	private ICustomerCenterService service;
	
	@RequestMapping("customerCenterList")
	public Model customerCenterList(Model model
									, Map<String, String> params
									, HttpServletRequest request
									, String search_keyword
									, String search_keycode) throws Exception{
		
		String currentPage = request.getParameter("currentPage");
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
		
		return model;
	}
	
	@RequestMapping("customerCenterView")
	public ModelMap customerCenterView(ModelMap modelMap
									   , @RequestParam String cstmr_cnter_no
									   , Map<String, String> params) throws Exception{
		params.put("cstmr_cnter_no", cstmr_cnter_no);
		
		CustomerCenterVO customerCenterInfo = service.customerConterInfo(params);
		CstmrAnswerVO cstmrAnswerInfo = service.cstmrAnswerInfo(params);
		
		modelMap.addAttribute("customerCenterInfo", customerCenterInfo);
		modelMap.addAttribute("cstmrAnswerInfo", cstmrAnswerInfo);
		
		return modelMap;
	}
	
	@RequestMapping("deleteCustomerCenter")
	public String deleteCustomerCenter(@RequestParam String cstmr_cnter_no
									   , Map<String, String> params) throws Exception{
		params.put("cstmr_cnter_no", cstmr_cnter_no);
		
		this.service.deleteCustomerCenter(params);
		
		return "redirect:/admin/customercenter/customerCenterList.do";
	}
	
//	답글
//	@RequestMapping("customerCenterView")
//	public ModelMap aCustomerCenterView(ModelMap modelMap
//									   , @RequestParam String cstmr_cnter_no
//									   , Map<String, String> params) throws Exception{
//		params.put("cstmr_cnter_no", cstmr_cnter_no);
//		
//		CstmrAnswerVO cstmrAnswerInfo = service.cstmrAnswerInfo(params);
//		
//		
//		modelMap.addAttribute("cstmrAnswerInfo", cstmrAnswerInfo);
//		
//		return modelMap;
//	}
	
	@RequestMapping("insertAnswer")
	public String insertAnswer(CstmrAnswerVO cstmerAnswerInfo
							   , CustomerCenterVO customerInfo
								) throws Exception{
		this.service.insertAnswer(cstmerAnswerInfo, customerInfo);
		return "redirect:/admin/customercenter/customerCenterList.do";
	}
	
	@RequestMapping("updateAnswer")
	public String updateAnswer(CstmrAnswerVO custmrInfo) throws Exception{
		this.service.updateAnswer(custmrInfo);
		return "redirect:/admin/customercenter/customerCenterList.do";
	}
	
}
