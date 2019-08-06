package kr.or.ddit.dao.cultivation;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.CultivationMethodVO;

public interface ICultivationMethodDao {
	
	public CultivationMethodVO cultivationMethodInfo(Map<String, String> params) throws Exception;
	
	public CultivationMethodVO upCultivationMethodInfo(Map<String, String> params) throws Exception;
	
	public List<CultivationMethodVO> cultivationMethodList(Map<String, String> params) throws Exception;
	public String insertCultivationMethodInfo(CultivationMethodVO cultivationMethodInfo, 
											  List<CultivationMethodFileItemVO> cultivationMethodFileItemList) throws Exception;
	public void deleteCultivationMethodInfo(Map<String, String> params) throws Exception;
	public void updateCultivationMethodInfo(CultivationMethodVO cultivationMethodInfo) throws Exception;
	
	
	public int totalCount(Map<String, String> params) throws Exception;
	public void updateHit(Map<String, String> params) throws Exception; 
}
