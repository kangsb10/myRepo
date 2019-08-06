package kr.or.ddit.user.sfms;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.service.sensor.ISensorService;
import kr.or.ddit.service.sfms.ISfmsService;
import kr.or.ddit.vo.FarmVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.SensorVO;
import kr.or.ddit.vo.apiVO;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;






@Controller
@RequestMapping("/user/sfms")
public class SfmsController {

	@Autowired
	private ISfmsService service;
	
	@Autowired
	private ISensorService sensorservice;
	
	@RequestMapping("/farmList")
	public Model farmList( Model model,
						   String mber_id,
						  MemberVO login_mberInfo,
						  HttpServletRequest request) throws Exception{
		HashMap<String, String>params = new HashMap<String, String>();
		mber_id=request.getParameter("mber_id");
		params.put("mber_id", mber_id);
		List<FarmVO> farmList  = service.FarmList(params);
		
		model.addAttribute("farmList", farmList);

		
		return model;
	}
	
	@RequestMapping("/farmForm")
	public ModelAndView farmForm(ModelAndView mv,
						     @RequestParam String mber_id)throws Exception{
		mv.addObject("mber_id", mber_id);
		mv.setViewName("user/sfms/farmForm");
		
		return mv;
	}
	
	@RequestMapping("/sfmsidCheck")
	public ModelAndView sfmsidCheck(ModelAndView mv,
									String farm_id,
									Map<String , String>params)throws Exception{
		mv.setViewName("jsonConvertView");
		params.put("farm_id", farm_id);
		FarmVO farmInfo = service.idChech(params);
		
		String result="사용할 수 있는 아이디 입니다.";
		if(farmInfo != null){
			result = "중복된 아이디 입니다.";
			mv.addObject("result", result);
			return mv;
		}
		
		BufferedReader br = null;
		String urlstr = "http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getIdentityDataList/827586a9169e4fb6a7f50f0563d88aa3";
		URL url = new URL(urlstr);
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		urlconnection.setRequestMethod("GET");
		br= new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
		
		String sfmsInfo = br.readLine();
		JsonParser parser = new JsonParser();
		JsonArray jsonObj = (JsonArray) parser.parse(sfmsInfo);
		
		String farm_adres = null;
		String farm_crops = null;
		result = "존재하지 않는 스마트팜 아이디입니다.";
		for(int i = 0; i <jsonObj.size(); i++){
			JsonObject obj = (JsonObject) jsonObj.get(i);
			
			if(farm_id.equals(obj.getAsJsonObject().get("userId").getAsString())){
				farm_adres = obj.getAsJsonObject().get("addressName").getAsString();
				farm_crops = obj.getAsJsonObject().get("itemCode").getAsString();
				mv.addObject("farm_crops",farm_crops);
				mv.addObject("farm_adres", farm_adres);
				result = "사용 가능한 스마트팜 아이디입니다";
				mv.addObject("result",result);
				return mv;
			}
		}
		mv.addObject("result", result);
		
		return mv;
	}
	
	@RequestMapping("/farmView")
	public ModelAndView farmView(ModelAndView mv,
								 String farm_id,
								 Map<String , String >params) throws Exception{
		params.put("farm_id", farm_id);
		FarmVO farmInfo = this.service.farmInfo(params);
		// 센서 xml 추가하고 다오,서비스 확인, 연결해서 센서,센서파일아이템 불러오기
		SensorVO sensorInfo = this.sensorservice.sensorInfo(params);
		
		// 멤버의 농장아이디로 url 조합해서 정보조회
		BufferedReader br = null;
		String urlstr = "http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getCroppingSeasonDataList/827586a9169e4fb6a7f50f0563d88aa3/";
		URL url = new URL(urlstr+farm_id);
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		urlconnection.setRequestMethod("GET");
		br= new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
		
		ObjectMapper mapper = new ObjectMapper();
		String result = br.readLine();
		
		List<apiVO> sfmslist = new ArrayList<apiVO>();
		JsonParser parser = new JsonParser();
		JsonArray jsonObj = (JsonArray) parser.parse(result);
		for(int i = 0; i <jsonObj.size(); i++){
			JsonObject obj = (JsonObject) jsonObj.get(i);
			
			apiVO temp1 = new apiVO();
			temp1.setStatusCode(obj.getAsJsonObject().get("statusCode").getAsString());
			temp1.setStatusMessage(obj.getAsJsonObject().get("statusMessage").getAsString());
			temp1.setCroppingSerlNo(obj.getAsJsonObject().get("croppingSerlNo").getAsString());
			temp1.setCroppingSeasonName(obj.getAsJsonObject().get("croppingSeasonName").getAsString());
			temp1.setCroppingDate(obj.getAsJsonObject().get("croppingDate").getAsString());
			temp1.setCroppingEndDate(obj.getAsJsonObject().get("croppingEndDate").getAsString());
			temp1.setCroppingSystem(obj.getAsJsonObject().get("croppingSystem").getAsString());
			temp1.setItemCode(obj.getAsJsonObject().get("itemCode").getAsString());
			temp1.setCultivationArea(obj.getAsJsonObject().get("cultivationArea").getAsString());
			temp1.setCalCultivationArea(obj.getAsJsonObject().get("calCultivationArea").getAsString());
			temp1.setPlantNum(obj.getAsJsonObject().get("plantNum").getAsString());
			temp1.setCalPlantNum(obj.getAsJsonObject().get("calPlantNum").getAsString());
			temp1.setStemSlabNum(obj.getAsJsonObject().get("stemSlabNum").getAsString());
			temp1.setPlanSlabNum(obj.getAsJsonObject().get("planSlabNum").getAsString());
			temp1.setPlantDensity(obj.getAsJsonObject().get("plantDensity").getAsString());
			temp1.setStandardPlantDensity(obj.getAsJsonObject().get("standardPlantDensity").getAsString());
			temp1.setFloodlightDec(obj.getAsJsonObject().get("floodlightDec").getAsString());
			temp1.setLeafArea(obj.getAsJsonObject().get("leafArea").getAsString());
			temp1.setStndTemp(obj.getAsJsonObject().get("stndTemp").getAsString());
			temp1.setStndWeight(obj.getAsJsonObject().get("stndWeight").getAsString());
			temp1.setStndSolar(obj.getAsJsonObject().get("stndSolar").getAsString());
			temp1.setStndMeta(obj.getAsJsonObject().get("stndMeta").getAsString());
			
			sfmslist.add(temp1);
		}
		apiVO item = sfmslist.get(0);
		mv.addObject("item", item);
		mv.addObject("farmInfo", farmInfo);
		System.out.println(farmInfo.getFarm_tmprt());
		mv.addObject("sensorInfo", sensorInfo);
		
		mv.setViewName("user/sfms/farmView");
		return mv;
	}
	
	@RequestMapping("/insertFarm")
	public String insertFarm(FarmVO farmInfo,
							 Map<String, String>params,
							 HttpServletRequest request)throws Exception{
		String code = farmInfo.getFarm_crops();
		params.put("code_nm", code);
		code=service.searchCode(params);
		farmInfo.setFarm_co2("21");
		farmInfo.setFarm_hd("34");
		farmInfo.setFarm_tmprt("19");
		farmInfo.setFarm_pblmrl("5");
		farmInfo.setFarm_crops(code);
		
		service.insertFarm(farmInfo);
		
		SensorVO sensorInfo = new SensorVO();
		sensorInfo.setFarm_id(farmInfo.getFarm_id());
		sensorInfo.setSensor_tmprt(farmInfo.getFarm_tmprt());
		sensorInfo.setSensor_hd(farmInfo.getFarm_hd());
		sensorInfo.setSensor_pblmrl(farmInfo.getFarm_pblmrl());
		sensorInfo.setSensor_co2(farmInfo.getFarm_co2());
		sensorservice.inserSensor(sensorInfo);
		
		String mber_id = farmInfo.getMber_id();
		request.setAttribute("mber_id", mber_id);
		return "redirect:/user/sfms/farmList.do?mber_id="+mber_id ;
	}
	
	@RequestMapping("/updateFarm")
	public ModelAndView updateFarm(ModelAndView mv,
								   FarmVO farmInfo)throws Exception{
		int i = 0;
		i = service.updateFarm(farmInfo);
		System.out.println(i);
		
		mv.setViewName("jsonConvertView");
		return mv;
	}
	
	@RequestMapping("/updateSensor")
	public ModelAndView updateSensor(ModelAndView mv,
								   	 SensorVO senserInfo)throws Exception{
		
		sensorservice.updateSensor(senserInfo);
		mv.setViewName("jsonConvertView");
		return mv;
	}
	@RequestMapping("/dataExtrac")
	public String dataExtrac(ModelAndView mv,
							 apiVO sfmsInfo,
							 @RequestParam String mber_id)throws Exception{
		String [][] data = {
				{"작기일련번호"				,	sfmsInfo.getCroppingSerlNo()},
				{"작기이름"				,	sfmsInfo.getCroppingSeasonName()},
				{"정식일"					,	sfmsInfo.getCroppingDate()},
				{"종료일"					,	sfmsInfo.getCroppingEndDate()},
				{"재배방식"				,	sfmsInfo.getCroppingSystem()},
				{"품목코드"				,	sfmsInfo.getItemCode()},
				{"재배면적(PY)"			,	sfmsInfo.getCultivationArea()},
				{"재배면적(M2)"			,	sfmsInfo.getCalCultivationArea()},
				{"식재된 총 작물의 수"			,	sfmsInfo.getPlantNum()},
				{"m2당 식재된 작물의 수"		,	sfmsInfo.getCalPlantNum()},
				{"배지 1개당 작물의 줄기 수"	,	sfmsInfo.getStemSlabNum()},
				{"배지 1개당 작물의 수"		,	sfmsInfo.getPlanSlabNum()},
				{"재식밀도"				,	sfmsInfo.getPlantDensity()},
				{"기준 재식밀도"				,	sfmsInfo.getStandardPlantDensity()},
				{"투광율"					,	sfmsInfo.getFloodlightDec()},
				{"엽면적기준"				,	sfmsInfo.getLeafArea()},
				{"기준온도"				,	sfmsInfo.getStndTemp()},
				{"기준과중"				,	sfmsInfo.getStndWeight()},
				{"기준광"					,	sfmsInfo.getStndSolar()},
				{"기초대사"				,	sfmsInfo.getStndMeta()}
		};
		
		XSSFWorkbook wb = new XSSFWorkbook();
		XSSFSheet sheet = wb.createSheet("SFMS");
		
		FileOutputStream fos = null;
		
		for(int i = 0; i<data.length; i++){
			Row row = sheet.createRow(i);
			for(int j =0; j <data[i].length; j++){
				Cell cell = row.createCell(j);
				cell.setCellValue(data[i][j]);
			}
		}
		SimpleDateFormat format1 = new SimpleDateFormat( "yyyy년MM월dd일 hh시 mm분");
		
		String format_time1 = format1.format(System.currentTimeMillis());
		String seasonName = sfmsInfo.getCroppingSeasonName();
		String subject = seasonName + ","+format_time1;
		
		fos = new FileOutputStream("D:/"+subject+".xls");
		
		wb.write(fos);
		
		fos.close();
		
		mv.addObject("mber_id",mber_id);
		mv.setViewName("jsonConvertView");
		
		return "forward:/user/sfms/farmList.do";
	}
	@RequestMapping("/deleteFarm")
	public String deleteFarm(@RequestParam String farm_id ,
							Map<String , String>params,
							@RequestParam String mber_id)throws Exception{
		params.put("farm_id", farm_id);
		
		sensorservice.deleteSensor(params);
		service.deleteFarm(params);
		
		
		
		return "redirect:/user/sfms/farmList.do?mber_id="+mber_id;
	}
	
}

