package kr.or.ddit.dao.communityfileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CommunityFileItemVO;
import kr.or.ddit.vo.CultivationMethodFileItemVO;

@Service
public class ICommunityFileItemDaoImpl implements ICommunityFileItemDao{

	@Autowired
	private SqlMapClient client;
	
	@Override
	public CommunityFileItemVO communityFileItemInfo(
			Map<String, String> params) throws Exception {
		return (CommunityFileItemVO) this.client.queryForObject("communityFileItem.communityFileItemInfo", params);
	}

	@Override
	public void insertCommunityFileItem(
			List<CommunityFileItemVO> communityFileItemList,
			String cmmnty_no) throws Exception {
		for(CommunityFileItemVO communityFileItemInfo : communityFileItemList){
			communityFileItemInfo.setCmmnty_no(cmmnty_no);
			
			this.client.insert("communityFileItem.insertCommunityFileItem", communityFileItemInfo);
		}

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
