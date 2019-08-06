package kr.or.ddit.admin.cropsdoctor.utiles;

import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ibm.watson.developer_cloud.assistant.v1.Assistant;
import com.ibm.watson.developer_cloud.assistant.v1.model.CreateExampleOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.Example;
import com.ibm.watson.developer_cloud.assistant.v1.model.ExampleCollection;
import com.ibm.watson.developer_cloud.assistant.v1.model.ListExamplesOptions;
import com.ibm.watson.developer_cloud.service.security.IamOptions;

public class WatsonAssistantExampleUtil {

	private static final String API_KEY 	 = "413Zq5G3D2ZfNbcpmPzmz2osPktKLCykEMFaSfRKC-xr";
	private static final String URL 		 = "https://gateway.watsonplatform.net/assistant/api";
	private static final String WORKSPACE_ID = "46f2da7f-b60e-46e8-8723-76dc3bd47e42";
	
	public String[] exampleList(String intentName){
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;
		String intent = intentName;

		ListExamplesOptions options = new ListExamplesOptions.Builder(workspaceId, intent).build();

		ExampleCollection response = service.listExamples(options).execute();

		System.out.println(response);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
		
		JsonArray jsonArr = jsonObj.get("examples").getAsJsonArray();
		
		String[] resultArr = new String[jsonArr.size()];
		
		for(int i = 0; i < jsonArr.size(); i++){
			resultArr[i] = jsonArr.get(i).getAsJsonObject().get("text").getAsString();
		}
		
		return resultArr;
	
	}
	
	public boolean insertExample(Map<String,String> params){
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;
		String intent = params.get("intent");
		String example = params.get("example");

		CreateExampleOptions options = new CreateExampleOptions
					.Builder(workspaceId, intent, example).build();
		
		Example response = service.createExample(options).execute();
		
		System.out.println(response);
		
		System.out.println("created date : " + response.getCreated());
		System.out.println("updated date : " + response.getUpdated());
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
		
		String resultTxt = jsonObj.get("text").getAsString();
		
		boolean result = true;
		if(!resultTxt.equals(example)){
			result = false;
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
