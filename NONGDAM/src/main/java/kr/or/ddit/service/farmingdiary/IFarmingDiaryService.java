package kr.or.ddit.service.farmingdiary;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.FarmingDiaryVO;
import kr.or.ddit.vo.FarmingFileItemVO;

public interface IFarmingDiaryService {
	
	public FarmingDiaryVO farmingDiaryInfo(Map<String, String> params) throws Exception;
	
	public List<FarmingDiaryVO> farmingDiaryList(Map<String, String> params) throws Exception;
	
	public int totalCount(Map<String, String> params) throws Exception;
	
	public String insertFarmingDiaryInfo(FarmingDiaryVO farmingDiaryInfo,
			MultipartFile[] items) throws Exception;
	
	public void deleteFarmingDiaryInfo(Map<String, String> params) throws Exception;
	public void updateFarmingDiaryInfo(FarmingDiaryVO farmingDiaryInfo) throws Exception;
	public FarmingDiaryVO sfmsFarmingDiaryInfo(Map<String ,String>params) throws Exception;
	public void updateFarmingDiarySfms(FarmingDiaryVO farmingDiaryInfo)throws Exception;
}
