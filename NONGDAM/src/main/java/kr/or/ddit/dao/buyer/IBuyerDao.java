package kr.or.ddit.dao.buyer;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerDao {
	
	 public List<BuyerVO> buyerList(Map<String, String> params) throws Exception;

}
