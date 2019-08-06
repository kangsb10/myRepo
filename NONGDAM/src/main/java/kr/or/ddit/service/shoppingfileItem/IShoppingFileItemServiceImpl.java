package kr.or.ddit.service.shoppingfileItem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.shoppingfileitem.IShoppingFileItemDao;
import kr.or.ddit.vo.ShoppingFileItemVO;
import kr.or.ddit.vo.ShoppingVO;

@Service
public class IShoppingFileItemServiceImpl implements IShoppingFileItemService {

	@Autowired
	private IShoppingFileItemDao fileItemDao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ShoppingFileItemVO shoppingFileItemInfo(Map<String, String> params) throws Exception {
		return fileItemDao.shoppingFileItemInfo(params);
	}

	@Override
	public ShoppingVO shoppingInfo(Map<String, String> params) {
		return null;
	}

	@Override
	public List<ShoppingVO> shoppingList(Map<String, String> params) {
		return null;
	}

	@Override
	public void insertShoppingFileItem(
			List<ShoppingFileItemVO> shoppingFileItemList, String goods_id) {

	}

	@Override
	public void updateShoppingInfo(ShoppingVO shoppingInfo) {

	}

	@Override
	public void deleteShoppingInfo(Map<String, String> params) {

	}

}
