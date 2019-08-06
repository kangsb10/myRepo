package kr.or.ddit.service.nongupinfileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.bulletinboardfileitem.IBulletinBoardFileItemDao;
import kr.or.ddit.dao.communityfileitem.ICommunityFileItemDao;
import kr.or.ddit.dao.nongupinfileitem.INongupinFileItemDao;
import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CommunityFileItemVO;
import kr.or.ddit.vo.NongupinFileItemVO;

@Repository
public class INongupinFileItemServiceImpl implements INongupinFileItemService{
	
	@Autowired
	private INongupinFileItemDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public NongupinFileItemVO nongupinFileItemInfo(
			Map<String, String> params) throws Exception {
		return dao.nongupinInfo(params);
	}

	@Override
	public NongupinFileItemVO nongupinInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NongupinFileItemVO> nongupinList(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertNongupinFileItem(
			List<NongupinFileItemVO> nongupinFileItemList, String farming_in_no)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateNongupinInfo(NongupinFileItemVO nongupinInfo)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNongupinInfo(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
