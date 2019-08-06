package kr.or.ddit.cropsdoctor.utiles;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.web.multipart.MultipartFile;

public class NaverUtil {
	
	/**
	 * 기능 : 내 위치로 농약사 위치 찾기
	 * @author 강새벽
	 * @param latLong
	 * @return 
	 */
	public String searchNYSbyMyLocation(String latLong){
		
//		curl 
//			https://naveropenapi.apigw.ntruss.com/map-place/v1/search?
//			query=%EA%B7%B8%EB%A6%B0%ED%8C%A9%ED%86%A0%EB%A6%AC
//			&coordinate=127.1054328,37.3595963
//		-H "X-NCP-APIGW-API-KEY-ID: {애플리케이션 등록 시 발급받은 client id값}" \
//		-H "X-NCP-APIGW-API-KEY: {애플리케이션 등록 시 발급받은 client secret값}" -v

		String clientId = "f3n62sa3jv";										//애플리케이션 클라이언트 아이디값"
        String clientSecret = "k88hn57znlZL5NY2vb2VlMRaRhIVaUulEvm5aYFs";	//애플리케이션 클라이언트 시크릿값"
        
//        JsonObject jsonObj = null;
        String result = "";
        
        try {
        	String apiURL = "https://naveropenapi.apigw.ntruss.com/map-place/v1/search?query=";
            String searchStr = URLEncoder.encode("농약사", "UTF-8");
            String myLoc = latLong;
            
            apiURL += searchStr;
            apiURL += "&coordinate=" + myLoc;
            
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
			    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
			    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
			    response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			
			//response를 json으로 변경
//			JsonParser parser = new JsonParser();
//			jsonObj = (JsonObject) parser.parse(response.toString());
			
			result = response.toString();
			
        } catch (Exception e) {
            System.out.println(e);
        }
		
		return result;
	}
	
	/**
	 * 네이버 음성인식
	 * @author 강새벽
	 * @param recordFile
	 * @return
	 */
	public String speechToText(MultipartFile recordFile){
		
		String clientId = "z4dj6cefq8";             						// Application Client ID";
	 	String clientSecret = "iHX1t0YpYTpdy8s9CFEDenuhEF0KTKS6bBhr2TFh";	// Application Client Secret";
	 	
	 	String result = "";
	 	
	 	File voiceFile = null;
        try {
//            String imgFile = "음성 파일 경로";
        	try{
        		voiceFile = new File(recordFile.getOriginalFilename());
        		voiceFile.createNewFile();
        		FileOutputStream fos = new FileOutputStream(voiceFile);
        		fos.write(recordFile.getBytes());
        		fos.close();
        	}catch(IOException e){
        		e.printStackTrace();
        	}

            String language = "Kor";        // 언어 코드 ( Kor, Jpn, Eng, Chn )
            String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=" + language;
            URL url = new URL(apiURL);

            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setUseCaches(false);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestProperty("Content-Type", "application/octet-stream");
            conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

            OutputStream outputStream = conn.getOutputStream();
            FileInputStream inputStream = new FileInputStream(voiceFile);
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            BufferedReader br = null;
            int responseCode = conn.getResponseCode();
            if(responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {  // 에러 발생
                System.out.println("error!!!!!!! responseCode= " + responseCode);
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            }
            String inputLine;
            
            if(br != null) {
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
                result = response.toString();
            } else {
                System.out.println("error !!!");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
		
		return result;
	}
	
}
