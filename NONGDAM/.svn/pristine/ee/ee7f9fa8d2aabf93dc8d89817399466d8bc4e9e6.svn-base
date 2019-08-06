package kr.or.ddit.dao.farmingfileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FarmingDiaryVO;
import kr.or.ddit.vo.FarmingFileItemVO;

@Repository
public class IFarmingFileItemDaoImpl implements IFarmingFileItemDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public FarmingFileItemVO farmingFileItemInfo(Map<String, String> params)
			throws Exception {
		return (FarmingFileItemVO) this.client.queryForObject("farmingfileitem.farmingFileItemInfo", params);
	}

	@Override
	public FarmingDiaryVO farmingDiaryInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FarmingDiaryVO> farmingDiaryList(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFarmingFileItem(
			List<FarmingFileItemVO> farmingFileItemList, String farm_diary_no)
			throws Exception {
		for(FarmingFileItemVO farmingFileItemInfo : farmingFileItemList){
			farmingFileItemInfo.setFarm_diary_no(farm_diary_no);
			this.client.insert("farmingfileitem.insertFarmingFileItem", farmingFileItemInfo);
		}
		
		
	}
	
}
