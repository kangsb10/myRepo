package kr.or.ddit.dao.customercenter;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CstmrAnswerVO;
import kr.or.ddit.vo.CustomerCenterVO;

public interface ICustomerCenterDao {
	public CustomerCenterVO customerConterInfo(Map<String, String> params) throws Exception;
	
	public CustomerCenterVO upCustomerConterInfo(Map<String, String> params) throws Exception;
	
	public List<CustomerCenterVO> customerCenterList(Map<String, String> params) throws Exception;
	
	public int totalCount(Map<String, String> params) throws Exception;
	
	public String insertCustomerCenter(CustomerCenterVO customerCenterInfo) throws Exception;
	
	public void deleteCustomerCenter(Map<String, String> params) throws Exception;
	
	public void updateCustomerCenter(CustomerCenterVO CustomerCenterInfo) throws Exception;
	
	public List<CustomerCenterVO> userStatementList(Map<String, String> params) throws Exception;
	
	public void updateHit(Map<String, String> params) throws Exception; 
	
	public int totalCount1(Map<String, String> params) throws Exception;

	
	//답글
	public CstmrAnswerVO cstmrAnswerInfo(Map<String, String> params) throws Exception;
	
	public String insertAnswer(CstmrAnswerVO cstmrInfo, CustomerCenterVO customerInfo) throws Exception;
	
	public void updateAnswer(CstmrAnswerVO cstmrInfo) throws Exception;
	
	// 답글 개수
	
	public int countAnswer() throws Exception;
}

