package kr.or.ddit.user.farmingdiary;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user/farmingdiary/")
public class FarmingDiaryController {
	
	@Autowired
	private IFarmingDiaryService service;
	
	@RequestMapping("farmingDiaryList")
	public Model farmingDiaryList(Model model
							  	  , Map<String, String> params
							  	  , HttpServletRequest request
							  	  , String search_keyword
							  	  , String search_keycode
							  	  , @RequestParam String mber_id
							  	  , String currentPage
						) throws Exception{
		currentPage = request.getParameter("currentPage");
		if(currentPage==null){
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCount(params);
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		params.put("mber_id", mber_id);
		
		List<FarmingDiaryVO> farmingdiaryList = service.farmingDiaryList(params);
		
		model.addAttribute("farmingdiaryList", farmingdiaryList);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		model.addAttribute("currentPage", currentPage);
		
		return model;
	}
	
	@RequestMapping("farmingDiaryView")
	public ModelMap farmingDiaryView(ModelMap modelMap
									 , @RequestParam String farm_diary_no
									 , Map<String, String> params
									 , String search_keyword
								  	 , String search_keycode
								  	 , String currentPage) throws Exception{
		params.put("farm_diary_no", farm_diary_no);
		
		FarmingDiaryVO farmingDiaryInfo = service.farmingDiaryInfo(params);
		
		modelMap.addAttribute("farmingDiaryInfo", farmingDiaryInfo);
		modelMap.addAttribute("search_keyword", search_keyword);
		modelMap.addAttribute("search_keycode", search_keycode);
		modelMap.addAttribute("currentPage", currentPage);
		return modelMap;
	}
	
	@RequestMapping("farmingdiaryForm")
	public void farmingdiaryForm() throws Exception{}
	
	@RequestMapping("insertFarmingDiary")
	public String insertFarmingDiary(FarmingDiaryVO farmingDiaryInfo
									 , @RequestParam("files") MultipartFile[] items
									 , RedirectAttributes redirectAttribute
									 , @RequestParam String mber_id) throws Exception{
		this.service.insertFarmingDiaryInfo(farmingDiaryInfo, items);
		
		redirectAttribute.addFlashAttribute("message","게시물이 등록되었습니다.");
		
		return "redirect:/user/farmingdiary/farmingDiaryList.do?mber_id=" + mber_id;
		
	}
	
	@RequestMapping("deleteFarmingDiary")
	public String deleteFarmingDiary(@RequestParam String farm_diary_no
									 , Map<String, String> params
									 , @RequestParam String mber_id) throws Exception{
		params.put("farm_diary_no", farm_diary_no);
		
		this.service.deleteFarmingDiaryInfo(params);
		
		return "redirect:/user/farmingdiary/farmingDiaryList.do?mber_id=" + mber_id;
	}
	
	@RequestMapping("updateFarmingDiaryForm")
	public ModelMap updateFarmingDiaryForm(ModelMap modelMap
									   	   , @RequestParam String farm_diary_no
									   	   , HttpServletRequest request
									   	   , Map<String, String> params
									   	   , FarmingDiaryVO farmingDiaryInfo
									   	   , String search_keyword
									  	   , String search_keycode
									  	   , String currentPage) throws Exception{
		farm_diary_no = request.getParameter("farm_diary_no");
		params.put("farm_diary_no", farm_diary_no);
		farmingDiaryInfo = this.service.farmingDiaryInfo(params);
		
		modelMap.addAttribute("farmingDiaryInfo", farmingDiaryInfo);
		modelMap.addAttribute("farm_diary_no", farm_diary_no);
		modelMap.addAttribute("search_keyword", search_keyword);
		modelMap.addAttribute("search_keycode", search_keycode);
		modelMap.addAttribute("currentPage", currentPage);
		
		return modelMap;
		
	}
	
	@RequestMapping("updateFarmingDiary")
	public String updateFarmingDiary(FarmingDiaryVO farmingDiaryInfo
									 , @RequestParam String mber_id) throws Exception{
		this.service.updateFarmingDiaryInfo(farmingDiaryInfo);
		return "redirect:/user/farmingdiary/farmingDiaryList.do?mber_id=" + mber_id;
	}
	
	@RequestMapping("updateFarmDiary_Sfms_Emrgncy_cn")
	public ModelAndView updateFarmDiary_Sfms_Emrgncy_cn(ModelAndView mv,
														String mber_id,
														String farm_diary_sfms_emrgncy_cn,
														Map<String , String>params)throws Exception{
		params.put("mber_id", mber_id);
		FarmingDiaryVO farmInfo =  service.sfmsFarmingDiaryInfo(params);
		farmInfo.setFarm_diary_sfms_emrgncy_cn(farm_diary_sfms_emrgncy_cn);
		System.out.println(farmInfo.getFarm_diary_no());
		
		
		service.updateFarmingDiarySfms(farmInfo);
		
		mv.setViewName("jsonConvertView");
		return mv;
	}
}
