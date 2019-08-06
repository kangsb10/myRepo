package kr.or.ddit.admin.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	private IMemberService service;
	@RequestMapping("/memberList")
	public Model memberList(Model model
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
		
		List<MemberVO> memberList = service.memberList(params);
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_keycode", search_keycode);
		
		
		return model;
	}
	
	@RequestMapping("/memberView")
	public Model memberView(Model model,
							@RequestParam String mber_id,
							Map<String, String> params)throws Exception{
		
		params.put("mber_id", mber_id);
		MemberVO memberInfo = service.memberInfo(params);
		
		model.addAttribute("memberInfo", memberInfo);
		return model;
	}
	
	@RequestMapping("/updateMemberForm")
	public Model updateMemberForm(Model model,
			@RequestParam String mber_id,
			Map<String, String> params)throws Exception{

			params.put("mber_id", mber_id);
			MemberVO memberInfo = service.memberInfo(params);
			
			model.addAttribute("memberInfo", memberInfo);
			return model;
	}
	@RequestMapping("/updateMember")
	public String updateMember(ModelAndView mv,
							  MemberVO memberInfo,
							  Map<String, String> params)throws Exception{
		
		service.adminUpdateMemberInfo(memberInfo);
		
		return "redirect:/admin/member/memberList.do";
	}
}
