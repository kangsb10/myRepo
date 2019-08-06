package kr.or.ddit.service.cultivationfileItem;

import java.util.List;
import java.util.Map;



import kr.or.ddit.dao.cultivationfileitem.ICultivationMethodFileItemDao;
import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.CultivationMethodVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ICultivationMethodFileItemServiceImpl implements
		ICultivationMethodFileItemService {
	@Autowired
	private ICultivationMethodFileItemDao fileitemdao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CultivationMethodFileItemVO cultivationMethodFileItemInfo(
			Map<String, String> params) throws Exception {
		return fileitemdao.cultivationMethodFileItemInfo(params);
	}

	@Override
	public CultivationMethodVO cultivationMethodInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CultivationMethodVO> cultivationMethodList(
			Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertCultivationMethodFileItem(
			List<CultivationMethodFileItemVO> cultivationMethodfileItemList,
			String ctvt_mth_no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateCultivationMethodInfo(
			CultivationMethodVO cultivationMethodInfo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCultivationMethodInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub

	}

}

