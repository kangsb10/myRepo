package kr.or.ddit.utiles;

import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class SendExample {
	public static void main(String[] args) {
		 String api_key = "NCS2N7G7X9DWRBNL";
        String api_secret = "A3B6T3RQQKL8YUSVJZHYIV7GICHD1E5B";
        Message coolsms = new Message(api_key, api_secret);
        
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", "01049279705");
        params.put("from", "01049279705");
        params.put("type", "SMS");
        params.put("text", "Coolsms Testing Message!");
        params.put("app_version", "test app 1.2"); // application name and version
        
		
        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
          } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
          }
		
	}
}
