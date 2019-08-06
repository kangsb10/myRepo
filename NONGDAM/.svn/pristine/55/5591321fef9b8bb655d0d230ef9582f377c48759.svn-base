package kr.or.ddit.dao.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dao.bulletinboardfileitem.IBulletinBoardFileItemDao;
import kr.or.ddit.dao.communityfileitem.ICommunityFileItemDao;
import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CommunityFileItemVO;
import kr.or.ddit.vo.CommunityVO;

@Repository
public class ICommunityDaoImpl implements ICommunityDao{
	@Autowired
	private SqlMapClient client;
	
	@Autowired
	private IBulletinBoardFileItemDao fileItemdao;
	
	@Autowired
	private ICommunityFileItemDao dao;
	
	
	@Override
	public List<CommunityVO> communityList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("community.communityList", params);
	}

	@Override
	public CommunityVO communityInfo(Map<String, String> params)
			throws Exception {
		return (CommunityVO) client.queryForObject("community.communityInfo", params);
	}

	@Override
	public String communityIns(CommunityVO communityInfo,
			List<CommunityFileItemVO> communityFileItemList) throws Exception {
		String cmmnty_no = "";
		cmmnty_no = (String) client.insert("community.communityIns",communityInfo);
		dao.insertCommunityFileItem(communityFileItemList, cmmnty_no);
		
		return cmmnty_no;
	}

	@Override
	public List<CommunityVO> guMN(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("community.guMN", params);
	}

	@Override
	public List<CommunityVO> guNM(Map<String, String> params) throws Exception {
		return this.client.queryForList("community.guNM", params);
	}

	@Override
	public void cafeMberIns(CommunityVO communityInfo) throws Exception {
		this.client.insert("community.cafeMberIns", communityInfo);
	}

	@Override
	public CommunityVO cafeNameCheck(Map<String, String> params)
			throws Exception {
		return (CommunityVO) client.queryForObject("community.cafenameCheck", params);
	}

	@Override
	public void cafeBoardIns(CommunityVO communityInfo) throws Exception {
		this.client.insert("community.cafeboardIns",communityInfo);
	}
	@Override
	public List<CommunityVO> cafeBoList(Map<String, String> params)
			throws Exception {
		return client.queryForList("community.cafeBoList", params);
	}

	@Override
	public List<CommunityVO> cafeSelList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("community.cafeSelList", params);
	}

	@Override
	public CommunityVO boardInfo(Map<String, String> params)
			throws Exception {
		return (CommunityVO) client.queryForObject("community.boardInfo", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("community.totalCount", params);
	}
	@Override
	public int totalCounts(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("community.totalCounts", params);
	}

	@Override
	public String insertCafeBoardInfo(CommunityVO communityInfo,
			List<BulletinBoardFileItemVO> bulletinBoardFileItemList)
			throws Exception {
		String bbs_no = "";
		
		bbs_no = (String) this.client.insert("community.cafeBoardInsert", communityInfo);
		fileItemdao.insertBulletinBoardFileItem(bulletinBoardFileItemList, bbs_no);
		
		return bbs_no;
	}

	@Override
	public CommunityVO boardListInfo(Map<String, String> params)
			throws Exception {
		client.update("community.updateHit", params);
		return (CommunityVO) this.client.queryForObject("community.boardListInfo", params);
	}

	@Override
	public void deleteboardInfo(Map<String, String> params) throws Exception {
		client.delete("community.deleteCafeBoard", params);
		
	}

	@Override
	public void updateboardInfo(CommunityVO communityInfo) throws Exception {
		client.update("community.updateboardInfo", communityInfo);
		
	}

	@Override
	public void deletecafeboInfo(Map<String, String> params) throws Exception {
		client.delete("community.deleteCafebo", params);
		
	}

	@Override
	public void updatecafeboInfo(CommunityVO communityInfo) throws Exception {
		client.update("community.updateCafebo", communityInfo);
		
	}

	@Override
	public void updatecafeInfo(CommunityVO communityInfo) throws Exception {
		client.update("community.updateCafe",communityInfo);
		
	}

	@Override
	public void deletecafeInfo(Map<String, String> params) throws Exception {
		client.delete("community.deleteCafe", params);
	}

	@Override
	public void updatecafeNCNMInfo(CommunityVO communityInfo) throws Exception {
		client.update("community.updateNCNM",communityInfo);
	}
	
}
