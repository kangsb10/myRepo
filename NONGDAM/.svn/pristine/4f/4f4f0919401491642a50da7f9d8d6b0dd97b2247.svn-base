package kr.or.ddit.admin.cultivationmethod;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.service.cultivation.ICultivationMethodService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.CultivationMethodVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

// 재배방법 게시판 컨드롤러

@Controller
@RequestMapping("/admin/cultivationmethod/")
public class AdminCultivationMethodController {
	
	@Autowired 
	private ICultivationMethodService service;
	
	// 리스트 출력
	@RequestMapping("cultivationMethodList")
	public Model cultivationmethodList(Model model
									 , Map<String, String> params
									 , HttpServletRequest request
									 , String search_keyword
									 , String search_keycode
									  ) throws Exception {
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
		
		List<CultivationMethodVO> cultivationmethodList = this.service.cultivationMethodList(params);
		
		model.addAttribute("cultivationmethodList",cultivationmethodList);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		
		return model;
	}
	
	@RequestMapping("cultivationMethodView")
	public ModelMap cultivationMethodView(ModelMap modelMap,
										  @RequestParam String ctvt_mth_no,
										  Map<String, String> params) throws Exception{
		params.put("ctvt_mth_no", ctvt_mth_no);
		
		CultivationMethodVO cultivationMethodInfo = this.service.cultivationMethodInfo(params);
		
		modelMap.addAttribute("cultivationMethodInfo", cultivationMethodInfo);
		
		return modelMap;
	}
	
	@RequestMapping("deleteCultivationMethod")
	public String deleteCultivationMethod(@RequestParam String ctvt_mth_no
										  , Map<String, String> params) throws Exception{
		params.put("ctvt_mth_no", ctvt_mth_no);
		
		this.service.deleteCultivationMethodInfo(params);
		
		return "redirect:/admin/cultivationmethod/cultivationMethodList.do";
	}
}
