package kr.or.ddit.dao.shopping;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.cultivation.ICultivationMethodDao;
import kr.or.ddit.dao.cultivationfileitem.ICultivationMethodFileItemDao;
import kr.or.ddit.dao.shoppingfileitem.IShoppingFileItemDaoImpl;
import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.CultivationMethodVO;
import kr.or.ddit.vo.PaymentVO;
import kr.or.ddit.vo.ShoppingFileItemVO;
import kr.or.ddit.vo.ShoppingVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IShoppingDaoImpl implements IShoppingDao {
	@Autowired
	private SqlMapClient client;
	
	@Autowired
	private IShoppingFileItemDaoImpl fileItemdao;

	@Override
	public ShoppingVO shoppingInfo(Map<String, String> params) throws Exception {
		
		return (ShoppingVO) this.client.queryForObject("shopping.shoppingInfo", params);
	}

	@Override
	public List<ShoppingVO> shoppingList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("shopping.shoppingList", params);
	}

	@Override
	public String insertShoppingInfo(ShoppingVO shoppingInfo,
			List<ShoppingFileItemVO> shoppingFileItemList) throws Exception {
		
		String  goods_id = "";
		goods_id = (String) this.client.insert("shopping.insertShopping", shoppingInfo);
		fileItemdao.insertShoppingFileItem(shoppingFileItemList, shoppingInfo.getGoods_id());
		return goods_id;
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("shopping.totalCount", params);
	}
	
	@Override
	public List<ShoppingVO> prodIdList(Map<String, String> params) throws Exception {
		return client.queryForList("shopping.searchProdId", params);
	}

	@Override
	public void insertPaymentInfo(PaymentVO paymentInfo) throws Exception {
		client.insert("shopping.insertPayment", paymentInfo);
		
	}

}
