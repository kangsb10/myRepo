package kr.or.ddit.dao.payment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.PaymentVO;

@Repository
public class IPaymentDaoImpl implements IPaymentDao {

	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<PaymentVO> paymentList(Map<String, String> params)
			throws Exception {
		return client.queryForList("payment.paymentList", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("payment.totalCount", params);
	}

}
