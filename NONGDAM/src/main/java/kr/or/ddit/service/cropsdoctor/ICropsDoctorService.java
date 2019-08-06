package kr.or.ddit.service.cropsdoctor;

import java.util.Map;

import kr.or.ddit.vo.DiseaseVO;

public interface ICropsDoctorService {

	public DiseaseVO diseaseInfo(Map<String,String> params) throws Exception;
	
	public DiseaseVO diseaseInfoForName(Map<String,String> params) throws Exception;
	
	public String selectCatNm(Map<String,String> params) throws Exception;
	
	public String selectGoodsNm(Map<String,String> params) throws Exception;
}
