package kr.or.ddit.dao.shoppingfileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.ShoppingFileItemVO;
import kr.or.ddit.vo.ShoppingVO;

@Repository
public class IShoppingFileItemDaoImpl implements IShoppingFileItemDao {

	@Autowired
	private SqlMapClient client;
	
	@Override
	public ShoppingFileItemVO shoppingFileItemInfo(Map<String, String> params)
			throws Exception {
		return (ShoppingFileItemVO) this.client.queryForObject("shoppingfileitem.shoppingFileItemInfo", params);
	}

	//이거 shoppingDao에 있는거를 왜하지
	@Override
	public ShoppingVO shoppingInfo(Map<String, String> params) throws Exception {
		return null;
	}

	@Override
	public List<ShoppingVO> shoppingList(Map<String, String> params)
			throws Exception {
		return null;
	}

	@Override
	public void insertShoppingFileItem(
			List<ShoppingFileItemVO> shoppingFileItemList, String goods_id)
			throws Exception {

		for(ShoppingFileItemVO shoppingFileItemInfo : shoppingFileItemList){
			shoppingFileItemInfo.setGoods_id(goods_id);
			
			this.client.insert("shoppingfileitem.insertShoppingFileItem", shoppingFileItemInfo);
		}
	}

	@Override
	public void updateShoppingInfo(ShoppingVO shoppingInfo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteShoppingInfo(Map<String, String> params) throws Exception {

	}

}
