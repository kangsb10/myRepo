package kr.or.ddit.user.main;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.ddit.vo.IndcHeaderAjaxVO;
import kr.or.ddit.vo.NewsVO;
import kr.or.ddit.vo.RegionForeHeaderAjaxVO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
@RequestMapping("/user")
public class MainController {

	@RequestMapping(value = "/main/main")
	public void index(ModelAndView mv) {

	}

	@RequestMapping(value="/main/main_mod")
	   public void indexMod(ModelAndView mv,
			   				HttpSession session){
	      // 뉴스 정보 가져오기
			
			//api id,비밀번호
			String clientId = "UCDiIIDpfkHm0lHzTzaA";
			String clientSecret = "XoHVH3b63W";
			
			//메인에 보내줄 list담을 변수
			List<NewsVO> newsList = new ArrayList<NewsVO>();
			
			
			try{
				
				//검색어 설정
				String text = URLEncoder.encode("농업", "UTF-8");
		
				//검색내용 설정 검색어,시작번호,끝번호,정확도순
				String apiURL = "https://openapi.naver.com/v1/search/news?query="+text+"&start=1&display=3&sort=sim";
				
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				
				//가져올 방식,아이디,비밀번호 설정
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				
				int responseCode = con.getResponseCode();
				BufferedReader br;
				
				if(responseCode ==200){
					//성공
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				}else{
					//에러발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				
				String inputLine;
				StringBuffer response = new StringBuffer();
				while((inputLine = br.readLine()) !=null){
					response.append(inputLine);
				}
				br.close();
				//가져온 정보 JsonObject로 변환
				JsonParser parser = new JsonParser();
				JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
				
				//JsonObject의 검색결과 생성시간,검색결과 총개서,시작점,결과개수
				System.out.println(jsonObj.get("lastBuildDate"));
				System.out.println(jsonObj.get("total"));
				System.out.println(jsonObj.get("start"));
				System.out.println(jsonObj.get("display"));
				
				//JsonObject의 items를 JsonArray에할당
				JsonArray newsArray = (JsonArray) jsonObj.get("items");
				
				//Items VO에 세팅,List에담고넘겨줌
				for(int i =0; i<newsArray.size(); i++){
					JsonObject newsInfo = (JsonObject) newsArray.get(i);
						
					NewsVO newsvo = new NewsVO();
					newsvo.setTitle(newsInfo.get("title").toString());
					newsvo.setOriginallink(newsInfo.get("originallink").toString());
					String temp = newsInfo.get("link").toString();
					String temp1 = temp.replaceAll("\"", "");
					newsvo.setLink(temp1);
					newsvo.setDescription(newsInfo.get("description").toString());
					newsvo.setPubDate(newsInfo.get("pubDate").toString());
					
					newsList.add(newsvo);
					
				
					
				}
				
			}catch(Exception e){
				System.out.println(e);
			}
			session.setAttribute("newsList", newsList);
	}

	@RequestMapping(value = "/main/main2")
	public void index2(ModelAndView mv) {

	}
	
	@RequestMapping(value = "/main/warning")
	@ResponseBody
	public String warning() throws Exception{
		
		JsonParser parser = new JsonParser();
		String url = "https://ncpms.rda.go.kr/npms/IndcHeaderAjax.np";
		Document doc = Jsoup.connect(url)
				.header("origin", "https://ncpms.rda.go.kr")
				.header("referer", "https://ncpms.rda.go.kr/npms/Main.np")
				.ignoreContentType(true)
				.get();
		
		String warnings = doc.toString();
		List<IndcHeaderAjaxVO> warningList = new ArrayList<IndcHeaderAjaxVO>();
		
		JsonArray jsonarray = (JsonArray) parser.parse(warnings);
		for(int i=0; i<jsonarray.size(); i++){
			JsonObject obj = (JsonObject) jsonarray.get(i);
			
			IndcHeaderAjaxVO warningInfo = new IndcHeaderAjaxVO();
			
			warningInfo.setAlarmNm(obj.get("alarmNm").getAsString());
			warningInfo.setGrpNm(obj.get("grpNm").getAsString());
			warningInfo.setOrigFileNm(obj.get("origFileNm").getAsString());
			
			warningList.add(warningInfo);
		}
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
		String arrayToJson = objectMapper.writeValueAsString(warningList);	
		return arrayToJson;
	}
	
	@RequestMapping(value = "/main/prediction")
	@ResponseBody
	public String prediction() throws Exception{
		
		JsonParser parser = new JsonParser();
		String url = "https://ncpms.rda.go.kr/npms/RegionForeHeaderAjax.np";
		Document doc = Jsoup.connect(url)
				   .header("origin", "https://ncpms.rda.go.kr")
				   .header("referer", "https://ncpms.rda.go.kr/npms/Main.np")
				   .ignoreContentType(true)
				   .get();
		
		String predictions = doc.toString();
		List<RegionForeHeaderAjaxVO> predictionList = new ArrayList<RegionForeHeaderAjaxVO>();
		
		JsonArray jsonarray = (JsonArray) parser.parse(predictions);
		for(int i=0; i<jsonarray.size(); i++){
			JsonObject obj = (JsonObject) jsonarray.get(i);
			
			RegionForeHeaderAjaxVO predictionInfo = new RegionForeHeaderAjaxVO();
			
			predictionInfo.setAreaNm(obj.get("areaNm").getAsString());
			predictionInfo.setDbyhsNm(obj.get("dbyhsNm").getAsString());
			predictionInfo.setRiskLevelNm(obj.get("riskLevelNm").getAsString());
			
			predictionList.add(predictionInfo);
		}
		ObjectMapper objectMapper = new ObjectMapper();
	    objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
	    String arrayToJson = objectMapper.writeValueAsString(predictionList);	
	    return arrayToJson;
	}
}
