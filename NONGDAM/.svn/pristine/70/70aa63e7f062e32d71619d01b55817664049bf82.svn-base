package kr.or.ddit.dao.buyer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.BuyerVO;

@Repository
public class IBuyerDaoImpl implements IBuyerDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<BuyerVO> buyerList(Map<String, String> params) throws Exception {
		return client.queryForList("buyer.buyerList", params);
		}
	

}
