package kr.or.ddit.admin.cropsdoctor.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.admin.cropsdoctor.utiles.WatsonAssistantDialogUtil;
import kr.or.ddit.admin.cropsdoctor.utiles.WatsonAssistantEntitiesUtil;
import kr.or.ddit.admin.cropsdoctor.utiles.WatsonAssistantExampleUtil;
import kr.or.ddit.admin.cropsdoctor.utiles.WatsonAssistantIntentsUtil;
import kr.or.ddit.admin.cropsdoctor.utiles.WatsonVisualRecognitionUtil;



@Controller
@RequestMapping("/admin/cropsdoctor")
public class WatsonAssistantController {
	
	private WatsonAssistantEntitiesUtil entitiesUtil = new WatsonAssistantEntitiesUtil();
	private WatsonAssistantIntentsUtil intentsUtil = new WatsonAssistantIntentsUtil();
	private WatsonAssistantExampleUtil exampleUtil = new WatsonAssistantExampleUtil();
	private WatsonAssistantDialogUtil dialogUtil = new WatsonAssistantDialogUtil();
	
	private WatsonVisualRecognitionUtil vsUtil = new WatsonVisualRecognitionUtil();
	
	@RequestMapping("/mngAstt")
	public ModelAndView managingAssistant(ModelAndView mv){
		
		String[][] intentsArr = intentsUtil.intentsArr();
		String[] entitiesArr = entitiesUtil.entitiesArr();
		String dialogArr = dialogUtil.dialogArr();
		
		mv.addObject("intentsArr", intentsArr);
		mv.addObject("entitiesArr", entitiesArr);
		mv.addObject("dialogArr", dialogArr);
		
		
		mv.setViewName("admin/cropsdoctor/mngAstt");
		return mv;
	}

	@RequestMapping("/mngAstt2")
	public ModelAndView cropsDoctorMain2(ModelAndView mv){
		
		Map<String,String>[] vsArr = vsUtil.classifierArr();
		mv.addObject("vsArr", vsArr);
		
		mv.setViewName("admin/cropsdoctor/mngAstt2");
		return mv;
	}
	
	
	@RequestMapping("/insertIntent")
	public ModelAndView insertIntent(ModelAndView mv,
									@RequestParam(value="inputIntent") String intent,
									@RequestParam(value="inputDesc") String description){
		
//		String intentDec = null;
//		String descDec = null;
//		try {
//			intentDec = URLDecoder.decode(intent, "UTF-8");
//			descDec = URLDecoder.decode(description, "UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}

		
		Map<String, String> params = new HashMap<String, String>();
		params.put("intent", intent);
		params.put("description", description);
		
		boolean result = intentsUtil.insertIntent(params);
		
		String resultJson = "{\"result\" : \"" + result + "\" }"; 

		mv.addObject("result", resultJson);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	@RequestMapping("/deleteIntent")
	public ModelAndView deleteIntent(ModelAndView mv,
									@RequestParam(value="ittNM") String intentName){
		
		boolean result = intentsUtil.deleteIntent(intentName); 
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	@RequestMapping("/updateIntent")
	public ModelAndView updateIntent(ModelAndView mv,
									@RequestParam(value="ittNM") String intentName,
									@RequestParam(value="desc") String desc){
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("intent", intentName);
		params.put("description", desc);
		
		boolean result = intentsUtil.updateIntent(params);
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	@RequestMapping("/intentsListAjax")
	public ModelAndView intentsListAjax(ModelAndView mv){
		mv.addObject("result",intentsUtil.intentsArr());
		mv.setViewName("jsonConvertView");
		return mv;
	}
	
	//////////////////////////////////////////////////////////////////////////////
	//example//
	
	@RequestMapping("/examples/exampleList")
	public ModelAndView exampleList(ModelAndView mv,
									@RequestParam(value="intentName") String intentName){
		
		String[] resultArr = exampleUtil.exampleList(intentName);
		
		mv.addObject("result",resultArr);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	@RequestMapping("/examples/insertExample")
	public ModelAndView insertExample(ModelAndView mv,
									  @RequestParam(value="ittNM") String intentName,
									  @RequestParam(value="addEX") String exmpl){
		
		Map<String,String> params = new HashMap<String, String>();
		
		params.put("intent", intentName);
		params.put("example", exmpl);
		
		boolean result = exampleUtil.insertExample(params);
		
		// exam리스트도 반환하기
		String[] examArr = exampleUtil.exampleList(intentName);
		
		mv.addObject("result", result);
		mv.addObject("examArr", examArr);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}		
	
	
	//////////////////////////////////////////////////////////////////////////////
	//entity//
	
	@RequestMapping("/entities/insertEntity")
	public ModelAndView insertEntity(ModelAndView mv,
									 @RequestParam(value="inputEntity") String entityName,
									 @RequestParam(value="inputValues") String[] valArr){

		// 공백 여부
		boolean result = entitiesUtil.insertEntity(entityName, valArr);
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}	
	
	@RequestMapping("/entitiesListAjax")
	public ModelAndView entitiesListAjax(ModelAndView mv){
		mv.addObject("result",entitiesUtil.entitiesArr());
		mv.setViewName("jsonConvertView");
		return mv;
	}
	
	@RequestMapping("/getValuesArr")
	public ModelAndView getValuesArr(ModelAndView mv, 
									@RequestParam(value="entityNM") String entity){
		
		
		String[] result = entitiesUtil.getValuesArr(entity);
		
		mv.addObject("result",result);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	@RequestMapping("/deleteEntity")
	public ModelAndView deleteEntity(ModelAndView mv,
								@RequestParam(value="entityNM") String entityNM){
		
		boolean result = entitiesUtil.deleteEntity(entityNM);
		
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		return mv;
	}
	
	//////////////////////////////////////////////////////////////////////////////
	//Visual Recognition//
	
	@RequestMapping("/getDialog")
	public ModelAndView getDialog(ModelAndView mv,
								  @RequestParam(value="dialogNode")String dialogNode) {
		
		String result = dialogUtil.getDialog(dialogNode);
		
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////
	//Visual Recognition//
	
	@RequestMapping("/vs/getClasses")
	public ModelAndView getClasses(@RequestParam(value="classifierName") String classifierName,
								   ModelAndView mv){
		
		String[] resultArr = vsUtil.getClasses(classifierName);
		
		mv.addObject("resultArr", resultArr);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	@RequestMapping("/vs/insertClass")
	public ModelAndView insertClass(
							ModelAndView mv,
							@RequestParam(value="classifierName") String classifierName,
							@RequestParam(value="classNames") String[] classNames,
							@RequestParam(value="classFiles") MultipartFile[] classFiles){
		
		boolean result = false;
		
		try {
			result = vsUtil.createClassifier(classifierName, classNames, classFiles);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mv.addObject("result",result);
		mv.setViewName("jsonConvertView");

		return mv;
	}
	
	@RequestMapping("/vsListAjax")
	public ModelAndView vsListAjax(ModelAndView mv){
		mv.addObject("result",vsUtil.classifierArr());
		mv.setViewName("jsonConvertView");
		return mv;
	}
	
	@RequestMapping("/deleteClass")
	public ModelAndView deleteVS(ModelAndView mv,
								 @RequestParam(value="classifierId") String classifierId){
		
		boolean result = vsUtil.deleteVS(classifierId);
		
		mv.addObject("result", result);
		mv.setViewName("jsonConvertView");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
