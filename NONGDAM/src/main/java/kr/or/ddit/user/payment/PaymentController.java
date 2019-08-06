package kr.or.ddit.user.payment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.service.payment.IPaymentService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.PaymentVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user/payment")
public class PaymentController {

	@Autowired
	private IPaymentService service;
	
	@RequestMapping("/paymentList")
	public void paymentlist(Model model
						   , Map<String, String> params
						   , HttpServletRequest request
						   , String search_keyword
						   , String search_keycode
						   ,String currentPage
						   ,@RequestParam String mber_id)throws Exception{
		currentPage = request.getParameter("currentPage");
		if(currentPage==null){
			currentPage = "1";
		}
		params.put("mber_id", mber_id);
		int totalCount = service.totalCount(params);
		RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
		params.put("startCount", pagingUtiles.getStartCount());
		params.put("endCount", pagingUtiles.getEndCount());
		
		List<PaymentVO> paymentList= service.paymentList(params);
		
		model.addAttribute("paymentList",paymentList);
		model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
		model.addAttribute("currentPage", currentPage);
	}
}
