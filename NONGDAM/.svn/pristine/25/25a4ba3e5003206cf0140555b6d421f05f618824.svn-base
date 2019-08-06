package kr.or.ddit.admin.cropsdoctor.utiles;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ibm.watson.developer_cloud.service.exception.BadRequestException;
import com.ibm.watson.developer_cloud.service.security.IamOptions;
import com.ibm.watson.developer_cloud.visual_recognition.v3.VisualRecognition;
import com.ibm.watson.developer_cloud.visual_recognition.v3.model.Classifier;
import com.ibm.watson.developer_cloud.visual_recognition.v3.model.Classifiers;
import com.ibm.watson.developer_cloud.visual_recognition.v3.model.CreateClassifierOptions;
import com.ibm.watson.developer_cloud.visual_recognition.v3.model.CreateClassifierOptions.Builder;
import com.ibm.watson.developer_cloud.visual_recognition.v3.model.DeleteClassifierOptions;
import com.ibm.watson.developer_cloud.visual_recognition.v3.model.GetClassifierOptions;
import com.ibm.watson.developer_cloud.visual_recognition.v3.model.ListClassifiersOptions;
import com.ibm.watson.developer_cloud.visual_recognition.v3.model.UpdateClassifierOptions;


public class WatsonVisualRecognitionUtil {

	private static final String API_KEY1 = "By4NJQCNjTh_9Zcyo8xmwA4QPngXuBg11cxBArF8mhk2";
	private static final String API_KEY2 = "b0DE-p9c7AKHngPT85gPFkRsRDN4CizRxizxszwnZlmZ";
	private static final String API_KEY3 = "Och9q7vgXACf4JsNZ-i9C-U2f6xgToA6WKxz_v6OAIKY";
	
	
	public Map<String,String>[] classifierArr(){

		JsonObject jsonObj = null;
		JsonParser parser = new JsonParser();
		
		// 작물, 과수
		IamOptions options = new IamOptions.Builder().apiKey(API_KEY1).build();
		VisualRecognition service = new VisualRecognition("2018-03-19", options);
		ListClassifiersOptions listClassifiersOptions = new ListClassifiersOptions.Builder()
			.verbose(true).build();
		Classifiers classifiers = service.listClassifiers(listClassifiersOptions).execute();
		System.out.println(classifiers);

		
		jsonObj = (JsonObject) parser.parse(classifiers.toString());
		JsonArray jsonArr1 = jsonObj.get("classifiers").getAsJsonArray();
		
		// 채소, 잡초
		options = new IamOptions.Builder().apiKey(API_KEY2).build();
		service = new VisualRecognition("2018-03-19", options);
		listClassifiersOptions = new ListClassifiersOptions.Builder().verbose(true).build();
		classifiers = service.listClassifiers(listClassifiersOptions).execute();
		System.out.println(classifiers);
		
		jsonObj = (JsonObject) parser.parse(classifiers.toString());
		JsonArray jsonArr2 = jsonObj.get("classifiers").getAsJsonArray();
		
		// 해충
		options = new IamOptions.Builder().apiKey(API_KEY3).build();
		service = new VisualRecognition("2018-03-19", options);
		listClassifiersOptions = new ListClassifiersOptions.Builder().verbose(true).build();
		classifiers = service.listClassifiers(listClassifiersOptions).execute();
		System.out.println(classifiers);
		
		jsonObj = (JsonObject) parser.parse(classifiers.toString());
		JsonArray jsonArr3 = jsonObj.get("classifiers").getAsJsonArray();
		
		JsonArray totalJsonArr = new JsonArray();
		
		
		Map<String,String>[] resultArr = new Map[6];
		
		for(int i = 0; i < jsonArr1.size(); i++){
			Map<String,String> tempMap = new HashMap<String, String>();
			
			String classifierId = jsonArr1.get(i)
					.getAsJsonObject().get("classifier_id").getAsString();
			String name = jsonArr1.get(i).getAsJsonObject().get("name").getAsString();
			String status = jsonArr1.get(i).getAsJsonObject().get("status").getAsString();
			String created = jsonArr1.get(i).getAsJsonObject().get("created").getAsString();
			String updated = jsonArr1.get(i).getAsJsonObject().get("updated").getAsString();
			
			tempMap.put("classifierId", classifierId);
			tempMap.put("name", name);
			tempMap.put("status", status);
			tempMap.put("created", created);
			tempMap.put("updated",updated);
			
			resultArr[i] = tempMap;
			
		}
		
		for(int i = 0; i < jsonArr2.size(); i++){
			Map<String,String> tempMap = new HashMap<String, String>();
			
			String classifierId = jsonArr2.get(i)
						.getAsJsonObject().get("classifier_id").getAsString();
			String name = jsonArr2.get(i).getAsJsonObject().get("name").getAsString();
			String status = jsonArr2.get(i).getAsJsonObject().get("status").getAsString();
			String created = jsonArr2.get(i).getAsJsonObject().get("created").getAsString();
			String updated = jsonArr2.get(i).getAsJsonObject().get("updated").getAsString();
			
			tempMap.put("classifierId", classifierId);
			tempMap.put("name", name);
			tempMap.put("status", status);
			tempMap.put("created", created);
			tempMap.put("updated",updated);
			
			resultArr[i+2] = tempMap;
		}

		for(int i = 0; i < jsonArr3.size(); i++){
			Map<String,String> tempMap = new HashMap<String, String>();
			
			String classifierId = jsonArr3.get(i)
					.getAsJsonObject().get("classifier_id").getAsString();
			String name = jsonArr3.get(i).getAsJsonObject().get("name").getAsString();
			String status = jsonArr3.get(i).getAsJsonObject().get("status").getAsString();
			String created = jsonArr3.get(i).getAsJsonObject().get("created").getAsString();
			String updated = jsonArr3.get(i).getAsJsonObject().get("updated").getAsString();
			
			tempMap.put("classifierId", classifierId);
			tempMap.put("name", name);
			tempMap.put("status", status);
			tempMap.put("created", created);
			tempMap.put("updated",updated);
			
			resultArr[i+4] = tempMap;
		}
		
		return resultArr;
	}
	
	public String[] getClasses(String classifierName){
		
		String apiKey = null;
		
		if(classifierName.equals("Crops_1375519145") 
					|| classifierName.equals("Fruit_1937953913")){
			apiKey = "By4NJQCNjTh_9Zcyo8xmwA4QPngXuBg11cxBArF8mhk2";
		}else if(classifierName.equals("Weeds_853892379") 
					|| classifierName.equals("Vegitable_1852736987")){
			apiKey = "b0DE-p9c7AKHngPT85gPFkRsRDN4CizRxizxszwnZlmZ";
		}else if(classifierName.equals("Pest_831004240")){
			apiKey = "Och9q7vgXACf4JsNZ-i9C-U2f6xgToA6WKxz_v6OAIKY";
		}else{
			apiKey = "Och9q7vgXACf4JsNZ-i9C-U2f6xgToA6WKxz_v6OAIKY";
		}
		
		IamOptions options = new IamOptions.Builder()
		  .apiKey(apiKey)
		  .build();

		VisualRecognition service = new VisualRecognition("2018-03-19", options);

		GetClassifierOptions getClassifierOptions = 
				new GetClassifierOptions.Builder(classifierName).build();
		Classifier classifier = service.getClassifier(getClassifierOptions).execute();
		System.out.println(classifier);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(classifier.toString());
		JsonArray jsonArr = jsonObj.get("classes").getAsJsonArray();
		
		String[] resultArr = new String[jsonArr.size()];
		
		for(int i = 0; i < jsonArr.size(); i++){
			resultArr[i] = jsonArr.get(i).getAsJsonObject().get("class").getAsString();
		}

		return resultArr;
		
	}
	
	public boolean createClassifier(String classifierName,
								   String[] classNames,
								   MultipartFile[] classFiles) throws IOException{
		
		List<String> tempList = new ArrayList<String>();
		File[] convFile = new File[classFiles.length];
		
		for(int i = 0; i < classNames.length; i++){
			if(!classNames[i].equals("")){
				tempList.add(classNames[i]);
			}
		}
		
		IamOptions options = new IamOptions.Builder()
		  .apiKey(API_KEY3)
		  .build();

		VisualRecognition service = new VisualRecognition("2018-03-19", options);
		for(int i = 0; i < classFiles.length; i++){
			FileOutputStream fos = null;
			try{
				convFile[i] = new File(classFiles[i].getOriginalFilename());
				convFile[i].createNewFile();
				fos = new FileOutputStream(convFile[i]);
				fos.write(classFiles[i].getBytes());
			}catch(IOException e){
				e.printStackTrace();
			}finally{
				fos.close();
			}
		}
		
		Builder builder = new CreateClassifierOptions.Builder().name(classifierName);
		
		for(int i = 0; i < tempList.size(); i++){
			try {
				builder.addPositiveExamples(tempList.get(i), convFile[i]);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		CreateClassifierOptions createClassifierOptions = builder.build();
		
		
		Classifier response = service.createClassifier(createClassifierOptions).execute();
		System.out.println(response);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
		
//		String classifierId = jsonObj.get("classifierId").getAsString();
//		String name 		= jsonObj.get("name").getAsString();
		String status 		= jsonObj.get("status").getAsString();
		
		boolean result = true;
		if(!status.equals("training")){
			result = false;
		}
		
		return result;
		
	} 
	
	public boolean deleteVS(String classifierId){
		
		boolean result = true;
		
		IamOptions options = new IamOptions.Builder()
		  .apiKey(API_KEY3)
		  .build();

		VisualRecognition service = new VisualRecognition("2018-03-19", options);

		try{
			DeleteClassifierOptions deleteClassifierOptions 
			= new DeleteClassifierOptions.Builder(classifierId).build();
			service.deleteClassifier(deleteClassifierOptions).execute();
		}catch(BadRequestException e){
			System.out.println("status code : " + e.getStatusCode());
			if(e.getStatusCode() >= 400){
				result = false;
			}
		}
		
		return result;
	}
	
	public boolean updateVS(String classifierName,String[] classNames,MultipartFile[] classFiles) throws IOException{
		
		String apiKey = "";
		
		if(classifierName.equals("Crops_1375519145") 
				|| classifierName.equals("Fruit_1937953913")){
			apiKey = "By4NJQCNjTh_9Zcyo8xmwA4QPngXuBg11cxBArF8mhk2";
		}else if(classifierName.equals("Weeds_853892379") 
					|| classifierName.equals("Vegitable_1852736987")){
			apiKey = "b0DE-p9c7AKHngPT85gPFkRsRDN4CizRxizxszwnZlmZ";
		}else if(classifierName.equals("Pest_831004240")){
			apiKey = "Och9q7vgXACf4JsNZ-i9C-U2f6xgToA6WKxz_v6OAIKY";
		}else{
			apiKey = "Och9q7vgXACf4JsNZ-i9C-U2f6xgToA6WKxz_v6OAIKY";
		}
		
		
		IamOptions options = new IamOptions.Builder()
		  .apiKey(apiKey)
		  .build();
		
		List<String> tempList = new ArrayList<String>();
		File[] convFile = new File[classFiles.length];
		
		for(int i = 0; i < classNames.length; i++){
			if(!classNames[i].equals("")){
				tempList.add(classNames[i]);
			}
		}
		
		//MultipartFile to File
		for(int i = 0; i < classFiles.length; i++){
			FileOutputStream fos = null;
			try{
				convFile[i] = new File(classFiles[i].getOriginalFilename());
				convFile[i].createNewFile();
				fos = new FileOutputStream(convFile[i]);
				fos.write(classFiles[i].getBytes());
			}catch(IOException e){
				e.printStackTrace();
			}finally{
				fos.close();
			}
		}
		
		VisualRecognition service = new VisualRecognition("2018-03-19", options);
		String classifierId = classifierName;

		//setting builder
		com.ibm.watson.developer_cloud.visual_recognition
		.v3.model.UpdateClassifierOptions.Builder builder 
			= new UpdateClassifierOptions.Builder().classifierId(classifierId);
		
		for(int i = 0; i < tempList.size(); i++){
			try {
				builder.addPositiveExamples(tempList.get(i), convFile[i]);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}

		UpdateClassifierOptions updateClassifierOptions = builder.build();

		Classifier updatedClassifier = service.updateClassifier(updateClassifierOptions).execute();
		System.out.println(updatedClassifier);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(updatedClassifier.toString());
		
		String status = jsonObj.get("status").getAsString();
		
		boolean result = true;
		
		if(!status.equals("retraining")){
			result = false;
		}
		
		return result;
		
	}
	
}
