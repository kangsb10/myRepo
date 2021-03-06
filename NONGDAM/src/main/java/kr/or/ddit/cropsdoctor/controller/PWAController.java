package kr.or.ddit.cropsdoctor.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.cropsdoctor.utiles.PWAUtil;
import nl.martijndwars.webpush.Subscription;
import nl.martijndwars.webpush.Subscription.Keys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
@RequestMapping("/user/main")
public class PWAController {
	
	public PWAUtil util = new PWAUtil();
	
	public static List<Subscription> subList = new ArrayList<Subscription>();
	
	@RequestMapping("/pwa")
	public String pwaEx(){
		
		return "pwa/index";
	}
	
	@RequestMapping("/registSub")
	public ModelAndView registSub(ModelAndView mv, HttpServletRequest request){
		
		String body = null;
		try {
			body = util.getReqParams(request);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(body);
		
		Subscription subscription = new Subscription();
		subscription.endpoint = jsonObj.get("endpoint").getAsString();
		subscription.keys = new Keys(jsonObj.get("key").getAsString(), jsonObj.get("auth").getAsString());
		
		boolean result = subList.add(subscription);
		
		mv.addObject("ok", result);
		mv.setViewName("jsonConvertView");
		return mv;
	}
	
	@RequestMapping("/sub")
	public ModelAndView sub(ModelAndView mv,
							HttpServletRequest request){
		
		String body = null;
		try {
			body = util.getReqParams(request);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(body);
		
		Subscription subscription = new Subscription();
		subscription.endpoint = jsonObj.get("endpoint").getAsString();
		subscription.keys = new Keys(jsonObj.get("key").getAsString(), jsonObj.get("auth").getAsString());
		
		subList.add(subscription);
		
		PWAUtil util = new PWAUtil();
		boolean ok = util.sendMessage(subscription, "gogosing");
		
		mv.addObject("ok", ok);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	
	@RequestMapping("/offline")
	public String offline(){
		return "pwa/offline";
	}
	
	@RequestMapping(value="/datealarm" , method= RequestMethod.POST)
	public ModelAndView dateAlarm(ModelAndView mv,
								  HttpServletRequest resq) throws IOException {
		
		//get Parameters
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(util.getReqParams(resq));
		
		String endpoint 			= jsonObj.get("endpoint").getAsString(); 
		String key 					= jsonObj.get("key").getAsString(); 
		String auth 				= jsonObj.get("auth").getAsString(); 
		String selectDate			= jsonObj.get("selectDate").getAsString(); 
		final String alarmDetail 	= jsonObj.get("alarmDetail").getAsString();
		
		final Subscription subscription = new Subscription();
		subscription.endpoint = endpoint;
		subscription.keys = new Keys(key, auth);
		
		//2019-07-28 18:00
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date to = null;
		try {
			to = transFormat.parse(selectDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		long diff = Math.abs(new Date().getTime() - to.getTime());
		
		System.out.println("diff : " + diff);
		
		Timer timer = new Timer();
		TimerTask timeTask = new TimerTask() {
			
			@Override
			public void run() {
				
				util.sendMessage(subscription, alarmDetail);
			}
		};
		
		timer.schedule(timeTask, diff);
		
		boolean result = true;
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	
}
