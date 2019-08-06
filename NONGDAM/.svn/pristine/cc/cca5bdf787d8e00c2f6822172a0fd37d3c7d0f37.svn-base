package kr.or.ddit.admin.cropsdoctor.utiles;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ibm.watson.developer_cloud.assistant.v1.Assistant;
import com.ibm.watson.developer_cloud.assistant.v1.model.CreateIntentOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.DeleteIntentOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.Example;
import com.ibm.watson.developer_cloud.assistant.v1.model.Intent;
import com.ibm.watson.developer_cloud.assistant.v1.model.IntentCollection;
import com.ibm.watson.developer_cloud.assistant.v1.model.ListIntentsOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.UpdateIntentOptions;
import com.ibm.watson.developer_cloud.service.security.IamOptions;

public class WatsonAssistantIntentsUtil {

	private static final String API_KEY 	 = "413Zq5G3D2ZfNbcpmPzmz2osPktKLCykEMFaSfRKC-xr";
	private static final String URL 		 = "https://gateway.watsonplatform.net/assistant/api";
	private static final String WORKSPACE_ID = "46f2da7f-b60e-46e8-8723-76dc3bd47e42";
	
	public String[][] intentsArr(){
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;

		ListIntentsOptions options = new ListIntentsOptions.Builder(workspaceId).build();

		IntentCollection response = service.listIntents(options).execute();

		System.out.println(response);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
		
		JsonArray jsonArr = (JsonArray) jsonObj.get("intents");
		
		int jsonArrLength = jsonArr.size();
		
		String[][] resultArr = new String[jsonArrLength][2];
		
		for(int i = 0; i < jsonArrLength; i++){
			resultArr[i][0] = jsonArr.get(i).getAsJsonObject().get("intent").getAsString();
			resultArr[i][1] = jsonArr.get(i).getAsJsonObject().get("description").getAsString();
		}

		return resultArr;
	}
	
	public boolean insertIntent(Map<String,String> params){
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;
		String intent = params.get("intent");
		String description = params.get("description");
		
		CreateIntentOptions options = new CreateIntentOptions.Builder(workspaceId, intent)
			.description(description)
			.build();

		Intent response = service.createIntent(options).execute();
		
		System.out.println(response);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
		
		JsonElement jsonElmt = jsonObj.get("intent");
		String resultIntent = jsonElmt.getAsString();
		
		boolean result = (resultIntent.equals(intent) ? true : false);
		
		return result;
	}
	
	public boolean deleteIntent(String intentName){
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;
		String intent = intentName;

		DeleteIntentOptions options
			= new DeleteIntentOptions.Builder(workspaceId, intent).build();

		service.deleteIntent(options).execute();
		
		String[][] intentsArr = intentsArr();
		
		boolean result = true;
		
		boolean isBeing = false;
		for(int i = 0; i < intentsArr.length; i++){
			if(intentsArr[i][0].equals(intentName)){
				isBeing = true;
				break;
			}
		}
		
		if(isBeing){
			result = false;
		}
		
		return result;
		
	}
	
	public boolean updateIntent(Map<String,String> params){
		
		boolean result = false;
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;
		String intent = params.get("intent");
		String description = params.get("description");

//		List<Example> examples = new ArrayList<Example>();
//		examples.add(new Example.Builder("Good afternoon").build());

		UpdateIntentOptions options = new UpdateIntentOptions.Builder(workspaceId, intent)
//		  .newIntent(newIntent)
//		  .newExamples(examples)
		  .newDescription(description)
		  .build();

		Intent response = service.updateIntent(options).execute();

		System.out.println(response);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
