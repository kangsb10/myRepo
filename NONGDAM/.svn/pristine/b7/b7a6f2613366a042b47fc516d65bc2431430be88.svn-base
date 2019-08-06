package kr.or.ddit.service.buyer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.buyer.IBuyerDao;
import kr.or.ddit.vo.BuyerVO;

@Service
public class IBuyerServiceImpl implements IBuyerService {
	
	@Autowired
	private IBuyerDao dao;

	public IBuyerServiceImpl(){
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<BuyerVO> buyerList(Map<String, String> params) throws Exception {
		return dao.buyerList(params);
	}

}
