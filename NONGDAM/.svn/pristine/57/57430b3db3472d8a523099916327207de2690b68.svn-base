package kr.or.ddit.join;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.utiles.AES256Util;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.utiles.SessionManager;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.CustomerCenterVO;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/join")
public class JoinController {
	
	@Autowired
	private IMemberService service;
	
	@RequestMapping("/loginForm")
	public ModelAndView loginForm(ModelAndView mv,
								  HttpSession session){
		Map<String, String> publicKeyMap = CryptoGenerator.getGeneratePairKey(session);
		session.setAttribute("publicKeyMap", publicKeyMap);
		
		mv.setViewName("join/loginForm");
		
		return  mv;
	}
	@RequestMapping("/loginOut")
	public String logOut(HttpSession session,
						RedirectAttributes redirectAttribute){
		
		session.invalidate();
//		session.removeAttribute("message");
//		String message = "로그아웃되었습니다.";
//		session.setAttribute("message", message);
		redirectAttribute.addFlashAttribute("message", "로그아웃되었습니다.");
		
		return "redirect:/user/main/main_mod.do";
	}
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(MemberVO memberInfo,
								   ModelAndView mv,
								   HttpSession session,
								   Map<String, String>params) throws Exception{
		
		AES256Util aes = new AES256Util();
		
		String decryptPWD = memberInfo.getMber_password();
		
		String encryptpwd = "";
		if(memberInfo.getMber_id().equals("kadmin") || 
				memberInfo.getMber_id().equals("z001") ||
					memberInfo.getMber_id().equals("x001")){
			encryptpwd = memberInfo.getMber_password();
		}else{
			encryptpwd = CryptoGenerator.decryptRSA(session, decryptPWD);
		}
		
		params.put("mngr_password", encryptpwd);
		String mber_id = memberInfo.getMber_id();
		String mber_password = "";
		if(memberInfo.getMber_id().equals("z001") ||
				memberInfo.getMber_id().equals("x001")){
			mber_password = encryptpwd;
		}else{
			mber_password = aes.encrypt(encryptpwd);
		}
		
		SessionManager sessionMgr = SessionManager.getInstance();
		boolean flag = sessionMgr.sessionDuplicationCheck(session.getId(), mber_id);
		String message;
		
		if(flag){
			message="동일한 아이디로 로그인 정보가 존재합니다.";
			session.setAttribute("message", message);
//			mv.addObject("동일한 아이디로 로그인 정보가 존재합니다.");
			mv.setViewName("join/loginForm");
			return mv;
		}
		params.put("mngr_id", mber_id);
		
		AdminVO adminInfo = service.adminInfo(params);
		
		if(adminInfo!=null){
//			mv.setViewName("admin/main/main_mod");
			mv.setViewName("redirect:/admin/main/main_mod.do");
			session.setAttribute("login_mberInfo", adminInfo);
			return mv;
		}
		
		params.put("mber_id", mber_id);
		params.put("mber_password", mber_password);
		
		memberInfo = service.memberInfo(params);
		
		
		if(memberInfo == null){
			message="회원이 아닙니다";
			session.setAttribute("message", message);
//			mv.addObject("message", "회원이 아닙니다");
			mv.setViewName("join/loginForm");
			return mv;
		}else{
			message="로그인 되었습니다.";
			session.setAttribute("message", message);	
			session.setAttribute("login_mberInfo", memberInfo);
			mv.setViewName("user/main/main_mod");
			return mv;
		}
		
	}
	
	@RequestMapping("/findInfomation")
	public ModelAndView findInfomation(ModelAndView mv){
		
		mv.setViewName("join/findInfomation");
		return mv;
	}
	@RequestMapping("/findId")
	public ModelAndView findId(ModelAndView mv,
							   MemberVO memberInfo,
							   HttpSession session) throws Exception{
		
		
		memberInfo = service.findMemId(memberInfo);
		String result;
		if(memberInfo == null){
			result = " 존재하지 않는 아이디입니다.";
			mv.addObject("result", result);
			mv.setViewName("jsonConvertView");
			return mv;
		}
		result = "아이디는 " + memberInfo.getMber_id() + "입니다";
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		return mv;
	}
	@RequestMapping("/findPwd")
	public ModelAndView findPwd (ModelAndView mv,
								MemberVO memberInfo,
								HttpSession session)throws Exception{
//		AES256Util aes = new AES256Util();
//		
//		String decryptPWD = memberInfo.getMber_password();
//		
//		String encryptpwd = CryptoGenerator.decryptRSA(session, decryptPWD);
//		
//		String mber_password = aes.encrypt(encryptpwd);
		Map<String, String> publicKeyMap = CryptoGenerator.getGeneratePairKey(session);
		session.setAttribute("publicKeyMap", publicKeyMap);
		memberInfo =service.findMemPwd(memberInfo);
		String message = "";
		if(memberInfo==null){
			message = "존재하지않는 회원입니다.";
			session.setAttribute("message", message);
			mv.setViewName("join/findInfomation");
			return mv;
		}
		message="변경할 비밀번호를 입력해주세요";
		session.setAttribute("memberInfo", memberInfo);
		session.setAttribute("message", message);
		mv.setViewName("join/passwordChange");
		return mv;
	}
	
	@RequestMapping("/pwdchange")
	public ModelAndView pwdchange(ModelAndView mv,
								MemberVO memberInfo,
								HttpSession session)throws Exception{
		AES256Util aes = new AES256Util();
		
		String decryptPWD = memberInfo.getMber_password();
		
		String encryptpwd = CryptoGenerator.decryptRSA(session, decryptPWD);
		
		String mber_password = aes.encrypt(encryptpwd);
		memberInfo.setMber_password(mber_password);
		
		int cnt = service.pwdChange(memberInfo);
		String message;
		if(cnt == 1){
			message = "비밀번호가 변경되었습니다.";
			session.setAttribute("message", message);
			mv.setViewName("user/main/main_mod");
			return mv;
		}
		message= "비밀번호 변경 실패";
		session.setAttribute("message", message);
		mv.setViewName("join/passwordChange");
		return mv;
	}
}
