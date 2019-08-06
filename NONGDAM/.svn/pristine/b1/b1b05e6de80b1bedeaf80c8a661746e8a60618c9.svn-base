package kr.or.ddit.user.emergencymbtlnum;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.emergencymbtlnum.IEmergencymbtlnumService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.EmergencyMbtlNumVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user/emergencymbtlnum")
public class EmergencymbtlnumController {

	@Autowired
	private IEmergencymbtlnumService service;
	
	
	@RequestMapping("/emergencymbtlnumList")
	public void emergencymbtlnumList(@RequestParam String mber_id,
						Model model,
						Map<String , String>params,
						String currentPage, 
						HttpServletRequest request)throws Exception{
		currentPage = request.getParameter("currentPage");
		if(currentPage==null){
			currentPage = "1";
		}
		
		params.put("mber_id", mber_id);
	    int totalCount = service.totalCount(params);
	    RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		List<EmergencyMbtlNumVO> egmnList = service.embergencymbtlnumList(params);
		
		model.addAttribute("egmnList",egmnList);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("currentPage", currentPage);
	}
	
	@RequestMapping("emergencymbtlnumForm")
	public void emergencymbtlnumForm()throws Exception{
		
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@RequestMapping("insertemergencymbtlnum")
	public String insertemergencymbtlnum(EmergencyMbtlNumVO egmnInfo)throws Exception{
		
		service.insertegmn(egmnInfo);
		
		
		return "forward:/user/emergencymbtlnum/emergencymbtlnumList.do?mber_id="+egmnInfo.getMber_id();
	}
}
