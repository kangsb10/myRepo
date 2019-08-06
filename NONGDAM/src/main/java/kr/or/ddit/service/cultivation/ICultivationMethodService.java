package kr.or.ddit.service.cultivation;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CultivationMethodVO;

import org.springframework.web.multipart.MultipartFile;

public interface ICultivationMethodService {
	public CultivationMethodVO cultivationMethodInfo(Map<String, String> params) throws Exception;
	public CultivationMethodVO upCultivationMethodInfo(Map<String, String> params) throws Exception;
	public List<CultivationMethodVO> cultivationMethodList(Map<String, String> params) throws Exception;
	public String insertCultivationMethodInfo(CultivationMethodVO cultivationMethodInfo, 
			MultipartFile[] items) throws Exception;
	public void deleteCultivationMethodInfo(Map<String, String> params) throws Exception;
	public void updateCultivationMethodInfo(CultivationMethodVO cultivationMethodInfo) throws Exception;
	public int totalCount(Map<String, String> params) throws Exception;
	public void updateHit(Map<String, String> params) throws Exception; 
}
