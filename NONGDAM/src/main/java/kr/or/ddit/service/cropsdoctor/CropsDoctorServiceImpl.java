package kr.or.ddit.service.cropsdoctor;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.cropsdoctor.ICropsDoctorDao;
import kr.or.ddit.vo.DiseaseVO;

@Service
public class CropsDoctorServiceImpl implements ICropsDoctorService {

	@Autowired
	private ICropsDoctorDao dao;
	
//	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public DiseaseVO diseaseInfo(Map<String, String> params) throws Exception {
		return dao.diseaseInfo(params);
	}

	@Override
	public String selectCatNm(Map<String, String> params) throws Exception {
		return dao.selectCatNm(params);
	}

	@Override
	public DiseaseVO diseaseInfoForName(Map<String, String> params) throws Exception {
		return dao.diseaseInfoForName(params);
	}

	@Override
	public String selectGoodsNm(Map<String, String> params) throws Exception {
		return dao.selectGoodsNm(params);
	}

}
