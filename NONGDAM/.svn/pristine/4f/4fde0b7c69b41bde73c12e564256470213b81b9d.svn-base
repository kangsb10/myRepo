package kr.or.ddit.admin.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.service.notice.INoticeService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.NoticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {
	
	@Autowired
	private INoticeService service;
	
	@RequestMapping("/noticeList")
	public Model noticeList(Model model
							   , Map<String, String> params
							   , HttpServletRequest request
							   , String search_keyword
							   , String search_keycode)throws Exception{
		
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
		
		List<NoticeVO> noticeList = service.noticeList(params);
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
	    
		return model;
	}
	
	@RequestMapping("/noticeView")
	public ModelAndView noticeView(ModelAndView mv,
								   NoticeVO noticeInfo,
								   @RequestParam String rnum,
								   Map<String, String> params)throws Exception{
		params.put("notice_no", noticeInfo.getNotice_no());
		
		noticeInfo = service.noticeInfo(params);
		noticeInfo.setRnum(rnum);
		mv.addObject("noticeInfo", noticeInfo);
		
		mv.setViewName("admin/notice/noticeView");
		return mv;
	}
	
	@RequestMapping("/noticeForm")
	public Model noticeForm(Model model)throws Exception{
		return model;
	}
	@RequestMapping("/insertnotice")
	public String insertnotice(NoticeVO noticeInfo,
									 ModelAndView mv,
									 @RequestParam("files") MultipartFile[] items)throws Exception{
		
		this.service.insertnoticeInfo(noticeInfo, items);
		
		String message = "공지사항이 등록되었습니다";
		mv.addObject("message", message);
		mv.setViewName("admin/notice/noticeList");
		return "redirect:/admin/notice/noticeList.do";
	}
	
	@RequestMapping("/deletenotice")
	public String deletenotice(Map<String ,String>params,
									@RequestParam String notice_no)throws Exception{
		params.put("notice_no", notice_no);
		service.deleteNoticeInfo(params);
		return "redirect:/admin/notice/noticeList.do";
	}
	
	@RequestMapping("/updateNoticeForm")
	public ModelMap updateform(ModelMap modelmap,
							   @RequestParam String notice_no,
							   Map<String , String>params)throws Exception{
		params.put("notice_no", notice_no);
		
		NoticeVO noticeInfo = service.noticeInfo(params);
		modelmap.addAttribute("noticeInfo", noticeInfo);
		
		return modelmap;
	}
	
	@RequestMapping("/updateNotice")
	public String updatenotice(NoticeVO noticeInfo)throws Exception{
		
		this.service.updateNoticeInfo(noticeInfo);
		return "redirect:/admin/notice/noticeList.do";
	}

}
