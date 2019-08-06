package kr.or.ddit.dao.cropsdoctor;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.DiseaseVO;

@Repository
public class CropsDoctorDaoImpl implements ICropsDoctorDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public DiseaseVO diseaseInfo(Map<String, String> params) throws Exception {
		return (DiseaseVO) client.queryForObject("cropsdoctor.diseaseInfo", params);
	}

	@Override
	public String selectCatNm(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("cropsdoctor.selectCatNm", params);
	}

	@Override
	public DiseaseVO diseaseInfoForName(Map<String, String> params) throws Exception {
		return (DiseaseVO) client.queryForObject("cropsdoctor.diseaseInfoForName", params);
	}

	@Override
	public String selectGoodsNm(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("cropsdoctor.selectGoodsId", params);
	}

}
