package kr.or.ddit.user.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.notice.INoticeService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.NoticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/notice")
public class NoticeController {
	
	@Autowired
	private INoticeService service;
	
	@RequestMapping("/noticeList")
	public Model noticeList(Model model
							   , Map<String, String> params
							   , HttpServletRequest request
							   , String search_keyword
							   , String search_keycode
							   ,String currentPage)throws Exception{
		
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
		
		List<NoticeVO> noticeList = service.noticeList(params);
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		model.addAttribute("currentPage", currentPage);
	    
		return model;
	}
	@RequestMapping("noticeView")
	public ModelMap noticeView(ModelMap modelMap,
							   String notice_no,
							   Map<String, String> params,
							   HttpServletRequest request,
							   HttpServletResponse response
							   , String search_keyword
							  	 , String search_keycode
							  	 , String currentPage)throws Exception{
		
		params.put("notice_no", notice_no);
		
		NoticeVO noticeInfo = service.noticeInfo(params);
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies !=null&&cookies.length>0){
			for(int i =0; i<cookies.length; i++){
				if(cookies[i].getName().equals("cookienotice"+noticeInfo.getNotice_no())){
					viewCookie = cookies[i];
				}
			}
		}
		
			
		if(viewCookie ==null){
			Cookie newCookie = new Cookie("cookienotice" + noticeInfo.getNotice_no(),"|"+noticeInfo.getNotice_no()+"|");
			
			response.addCookie(newCookie);
			
			service.upHit(params);
		}else{
			String value = viewCookie.getValue();
			
			System.out.println("cookie 값:" + value);
		}
				
		modelMap.addAttribute("search_keyword", search_keyword);
		modelMap.addAttribute("search_keycode", search_keycode);
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("noticeInfo", noticeInfo);
		
		return modelMap;
	}
}
