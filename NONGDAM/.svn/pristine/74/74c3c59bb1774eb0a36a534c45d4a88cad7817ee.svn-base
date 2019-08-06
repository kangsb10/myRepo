package kr.or.ddit.service.payment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.payment.IPaymentDao;
import kr.or.ddit.vo.PaymentVO;

@Service
public class IPaymentServiceImpl implements IPaymentService {

	@Autowired
	private IPaymentDao dao;
	
	@Override
	public List<PaymentVO> paymentList(Map<String, String> params)
			throws Exception {
		return dao.paymentList(params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}

}
