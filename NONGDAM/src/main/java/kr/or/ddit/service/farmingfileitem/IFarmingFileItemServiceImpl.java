package kr.or.ddit.service.farmingfileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.farmingfileitem.IFarmingFileItemDao;
import kr.or.ddit.vo.FarmingDiaryVO;
import kr.or.ddit.vo.FarmingFileItemVO;
@Service
public class IFarmingFileItemServiceImpl implements IFarmingFileItemService {
	@Autowired
	private IFarmingFileItemDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public FarmingFileItemVO farmingFileItemInfo(Map<String, String> params)
			throws Exception {
		return dao.farmingFileItemInfo(params);
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
		// TODO Auto-generated method stub

	}

}
