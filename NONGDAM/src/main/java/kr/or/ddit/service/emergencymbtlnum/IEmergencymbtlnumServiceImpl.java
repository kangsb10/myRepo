package kr.or.ddit.service.emergencymbtlnum;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.emergencymbtlnum.IEmergencymbtlnumDao;
import kr.or.ddit.vo.EmergencyMbtlNumVO;

@Service
public class IEmergencymbtlnumServiceImpl implements IEmergencymbtlnumService {
	
	@Autowired
	private  IEmergencymbtlnumDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<EmergencyMbtlNumVO> embergencymbtlnumList(
			Map<String, String> params) throws Exception {
		return dao.embergencymbtlnumList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertegmn(EmergencyMbtlNumVO egmnInfo) throws Exception {
		dao.insertegmn(egmnInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}

}
