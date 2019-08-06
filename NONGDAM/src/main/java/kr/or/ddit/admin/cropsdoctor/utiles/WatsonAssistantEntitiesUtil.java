package kr.or.ddit.admin.cropsdoctor.utiles;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ibm.watson.developer_cloud.assistant.v1.Assistant;
import com.ibm.watson.developer_cloud.assistant.v1.model.CreateEntityOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.CreateValue;
import com.ibm.watson.developer_cloud.assistant.v1.model.DeleteEntityOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.Entity;
import com.ibm.watson.developer_cloud.assistant.v1.model.EntityCollection;
import com.ibm.watson.developer_cloud.assistant.v1.model.ListEntitiesOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.ListValuesOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.ValueCollection;
import com.ibm.watson.developer_cloud.service.exception.BadRequestException;
import com.ibm.watson.developer_cloud.service.security.IamOptions;

public class WatsonAssistantEntitiesUtil {
	
	private static final String API_KEY = "413Zq5G3D2ZfNbcpmPzmz2osPktKLCykEMFaSfRKC-xr";
	private static final String URL = "https://gateway.watsonplatform.net/assistant/api";
	private static final String WORKSPACE_ID = "46f2da7f-b60e-46e8-8723-76dc3bd47e42";
	
	public String[] entitiesArr(){
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;

		ListEntitiesOptions options = new ListEntitiesOptions.Builder(workspaceId).build();

		EntityCollection response = service.listEntities(options).execute();
		
		System.out.println(response);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
		
		JsonArray jsonArr = (JsonArray) jsonObj.get("entities");
		
		int jsonArrLength = jsonArr.size();
		String[] resultArr = new String[jsonArrLength];
		for(int i = 0; i < jsonArrLength; i++){
			resultArr[i] = jsonArr.get(i).getAsJsonObject().get("entity").getAsString();
		}
		
		return resultArr;
		
	}
	
	public boolean insertEntity(String entityNM, String[] valArr){
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;
		String entityName = entityNM;
		
		List<CreateValue> entityValues = new ArrayList<CreateValue>();
		if(valArr.length > 1){
			for(int i = 0; i < valArr.length; i++){
				String val = valArr[i];
				if(!val.equals("") && val != null){
					entityValues.add(new CreateValue.Builder(val).build());
				}
			}
		}

		CreateEntityOptions options = new CreateEntityOptions.Builder(workspaceId, entityName)
		  .values(entityValues)
		  .build();

		Entity response = service.createEntity(options).execute();
		
		System.out.println(response);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
		
		JsonElement jsonElmt = jsonObj.get("entity");
		String resultEntity = jsonElmt.getAsString();
		
		boolean result = (resultEntity.equals(entityName) ? true : false);
		
		return result;
		
	}
	
	public String[] getValuesArr(String entityNM){
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;
		String entityName = entityNM;

		ListValuesOptions options = new ListValuesOptions.Builder(workspaceId, entityName).build();

		ValueCollection response = service.listValues(options).execute();

		System.out.println(response);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
		
		JsonArray jsonArr = jsonObj.get("values").getAsJsonArray();
		
		int arrLength = 0;
	
		String[] resultArr = new String[arrLength];
		
		if(jsonArr.size() > 0){
			arrLength = jsonArr.size();
			resultArr = new String[arrLength];
			for(int i = 0; i < resultArr.length; i++){
				String temp = jsonArr.get(i).getAsJsonObject().get("value").getAsString();
				resultArr[i] = temp;
			}
		}
		
		return resultArr;
	}
	
	
	public boolean deleteEntity(String entityNM){
		
		boolean result = true;
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;
		String entityName = entityNM;

		DeleteEntityOptions options 
			= new DeleteEntityOptions.Builder(workspaceId, entityName).build();
		
		try{
			service.deleteEntity(options).execute();
		}catch(BadRequestException e){
			System.out.println("status code : " + e.getStatusCode());
			if(e.getStatusCode() >= 400){
				result = false;
			}
		}
		
		return result;
	}
	
	
}
