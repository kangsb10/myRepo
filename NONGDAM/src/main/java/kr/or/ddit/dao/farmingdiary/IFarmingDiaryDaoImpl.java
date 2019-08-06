package kr.or.ddit.dao.farmingdiary;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dao.farmingfileitem.IFarmingFileItemDao;
import kr.or.ddit.vo.FarmingDiaryVO;
import kr.or.ddit.vo.FarmingFileItemVO;

@Repository
public class IFarmingDiaryDaoImpl implements IFarmingDiaryDao {
	@Autowired
	private SqlMapClient client;
	
	@Autowired
	private IFarmingFileItemDao fileItemdao;
	
	@Override
	public FarmingDiaryVO farmingDiaryInfo(Map<String, String> params)
			throws Exception {
		return (FarmingDiaryVO) this.client.queryForObject("farmingdiary.farmingDiaryInfo", params);
	}

	@Override
	public List<FarmingDiaryVO> farmingDiaryList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("farmingdiary.farmingDiaryList", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("farmingdiary.totalCount", params);
	}

	@Override
	public String insertFarmingDiaryInfo(FarmingDiaryVO farmingDiaryInfo,
			List<FarmingFileItemVO> farmingFileItemList) throws Exception {
		String farm_diary_no = "";
		farm_diary_no = (String) this.client.insert("farmingdiary.insertFarmingDiary", farmingDiaryInfo);
		fileItemdao.insertFarmingFileItem(farmingFileItemList, farm_diary_no);
		return farm_diary_no;
	}

	@Override
	public void deleteFarmingDiaryInfo(Map<String, String> params)
			throws Exception {
		this.client.update("farmingdiary.deleteFarmingDiary", params);
	}

	@Override
	public void updateFarmingDiaryInfo(FarmingDiaryVO farmingDiaryInfo)
			throws Exception {
		this.client.update("farmingdiary.updateFarmingDiary", farmingDiaryInfo);
	}

	@Override
	public FarmingDiaryVO sfmsFarmingDiaryInfo(Map<String, String> params)
			throws Exception {
		return (FarmingDiaryVO) this.client.queryForObject("farmingdiary.sfmsInfo", params);
	}

	@Override
	public void updateFarmingDiarySfms(FarmingDiaryVO farmingDiaryInfo)
			throws Exception {
		this.client.update("farmingdiary.updateFarmingDiarySfms",farmingDiaryInfo);
	}

}
