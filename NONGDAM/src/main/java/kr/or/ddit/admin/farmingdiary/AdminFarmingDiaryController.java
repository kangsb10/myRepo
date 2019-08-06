package kr.or.ddit.admin.farmingdiary;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.service.farmingdiary.IFarmingDiaryService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.FarmingDiaryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/farmingdiary/")
public class AdminFarmingDiaryController {
	
	@Autowired
	private IFarmingDiaryService service;
	
	@RequestMapping("farmingDiaryList")
	public Model farmingDiaryList(Model model
							  	  , Map<String, String> params
							  	  , HttpServletRequest request
							  	  , String search_keyword
							  	  , String search_keycode
						) throws Exception{
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
		
		List<FarmingDiaryVO> farmingdiaryList = service.farmingDiaryList(params);
		
		model.addAttribute("farmingdiaryList", farmingdiaryList);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		
		return model;
	}
	
	@RequestMapping("farmingDiaryView")
	public ModelMap farmingDiaryView(ModelMap modelMap
									 , @RequestParam String farm_diary_no
									 , Map<String, String> params) throws Exception{
		params.put("farm_diary_no", farm_diary_no);
		
		FarmingDiaryVO farmingDiaryInfo = service.farmingDiaryInfo(params);
		
		modelMap.addAttribute("farmingDiaryInfo", farmingDiaryInfo);
		return modelMap;
	}
	
	@RequestMapping("deleteFarmingDiary")
	public String deleteFarmingDiary(@RequestParam String farm_diary_no
									 , Map<String, String> params
									 ) throws Exception{
		params.put("farm_diary_no", farm_diary_no);
		
		this.service.deleteFarmingDiaryInfo(params);
		
		return "redirect:/admin/farmingdiary/farmingDiaryList.do";
	}
}
