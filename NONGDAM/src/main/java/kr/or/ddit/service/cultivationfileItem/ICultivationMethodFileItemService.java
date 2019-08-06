package kr.or.ddit.service.cultivationfileItem;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.CultivationMethodVO;

public interface ICultivationMethodFileItemService {
	public CultivationMethodFileItemVO cultivationMethodFileItemInfo(Map<String, String> params) throws Exception;
	public CultivationMethodVO cultivationMethodInfo(Map<String, String> params) throws Exception;
	public List<CultivationMethodVO> cultivationMethodList(Map<String,String> params) throws Exception;
	public void insertCultivationMethodFileItem(List<CultivationMethodFileItemVO> cultivationMethodfileItemList,String ctvt_mth_no)
			throws Exception ;
	public void updateCultivationMethodInfo(CultivationMethodVO cultivationMethodInfo) throws Exception;
	public void deleteCultivationMethodInfo(Map<String,String> params) throws Exception;
}
