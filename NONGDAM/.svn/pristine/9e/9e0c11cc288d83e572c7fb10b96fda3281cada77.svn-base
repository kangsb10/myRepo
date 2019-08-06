package kr.or.ddit.service.cultivation;

import java.util.List;
import java.util.Map;










import kr.or.ddit.dao.cultivation.ICultivationMethodDao;
import kr.or.ddit.dao.cultivationfileitem.ICultivationMethodFileItemDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.CultivationMethodVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ICultivationMethodServiceImpl implements ICultivationMethodService {
	@Autowired
	private ICultivationMethodDao dao;
	
	@Autowired
	private ICultivationMethodFileItemDao cultivationMethodFileItemdao;
	
	@Autowired
	private AttachFileMapper fileMapper;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CultivationMethodVO cultivationMethodInfo(Map<String, String> params)
			throws Exception {
		return dao.cultivationMethodInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CultivationMethodVO upCultivationMethodInfo(
			Map<String, String> params) throws Exception {
		return dao.upCultivationMethodInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CultivationMethodVO> cultivationMethodList(
			Map<String, String> params) throws Exception {
		return dao.cultivationMethodList(params);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public String insertCultivationMethodInfo(
			CultivationMethodVO cultivationMethodInfo,
			@RequestParam("files") MultipartFile[] items)
			throws Exception {
		String ctvt_mth_no=null;
//        String temp = cultivationMethodInfo.getCtvt_mth_sj();
//        String temp1 = temp.replaceAll("<", "&lt");
//        String temp2 = temp1.replaceAll(">", "&gt");
//        cultivationMethodInfo.setCtvt_mth_sj(temp2);
		List<CultivationMethodFileItemVO> cultivationMethodFileItemList = fileMapper.mapping(items, ctvt_mth_no);
		ctvt_mth_no = dao.insertCultivationMethodInfo(cultivationMethodInfo, cultivationMethodFileItemList);
		return ctvt_mth_no; 
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		int totalCount = 0;
		totalCount = dao.totalCount(params);
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public void deleteCultivationMethodInfo(Map<String, String> params)
			throws Exception {
		dao.deleteCultivationMethodInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public void updateCultivationMethodInfo(
			CultivationMethodVO cultivationMethodInfo) throws Exception {
		dao.updateCultivationMethodInfo(cultivationMethodInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		dao.updateHit(params);
	}

	

}

