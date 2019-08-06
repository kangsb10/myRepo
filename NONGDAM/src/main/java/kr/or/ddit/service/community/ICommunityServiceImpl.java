package kr.or.ddit.service.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.bulletinboardfileitem.IBulletinBoardFileItemDao;
import kr.or.ddit.dao.community.ICommunityDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CommunityFileItemVO;
import kr.or.ddit.vo.CommunityVO;

@Service
public class ICommunityServiceImpl implements ICommunityService{
	@Autowired
	private ICommunityDao dao;
	
	@Autowired
	private IBulletinBoardFileItemDao bulletinBoardFileitemdao;
	
	@Autowired
	private AttachFileMapper fileMapper;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CommunityVO> communityList(Map<String, String> params)
			throws Exception {
		return dao.communityList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CommunityVO communityInfo(Map<String, String> params)
			throws Exception {
		return dao.communityInfo(params);
	}
	
	// 카페 등록
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public String communityIns(CommunityVO communityInfo, 
				@RequestParam("files") MultipartFile[] itemss) throws Exception {
		String cmmnty_no = null;
		
		String temp = communityInfo.getCmmnty_cafe_nm();
		String temp1 = temp.replaceAll("<", "&lt");
		String temp2 = temp1.replaceAll(">", "&gt");
		communityInfo.setCmmnty_cafe_nm(temp2);
		
		
		List<CommunityFileItemVO>  communityFileItemList = fileMapper.mappingssss(itemss, cmmnty_no);
		cmmnty_no = dao.communityIns(communityInfo, communityFileItemList);
		
		return cmmnty_no;
	}
	
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CommunityVO> guMN(Map<String, String> params)
			throws Exception {
		return dao.guMN(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CommunityVO> guNM(Map<String, String> params)
			throws Exception {
		return this.dao.guNM(params);
	}

	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public void cafeMberIns(CommunityVO communityInfo) throws Exception {

		dao.cafeMberIns(communityInfo);
	}

	@Override
	public CommunityVO cafeNameCheck(Map<String, String> params)
			throws Exception {
		return dao.cafeNameCheck(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public void cafeBoardIns(CommunityVO communityInfo) throws Exception {
		
		dao.cafeBoardIns(communityInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CommunityVO> cafeBoList(Map<String, String> params)
			throws Exception {
		return dao.cafeBoList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CommunityVO> cafeSelList(Map<String, String> params)
			throws Exception {
		return dao.cafeSelList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CommunityVO boardInfo(Map<String, String> params) throws Exception {
		return dao.boardInfo(params);
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
	public int totalCounts(Map<String, String> params) throws Exception {
		int totalCounts = 0;
		totalCounts = dao.totalCounts(params);
		return totalCounts;
	}
	// 글 등록
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public String insertCafeBoardInfo(CommunityVO communityInfo,
			@RequestParam("files") MultipartFile[] items) throws Exception {
		String bbs_no = null;
		
		String temp = communityInfo.getBbs_sj();
		String temp1 = temp.replaceAll("<", "&lt");
		String temp2 = temp1.replaceAll(">", "&gt");
		communityInfo.setBbs_sj(temp2);
		
		
		List<BulletinBoardFileItemVO> bulletinBoardFileItemList = fileMapper.mappingsss(items, bbs_no);
		bbs_no = dao.insertCafeBoardInfo(communityInfo, bulletinBoardFileItemList);
		return bbs_no;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public CommunityVO boardListInfo(Map<String, String> params)
			throws Exception {
		return dao.boardListInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void deleteboardInfo(Map<String, String> params) throws Exception {
		dao.deleteboardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void updateboardInfo(CommunityVO communityInfo) throws Exception {
		dao.updateboardInfo(communityInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void deletecafeboInfo(Map<String, String> params) throws Exception {
		dao.deletecafeboInfo(params);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void updatecafeboInfo(CommunityVO communityInfo) throws Exception {
		dao.updatecafeboInfo(communityInfo);
		
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void updatecafeInfo(CommunityVO communityInfo) throws Exception {
		dao.updatecafeInfo(communityInfo);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void deletecafeInfo(Map<String, String> params) throws Exception {
		dao.deletecafeInfo(params);
		
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void updatecafeNCNMInfo(CommunityVO communityInfo) throws Exception {
		dao.updatecafeNCNMInfo(communityInfo);
		
	}
	
}
