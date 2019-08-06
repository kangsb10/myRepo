package kr.or.ddit.dao.cropsdoctor;

import java.util.Map;

import kr.or.ddit.vo.DiseaseVO;

public interface ICropsDoctorDao {
	
	// 클래스명으로 병명 불러오기
	public DiseaseVO diseaseInfo(Map<String,String> params) throws Exception;
	
	// 병명으로 vo가져오기
	public DiseaseVO diseaseInfoForName(Map<String,String> params) throws Exception;
	
	public String selectCatNm(Map<String,String> params) throws Exception;
	
	// 농약이름으로 goods_id 가져오기
	public String selectGoodsNm(Map<String,String> params) throws Exception;
}
