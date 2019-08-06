package kr.or.ddit.cropsdoctor.utiles;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.service.cropsdoctor.ICropsDoctorService;
import kr.or.ddit.vo.DiseaseVO;

import org.springframework.beans.factory.annotation.Autowired;

public class SearchUtil {
	
	@Autowired
	public ICropsDoctorService cropsDoctorService; 
	
	public NCPMSUtil ncpmsUtil = new NCPMSUtil();
	
	// 해충,잡초,농약
	public Map<String, String> searchMap(String method, String object) {

		Map<String, String> resultMap = new HashMap<String, String>();

		// 병명,해충,잡초,농약
		try {
			Map<String, String> params = new HashMap<String, String>();

			if (method.equals("농약")) {
				NongyakUtil util = new NongyakUtil();
				resultMap = util.searchPesticideDetail(object);
			}
			if (method.equals("해충")) {
				resultMap = ncpmsUtil.detailPestForName(object);
			}
			if (method.equals("잡초")) {
				resultMap = ncpmsUtil.detailWeedsForName(object);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}
	
	// 병명
	public List<Map<String,String>> searchList(String object){
		
		List<Map<String,String>> resultList = null;
		
		try {
			resultList = ncpmsUtil.diseaseList(object);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return resultList;
	}

}
