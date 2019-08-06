package kr.or.ddit.admin.cropsdoctor.utiles;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ibm.watson.developer_cloud.assistant.v1.Assistant;
import com.ibm.watson.developer_cloud.assistant.v1.model.DialogNode;
import com.ibm.watson.developer_cloud.assistant.v1.model.DialogNodeCollection;
import com.ibm.watson.developer_cloud.assistant.v1.model.GetDialogNodeOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.ListDialogNodesOptions;
import com.ibm.watson.developer_cloud.service.security.IamOptions;

public class WatsonAssistantDialogUtil {

	private static final String API_KEY = "413Zq5G3D2ZfNbcpmPzmz2osPktKLCykEMFaSfRKC-xr";
	private static final String URL = "https://gateway.watsonplatform.net/assistant/api";
	private static final String WORKSPACE_ID = "46f2da7f-b60e-46e8-8723-76dc3bd47e42";
	
	public String dialogArr(){
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);
		
		String workspaceId = WORKSPACE_ID;
		
		ListDialogNodesOptions options = new ListDialogNodesOptions.Builder(workspaceId).build();
		
		DialogNodeCollection response = service.listDialogNodes(options).execute();
		
		System.out.println(response);
		
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response.toString());
		JsonArray jsonArr = (JsonArray) jsonObj.get("dialog_nodes");
		
		//type : standard -> normal
		JsonArray dialogArr = new JsonArray();
		for(int i = 0; i < jsonArr.size(); i++){
			JsonObject temp = (JsonObject) jsonArr.get(i);
			if(temp.get("type").getAsString().equals("standard")) {
				dialogArr.add(temp);
			}
		}
		
		System.out.println("dialogArr.size() : " + dialogArr.size());
		System.out.println("dialogArr.toString() : " + dialogArr.toString());
		
		
		return dialogArr.toString();
		
	}
	
	public String getDialog(String dialogName) {
		
		IamOptions iamOptions = new IamOptions.Builder().apiKey(API_KEY).build();
		Assistant service = new Assistant("2019-02-28", iamOptions);
		service.setEndPoint(URL);

		String workspaceId = WORKSPACE_ID;
		String dialogNode = dialogName;

		GetDialogNodeOptions options = new GetDialogNodeOptions.Builder(workspaceId, dialogNode).build();

		DialogNode response = service.getDialogNode(options).execute();

		System.out.println(response);
		
		return response.toString();
		
	}
	
}

