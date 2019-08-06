package kr.or.ddit.cropsdoctor.utiles;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

public class NongyakUtil {
	
	/**
	 * 농약 상세정보 조회
	 * @author 강새벽
	 * @param diseaseName
	 * @param cropName
	 * @return Map
	 * @throws IOException
	 */
	public Map<String,String> detailNongyak(String diseaseName, String cropName) throws IOException{
		
		// http://pis.rda.go.kr/openApi/service.do?
		// apiKey=2019f0674f70c6980592d0c135c54607dc18
		// &serviceCode=SVC01
		// &diseaseWeedName=갈색무늬병
		// &cropName=사과
		// &displayCount=50
		
		Map<String, String> resultMap = new HashMap<String, String>();
		
		String apiKey = "2019f0674f70c6980592d0c135c54607dc18"; // 인증키
		String svcCode = "SVC01"; // 서비스코드
		String displayCount = "10";
		String buildTime = null;
		String totalCnt = null;
		NodeList items = null;
		
		// 검색조건
		String sCropName = cropName;
		String sDiseaseWeedName = diseaseName;
		
		// 목록
		int size = 0;
		
		String cropNames = null;			// 작물명
		String diseaseWeedNames = null;		// 병해충명
		String useNames = null;				// 용도 검색어
		String pestiKorNames = null;		// 품목명
		String pestiBrandNames = null;		// 상표명
		String compNames = null;			// 회사명
		String pestiCodes = null;			// 농약품목코드
		String diseaseUseSeqs = null;		// 병해충사용방법
		String goodsId	= null;				// 상품ID
		
		
		boolean isRetrieve = false;
		
		if(apiKey==""){
			isRetrieve = false;
		}else{
			isRetrieve = true;
			
			String parameter = "apiKey="+ apiKey;
			parameter += "&serviceCode="+ svcCode;
			try{
				if(cropName != null){
					parameter += "&cropName="+ URLEncoder.encode(cropName,"utf-8");//검색어는 UTF-8로 인코딩
				}
				if(diseaseName != null){
					parameter += "&diseaseWeedName="+ URLEncoder.encode(diseaseName,"utf-8");//검색어는 UTF-8로 인코딩
				}
			}catch(UnsupportedEncodingException e){
				e.printStackTrace();
			}
			
			URL apiUrl = null;
			InputStream apiStream;
			try {
				apiUrl = new URL("http://pis.rda.go.kr/openApi/service.do?"+parameter);
			} catch (MalformedURLException e1) {
				e1.printStackTrace();
			}
			apiStream = apiUrl.openStream();
			
			Document doc = null;
			try{
				
				
				doc =	DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
				buildTime = doc.getElementsByTagName("buildTime").item(0).getFirstChild().getNodeValue();
				totalCnt = doc.getElementsByTagName("totalCount").item(0).getFirstChild().getNodeValue();
				items = doc.getElementsByTagName("item");
				
				
				
				size 			 = doc.getElementsByTagName("item").getLength();
				cropNames 		 = doc.getElementsByTagName("cropName").item(0).getFirstChild().getNodeValue();
				diseaseWeedNames = doc.getElementsByTagName("diseaseWeedName").item(0).getFirstChild().getNodeValue();
				useNames 		 = doc.getElementsByTagName("useName").item(0).getFirstChild().getNodeValue();
				pestiKorNames 	 = doc.getElementsByTagName("pestiKorName").item(0).getFirstChild().getNodeValue();
				pestiBrandNames  = doc.getElementsByTagName("pestiBrandName").item(0).getFirstChild().getNodeValue();
				compNames 		 = doc.getElementsByTagName("compName").item(0).getFirstChild().getNodeValue();
				pestiCodes 		 = doc.getElementsByTagName("pestiCode").item(0).getFirstChild().getNodeValue();
				diseaseUseSeqs 	 = doc.getElementsByTagName("diseaseUseSeq").item(0).getFirstChild().getNodeValue();
				
			}catch(Exception e){
				isRetrieve = false;
			}finally{
				apiStream.close();
			}
		}
		
		resultMap.put("cropNames", 			cropNames 		);
		resultMap.put("diseaseWeedNames", 	diseaseWeedNames);
		resultMap.put("useNames", 			useNames 		);
		resultMap.put("pestiKorNames",		pestiKorNames 	);
		resultMap.put("pestiBrandNames", 	pestiBrandNames );
		resultMap.put("compNames", 			compNames 		);
		resultMap.put("pestiCodes", 		pestiCodes 		);
		resultMap.put("diseaseUseSeqs", 	diseaseUseSeqs 	);
		resultMap.put("goodsId",			goodsId			);
		
		return resultMap;
		
	}
	
	/**
	 * 농약 사용방법 조회
	 * @author 강새벽
	 * @param pestiCodes
	 * @param diseaseUseSeqs
	 * @return Map
	 * @throws IOException
	 */
	public Map<String,String> nongYakUsage(String pestiCodes, String diseaseUseSeqs) throws IOException{
		
		Map<String,String> resultMap = new HashMap<String, String>();
		
		// http://pis.rda.go.kr/openApi/service.do?
		// apiKey=2019f0674f70c6980592d0c135c54607dc18
		// &serviceCode=SVC02
		// &pestiCode=2482
		// &diseaseUseSeq=9
		
		String apiKey = "2019f0674f70c6980592d0c135c54607dc18"; // 인증키
		String svcCode = "SVC02"; // 서비스코드
		String displayCount = "10";
		String buildTime = null;
		String totalCnt = null;
		NodeList items = null;
		
		// 검색조건
		String pestiCode = pestiCodes;
		String diseaseUseSeq = diseaseUseSeqs;
		
		// 목록
		int size = 0;
		
		String pestiUse 		= null;			// 사용적기
		String useSuittime 		= null;			// 안전사용기준(수확~일전)
		String useNum 			= null;			// 안전사용기준(~회 이내)
		
		boolean isRetrieve = false;
		
		if(apiKey==""){
			isRetrieve = false;
		}else{
			isRetrieve = true;
			
			String parameter = "apiKey="+ apiKey;
			parameter += "&serviceCode="+ svcCode;
			if(pestiCode != null){
				parameter += "&pestiCode="+ pestiCode;
			}
			if(diseaseUseSeq != null){
				parameter += "&diseaseUseSeq="+ diseaseUseSeq;
			}
			
			URL apiUrl = null;
			InputStream apiStream = null;
			try {
				apiUrl = new URL("http://pis.rda.go.kr/openApi/service.do?"+parameter);
			} catch (MalformedURLException e1) {
				e1.printStackTrace();
			}
			apiStream = apiUrl.openStream();

			Document doc = null;
			try{
				doc =	DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
				
				pestiUse 		 = doc.getElementsByTagName("pestiUse").item(0).getFirstChild().getNodeValue();
				useSuittime 	 = doc.getElementsByTagName("useSuittime").item(0).getFirstChild().getNodeValue();
				useNum 	 		 = doc.getElementsByTagName("useNum").item(0).getFirstChild().getNodeValue();
				
			}catch(Exception e){
				e.printStackTrace();
				isRetrieve = false;
			}finally{
				apiStream.close();
			}
		}
		
		resultMap.put("pestiUse", 		pestiUse);
		resultMap.put("useSuittime", 	useSuittime);
		resultMap.put("useNum", 		useNum);
		
		return resultMap;
		
	}
	
	/**
	 * 검색용 농약정보
	 * @author 강새벽
	 * @param object
	 * @return
	 * @throws IOException
	 */
	public Map<String,String> searchPesticideDetail(String object) throws IOException{
		
		// http://pis.rda.go.kr/openApi/service.do?
		// apiKey=2019f0674f70c6980592d0c135c54607dc18
		// &serviceCode=SVC01
		// &pestiBrandName=확타
		
		Map<String,String> resultMap = new HashMap<String, String>();
		
		String apiKey = "2019f0674f70c6980592d0c135c54607dc18"; // 인증키
		String svcCode = "SVC01"; // 서비스코드
		String displayCount = "10";
		
		// 검색조건
		String pestiBrandName = object;
		
		// 목록
		
		String cropNames = null;			// 작물명
		String diseaseWeedNames = null;		// 병해충명
		String useNames = null;				// 용도 검색어
		String pestiKorNames = null;		// 품목명
		String pestiBrandNames = null;		// 상표명
		String compNames = null;			// 회사명
		String pestiCodes = null;			// 농약품목코드
		String diseaseUseSeqs = null;		// 병해충사용방법
		
		boolean isRetrieve = false;
		
		if(apiKey==""){
			isRetrieve = false;
		}else{
			isRetrieve = true;
			
			String parameter = "apiKey="+ apiKey;
			parameter += "&serviceCode="+ svcCode;
			try{
				if(pestiBrandName != null){
					parameter += "&pestiBrandName="+ URLEncoder.encode(pestiBrandName,"utf-8");//검색어는 UTF-8로 인코딩
				}
			}catch(UnsupportedEncodingException e){
				e.printStackTrace();
			}
			
			URL apiUrl = null;
			InputStream apiStream;
			try {
				apiUrl = new URL("http://pis.rda.go.kr/openApi/service.do?"+parameter);
			} catch (MalformedURLException e1) {
				e1.printStackTrace();
			}
			apiStream = apiUrl.openStream();
			
			Document doc = null;
			try{
				
				doc =	DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
				cropNames 		 = doc.getElementsByTagName("cropName").item(0).getFirstChild().getNodeValue();
				diseaseWeedNames = doc.getElementsByTagName("diseaseWeedName").item(0).getFirstChild().getNodeValue();
				useNames 		 = doc.getElementsByTagName("useName").item(0).getFirstChild().getNodeValue();
				pestiKorNames 	 = doc.getElementsByTagName("pestiKorName").item(0).getFirstChild().getNodeValue();
				pestiBrandNames  = doc.getElementsByTagName("pestiBrandName").item(0).getFirstChild().getNodeValue();
				compNames 		 = doc.getElementsByTagName("compName").item(0).getFirstChild().getNodeValue();
				pestiCodes 		 = doc.getElementsByTagName("pestiCode").item(0).getFirstChild().getNodeValue();
				diseaseUseSeqs 	 = doc.getElementsByTagName("diseaseUseSeq").item(0).getFirstChild().getNodeValue();
				
			}catch(Exception e){
				isRetrieve = false;
			}finally{
				apiStream.close();
			}
		}
		
		////////////// 두번째
		
		svcCode = "SVC02"; // 서비스코드
		String buildTime = null;
		String totalCnt = null;
		NodeList items = null;
		
		// 검색조건
		String pestiCode = pestiCodes;
		String diseaseUseSeq = diseaseUseSeqs;
		
		// 목록
		int size = 0;
		
		String pestiUse 		= null;			// 사용적기
		String useSuittime 		= null;			// 안전사용기준(수확~일전)
		String useNum 			= null;			// 안전사용기준(~회 이내)
		
		if(apiKey==""){
			isRetrieve = false;
		}else{
			isRetrieve = true;
			
			String parameter = "apiKey="+ apiKey;
			parameter += "&serviceCode="+ svcCode;
			if(pestiCode != null){
				parameter += "&pestiCode="+ pestiCode;
			}
			if(diseaseUseSeq != null){
				parameter += "&diseaseUseSeq="+ diseaseUseSeq;
			}
			
			URL apiUrl = null;
			InputStream apiStream = null;
			try {
				apiUrl = new URL("http://pis.rda.go.kr/openApi/service.do?"+parameter);
			} catch (MalformedURLException e1) {
				e1.printStackTrace();
			}
			apiStream = apiUrl.openStream();

			Document doc = null;
			try{
				
				doc 		 = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
				pestiUse 	 = doc.getElementsByTagName("pestiUse").item(0).getFirstChild().getNodeValue();
				useSuittime  = doc.getElementsByTagName("useSuittime").item(0).getFirstChild().getNodeValue();
				useNum 	 	 = doc.getElementsByTagName("useNum").item(0).getFirstChild().getNodeValue();
				
			}catch(Exception e){
				e.printStackTrace();
				isRetrieve = false;
			}finally{
				apiStream.close();
			}
		}
		
		resultMap.put("cropNames", 			cropNames 		);
		resultMap.put("diseaseWeedNames", 	diseaseWeedNames);
		resultMap.put("useNames", 			useNames 		);
		resultMap.put("pestiKorNames",		pestiKorNames 	);
		resultMap.put("pestiBrandNames", 	pestiBrandNames );
		resultMap.put("compNames", 			compNames 		);
		resultMap.put("pestiUse", 			pestiUse		);
		resultMap.put("useSuittime", 		useSuittime		);
		resultMap.put("useNum", 			useNum			);
		
		
		return resultMap;
	}
	
	
	
}
