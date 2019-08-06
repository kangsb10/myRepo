package kr.or.ddit.dao.shopping;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PaymentVO;
import kr.or.ddit.vo.ShoppingFileItemVO;
import kr.or.ddit.vo.ShoppingVO;

public interface IShoppingDao {
	
	public ShoppingVO shoppingInfo(Map<String, String> params) throws Exception;
	public List<ShoppingVO> shoppingList(Map<String, String> params) throws Exception;
	public String insertShoppingInfo(ShoppingVO shoppingInfo, 
											  List<ShoppingFileItemVO> shoppingFileItemList) throws Exception;
	public void insertPaymentInfo(PaymentVO paymentInfo) throws Exception;
	public int totalCount(Map<String, String> params) throws Exception;
	 public List<ShoppingVO> prodIdList(Map<String, String> params) throws Exception;
}
