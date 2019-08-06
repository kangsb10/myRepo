package kr.or.ddit.user.nongupin;

import java.util.List;
import java.util.Map;


















import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cropsdoctor.controller.PWAController;
import kr.or.ddit.cropsdoctor.utiles.PWAUtil;
import kr.or.ddit.service.nongupin.INongupinService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.NongupinVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user/nongupin/")
public class NongupinController {

	@Autowired
	private INongupinService service;

	// 농업인 리스트
	@RequestMapping("nongupinList")
	public ModelAndView nongupinList(ModelAndView mv, Map<String, String> params,
											HttpServletRequest request
											,String search_keyword
				                            ,String search_keycode) throws Exception {

		String currentPage = request.getParameter("currentPage");
		if (currentPage == null) {
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);

		int totalCount = service.totalCount(params);
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(
				Integer.parseInt(currentPage), totalCount, request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
	      
		List<NongupinVO> guNM = service.guNM(params);
		List<NongupinVO> nongupinList = service.nongupinList(params);
		int dayFarmIn = service.dayFarmIn();
		int dayAnswer = service.dayAnswer();
		
		
		mv.addObject("dayFarmIn",dayFarmIn);
		mv.addObject("dayAnswer",dayAnswer);
		mv.addObject("guNM",guNM);
		mv.addObject("nongupinList", nongupinList);
		mv.addObject("pagingHtmls", pagingUtiles.getPageHtmls());
		mv.addObject("search_keyword", search_keyword);
		mv.addObject("search_keycode", search_keycode);
		mv.setViewName("user/nongupin/nongupinList");

		return mv;
	}
	
	// 농업인 분류별 리스트
	@RequestMapping("nongupinCategoryList")
	public ModelAndView nongupinCategoryList(ModelAndView mv,
									Map<String, String> params,
									String farm_in_gu,
									HttpServletRequest request,
									String search_keyword,
									String search_keycode) throws Exception {
		
		String currentPage = request.getParameter("currentPage");
		if (currentPage == null) {
			currentPage = "1";
		}

		params.put("farm_in_gu", farm_in_gu);
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		int totalCount = service.totalCount(params);
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(
				Integer.parseInt(currentPage), totalCount, request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		List<NongupinVO> categoryList = service.categoryList(params);
		List<NongupinVO> guNM = service.guNM(params);
		int dayFarmIn = service.dayFarmIn();
		int dayAnswer = service.dayAnswer();
		
		
		
		mv.addObject("dayFarmIn", dayFarmIn);
		mv.addObject("dayAnswer", dayAnswer);
		mv.addObject("pagingHtmls", pagingUtiles.getPageHtmls());
		mv.addObject("guNM",guNM);
		mv.addObject("categoryList", categoryList);
		mv.setViewName("user/nongupin/nongupinCategoryList");
		
		return mv;
	}
	
	// 농업인 뷰
	@RequestMapping("nongupinView")
	public ModelAndView nongupinView(ModelAndView mv,
			Map<String, String> params,
			HttpServletRequest request,
			HttpServletResponse response,
			String farm_in_no) throws Exception {
		
		params.put("farm_in_no", farm_in_no);
		List<NongupinVO> guNM = service.guNM(params);
		NongupinVO nongupinInfo = service.nongupinInfo(params);
		List<NongupinVO> nongupinAnswerInfo = service.nongupinAnswerList(params);
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0){
			for(int i = 0; i < cookies.length; i++){
				if(cookies[i].getName().equals("cookienongupin" + nongupinInfo.getFarm_in_no())){
					viewCookie = cookies[i];
				}
			}
		}
			
		if(viewCookie == null){
			Cookie newCookie = new Cookie("cookienongupin" + nongupinInfo.getFarm_in_no(),"|"+ nongupinInfo.getFarm_in_no() +"|");
			
			response.addCookie(newCookie);
			
			service.updateHit(params);
		}else{
			String value = viewCookie.getValue();
			
			System.out.println("cookie 값:" + value);
		}
		
		
		mv.addObject("guNM", guNM);
		mv.addObject("nongupinAnswerInfo", nongupinAnswerInfo);
		mv.addObject("nongupinInfo", nongupinInfo);
		mv.setViewName("user/nongupin/nongupinView");
		
		return mv;
	}

	// 농업인 글폼
	@RequestMapping("nongupinForm")
	public ModelAndView nongupinForm(ModelAndView mv, Map<String,String> params) throws Exception{
		
		List<NongupinVO> guNM = service.guNM(params);
		mv.addObject("guNM",guNM);
		mv.setViewName("user/nongupin/nongupinForm");
		
		return mv;
	}
	
	// 농업인 글추가
	@RequestMapping("insertNongupin")
	public String insertNongupin(Map<String,String> params, NongupinVO nongupinInfo,
					RedirectAttributes redirectAttribute,
					@RequestParam("files") MultipartFile[] items) throws Exception{
		
		
		redirectAttribute.addFlashAttribute("message", "게시물이 등록되었습니다.");
		service.insertnongupin(nongupinInfo, items);
		
		
		return "redirect:/user/nongupin/nongupinList.do";
	}
	
	// 농업인 답글
	@RequestMapping("insertAnswer")
	public String insertAnswer(Map<String,String> params,NongupinVO nongupinInfo,
								String farm_in_no,
								HttpServletRequest request) throws Exception{
		
		String old_url = request.getHeader("referer");
		
		System.out.println("request.getHeader(\"referer\") : " + request.getHeader("referer"));
		System.out.println("request.getServletPath() : " + request.getServletPath());
		System.out.println("request.getServletContext()" + request.getServletContext());
		System.out.println("request.getRequestURI() : " + request.getRequestURI());
		System.out.println("request.getRequestURL() : " + request.getRequestURL());
		
		
		service.insertnongupinAnswer(nongupinInfo);
//		System.out.println(old_url);
		
		return "redirect:/user/nongupin/nongupinView.do?farm_in_no=" + farm_in_no;
	}
	
	// 농업인 답글채택
	@RequestMapping("answerSelect")
	public String answerSelect(NongupinVO nongupinInfo,
										String farm_in_no) throws Exception{
		
		service.answerSelect(nongupinInfo);
		
		return "redirect:/user/nongupin/nongupinView.do?farm_in_no=" + farm_in_no;
	}
	
	// 농업인 수정폼
	@RequestMapping("updateNongupinForm")
	public ModelAndView updateNongupinForm(ModelAndView mv,
			Map<String,String> params,
			String farm_in_no) throws Exception{
		
		params.put("farm_in_no", farm_in_no);
		List<NongupinVO> guNM = service.guNM(params);
		NongupinVO nongupinInfo = service.nongupinInfo(params);
		
		
		
		mv.addObject("guNM", guNM);
		mv.addObject("nongupinInfo", nongupinInfo);
		
		mv.setViewName("user/nongupin/updatenongupinForm");
		
		return mv;
	}
	
	
	
	// 농업인 수정
	@RequestMapping("updateNongupin")
	public String updateAnswer(NongupinVO nongupinInfo) throws Exception{
		
		service.updateboardInfo(nongupinInfo);
		
		
		return "redirect:/user/nongupin/nongupinView.do?farm_in_no=" + nongupinInfo.getFarm_in_no();	
	}
	
	// 삭제
	@RequestMapping("deleteNongupin")
	public String deleteNongupin(Map<String, String> params,String farm_in_no) throws Exception{
		
		params.put("farm_in_no", farm_in_no);
		
		service.deleteboardInfo(params);
		
		return "redirect:/user/nongupin/nongupinList.do";
	}
	
	
}
