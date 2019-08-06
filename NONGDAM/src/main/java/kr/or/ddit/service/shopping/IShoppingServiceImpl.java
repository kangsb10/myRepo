package kr.or.ddit.service.shopping;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.shopping.IShoppingDao;
import kr.or.ddit.dao.shoppingfileitem.IShoppingFileItemDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.PaymentVO;
import kr.or.ddit.vo.ShoppingFileItemVO;
import kr.or.ddit.vo.ShoppingVO;


@Service
public class IShoppingServiceImpl implements IShoppingService {
	
	@Autowired
	private IShoppingDao dao;
	
	@Autowired
	private IShoppingFileItemDao shoppingFileItemDao;
	
	@Autowired
	private AttachFileMapper fileMapper; 
	

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ShoppingVO shoppingInfo(Map<String, String> params) throws Exception {
		return dao.shoppingInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ShoppingVO> shoppingList(Map<String, String> params) throws Exception {
		return dao.shoppingList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertShoppingInfo(ShoppingVO shoppingInfo,
			@RequestParam("files") MultipartFile[] items) throws Exception {
		
		String goods_id = null;
		List<ShoppingFileItemVO> shoppingFileItemList = fileMapper.mappings(items, goods_id);
		goods_id = dao.insertShoppingInfo(shoppingInfo, shoppingFileItemList);		
		return goods_id;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		int totalCount = 0;
		totalCount = dao.totalCount(params);
		return totalCount;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ShoppingVO> prodIdList(Map<String, String> params)
			throws Exception {
		List<ShoppingVO> sList = null;
		try {
			sList = dao.prodIdList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sList;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertPaymentInfo(PaymentVO paymentInfo) throws Exception {
		dao.insertPaymentInfo(paymentInfo);
	}
	
	

}
