package kr.or.ddit.service.bulletinboardfileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.bulletinboardfileitem.IBulletinBoardFileItemDao;
import kr.or.ddit.vo.BulletinBoardFileItemVO;

@Repository
public class IBulletinBoardFileItemServiceImpl implements IBulletinBoardFileItemService{
	
	@Autowired
	private IBulletinBoardFileItemDao bulletinfileitemdao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public BulletinBoardFileItemVO bulletinBoardFileItemInfo(
			Map<String, String> params) throws Exception {
		return bulletinfileitemdao.bulletinBoardInfo(params);
	}

	@Override
	public BulletinBoardFileItemVO bulletinBoardInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BulletinBoardFileItemVO> bulletinBoardList(
			Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertBulletinBoardFileItem(
			List<BulletinBoardFileItemVO> bulletinBoardFileItemList,
			String bbs_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBulletinBoardInfo(
			BulletinBoardFileItemVO bulletinBoardInfo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBulletinBoardInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
