package kr.or.ddit.service.farmingfileitem;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FarmingDiaryVO;
import kr.or.ddit.vo.FarmingFileItemVO;

public interface IFarmingFileItemService {
	public FarmingFileItemVO farmingFileItemInfo(Map<String, String> params) throws Exception;
	public FarmingDiaryVO farmingDiaryInfo(Map<String, String> params) throws Exception;
	public List<FarmingDiaryVO> farmingDiaryList(Map<String, String> params) throws Exception;
	public void insertFarmingFileItem(List<FarmingFileItemVO> farmingFileItemList, String farm_diary_no) throws Exception;
	
}
