package kr.or.ddit.dao.customercenter;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.CstmrAnswerVO;
import kr.or.ddit.vo.CustomerCenterVO;

@Repository
public class ICustomerCenterDaoImpl implements ICustomerCenterDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public CustomerCenterVO customerConterInfo(Map<String, String> params)
			throws Exception {
		return (CustomerCenterVO) this.client.queryForObject("customercenter.customerCenterInfo", params);
	}
	
	@Override
	public CustomerCenterVO upCustomerConterInfo(Map<String, String> params)
			throws Exception {
		return (CustomerCenterVO) this.client.queryForObject("customercenter.upCustomerCenterInfo", params);
	}

	@Override
	public List<CustomerCenterVO> customerCenterList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("customercenter.customerCenterList", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("customercenter.totalCount", params);
	}

	@Override
	public String insertCustomerCenter(CustomerCenterVO customerCenterInfo)
			throws Exception {
		String cstmr_cnter_no = "";
		cstmr_cnter_no = (String) this.client.insert("customercenter.insertCustomerCenter", customerCenterInfo);
		return cstmr_cnter_no;
	}

	@Override
	public void deleteCustomerCenter(Map<String, String> params)
			throws Exception {
		this.client.update("customercenter.deleteCustomerCenter", params);
	}

	@Override
	public void updateCustomerCenter(CustomerCenterVO CustomerCenterInfo)
			throws Exception {
		this.client.update("customercenter.updateCustomerCenter", CustomerCenterInfo);
	}
	
	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		this.client.update("customercenter.updateHit", params);
	}
	
//	문의내역
	@Override
	public List<CustomerCenterVO> userStatementList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("customercenter.userStatementList", params);
	}

	@Override
	public String insertAnswer(CstmrAnswerVO cstmrInfo, CustomerCenterVO customerInfo) throws Exception {
		this.client.update("cstmranswer.updateAnswer", customerInfo);
		return (String) this.client.insert("cstmranswer.insertCstmrAnswer", cstmrInfo);
	}

	@Override
	public CstmrAnswerVO cstmrAnswerInfo(Map<String, String> params)
			throws Exception {
		return (CstmrAnswerVO) this.client.queryForObject("cstmranswer.cstmrAnswerInfo", params);
	}

	@Override
	public void updateAnswer(CstmrAnswerVO cstmrInfo) throws Exception {
		this.client.update("cstmranswer.updateCstmrAnswer", cstmrInfo);
	}

	@Override
	public int countAnswer() throws Exception {
		return (int) this.client.queryForObject("customercenter.countAnswer");
	}

	@Override
	public int totalCount1(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("customercenter.totalCount1", params);
	}

	


	
	
}
