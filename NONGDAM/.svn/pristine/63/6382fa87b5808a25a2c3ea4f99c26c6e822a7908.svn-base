package kr.or.ddit.service.farmingdiary;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.farmingdiary.IFarmingDiaryDao;
import kr.or.ddit.dao.farmingfileitem.IFarmingFileItemDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FarmingDiaryVO;
import kr.or.ddit.vo.FarmingFileItemVO;

@Service
public class IFarmingDiaryServiceImpl implements IFarmingDiaryService {
	@Autowired
	private IFarmingDiaryDao dao;
	
	@Autowired
	private IFarmingFileItemDao filedao;
	
	@Autowired
	private AttachFileMapper fileMapper;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public FarmingDiaryVO farmingDiaryInfo(Map<String, String> params)
			throws Exception {
		return dao.farmingDiaryInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<FarmingDiaryVO> farmingDiaryList(Map<String, String> params)
			throws Exception {
		return dao.farmingDiaryList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		int totalCount = 0;
		totalCount = dao.totalCount(params);
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertFarmingDiaryInfo(FarmingDiaryVO farmingDiaryInfo,
			@RequestParam("files") MultipartFile[] items) throws Exception {
			String farm_diary_no =null;
			List<FarmingFileItemVO> farmingFileItemList = fileMapper.mappingss(items, farm_diary_no);
			farm_diary_no = dao.insertFarmingDiaryInfo(farmingDiaryInfo, farmingFileItemList);
		return farm_diary_no;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteFarmingDiaryInfo(Map<String, String> params)
			throws Exception {
		this.dao.deleteFarmingDiaryInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateFarmingDiaryInfo(FarmingDiaryVO farmingDiaryInfo)
			throws Exception {
		this.dao.updateFarmingDiaryInfo(farmingDiaryInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public FarmingDiaryVO sfmsFarmingDiaryInfo(Map<String, String> params)
			throws Exception {
		return this.dao.sfmsFarmingDiaryInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateFarmingDiarySfms(FarmingDiaryVO farmingDiaryInfo)
			throws Exception {
		dao.updateFarmingDiarySfms(farmingDiaryInfo);
	}
	
}
