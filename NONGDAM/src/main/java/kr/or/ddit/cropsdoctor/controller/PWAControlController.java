package kr.or.ddit.cropsdoctor.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.Security;
import java.security.spec.InvalidKeySpecException;
import java.util.concurrent.ExecutionException;

import org.apache.http.HttpResponse;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.jose4j.lang.JoseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.cropsdoctor.utiles.PWAUtil;
import kr.or.ddit.service.nongupin.INongupinService;
import kr.or.ddit.vo.NongupinVO;
import nl.martijndwars.webpush.Notification;
import nl.martijndwars.webpush.PushService;
import nl.martijndwars.webpush.Subscription;

@Controller
@RequestMapping("/user/main/control")
public class PWAControlController {

	private static final String publicKey = "BNK2u9_Ngs4bhLBoexOQ4axO1IuY3VDgPIuXKo8p71u4-jVssd1QW-beLLXcMD6JYzU_MmgdFwsB0mHU4riM4Ng";
	private static final String privateKey = "bUbAbXasRKCogKH01-qA54gC410oY7mrQ-GGAFp5zSk";
	
	@Autowired
	private INongupinService service;
	
	@RequestMapping("/controlpage")
	public String controlPage() {
		return "cropsdoctor/controlPage";
	}
	
	@RequestMapping("/sendmessage")
	public ModelAndView sendMessage(ModelAndView mv) {
		
		boolean result = true;
		
		int subListSize = PWAController.subList.size();
		System.out.println("subListSize : " + subListSize);
		
		for(Subscription sub : PWAController.subList) {
			
			if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
				Security.addProvider(new BouncyCastleProvider());
			}
			
			PushService pushService = null;
			try {
				pushService = new PushService(publicKey, privateKey, "testSubject");
			} catch (GeneralSecurityException e1) {
				e1.printStackTrace();
			}
			
			Notification notification = null;
			try {
				notification = new Notification(sub, "TesT");
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (NoSuchProviderException e) {
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				e.printStackTrace();
			}
			System.out.println(notification.isFcm());
			
			HttpResponse resp = null;
			
			try {
				resp = pushService.send(notification);
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (JoseException e) {
				e.printStackTrace();
			} catch (ExecutionException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
			int statusCode =  resp.getStatusLine().getStatusCode();
			String reasonPhrase = resp.getStatusLine().getReasonPhrase();
			
			System.out.println("statusCode : " + statusCode);
			System.out.println("reasonPhrase : " + reasonPhrase);
			
			if(statusCode >= 400) {
				result = false;
				break;
			}
			
		}
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		return mv;
	}
	
	@RequestMapping("/answer")
	public ModelAndView answer(ModelAndView mv) {
		boolean result = true;
		int maximumNo = 0;
		NongupinVO nVO = new NongupinVO();
		try {
			maximumNo = service.maximumFarmInNo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("@@@@@@@@@@@ : " + maximumNo);
//		nVO.setAnswer_no(maximumNo + "");
		nVO.setFarm_in_no(maximumNo + "");
		nVO.setMber_ncnm("감박사");
		nVO.setAnswer_cn("○ 보내온 사진의 감은 중국에서 도입된 흑시 품종입니다. \n" + 
				"- 흑시 품종은 떫은 감으로 민간인이 중국에서 도입하여 국내에 보급된 품종으로 "
				+ "처음엔 검은색의 휘귀성으로 일부 심겨졌으나 경제성이 없어 줄어들고 있는 품종입니다.");
		
		try {
			service.insertnongupinAnswer(nVO);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		
		String url = "http://localhost:8080/user/nongupin/nongupinView.do?farm_in_no=" + maximumNo;
		
		if(result) {
			if(PWAController.subList.size() > 0){
				PWAUtil util = new PWAUtil();
				for(int i = 0; i < 1; i++){
					String payload = "{\"cat\" :\"답변\", \"url\" : \"" + url + "\"}";
					util.sendMessage(PWAController.subList.get(i),payload);
					System.out.println("알람갔다.");
				}
				
			}
		}
		
		
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		return mv;
		
	}
	
	@RequestMapping("/alarm")
	public ModelAndView alarm(ModelAndView mv) {
		
		boolean result = true;
		
		if(PWAController.subList.size() > 0){
			PWAUtil util = new PWAUtil();
			for(int i = 0; i < 1; i++){
//			for(int i = 0; i < PWAController.subList.size(); i++) {
				String payload = "{\"cat\" :\"알람\"}";
				util.sendMessage(PWAController.subList.get(i),payload);
				System.out.println("알람 알갔다.");
			}
		
		}
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		return mv;
	}
	
}
