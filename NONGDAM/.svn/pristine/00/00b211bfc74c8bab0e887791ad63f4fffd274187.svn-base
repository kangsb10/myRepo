package kr.or.ddit.service.communityfileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.bulletinboardfileitem.IBulletinBoardFileItemDao;
import kr.or.ddit.dao.communityfileitem.ICommunityFileItemDao;
import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CommunityFileItemVO;

@Repository
public class ICommunityFileItemServiceImpl implements ICommunityFileItemService{
	
	@Autowired
	private ICommunityFileItemDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CommunityFileItemVO communityFileItemInfo(
			Map<String, String> params) throws Exception {
		return dao.communityInfo(params);
	}

	@Override
	public CommunityFileItemVO communityInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CommunityFileItemVO> communityList(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertCommunityFileItem(
			List<CommunityFileItemVO> communityFileItemList, String cmmnty_no)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCommunityInfo(CommunityFileItemVO communityInfo)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCommunityInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
