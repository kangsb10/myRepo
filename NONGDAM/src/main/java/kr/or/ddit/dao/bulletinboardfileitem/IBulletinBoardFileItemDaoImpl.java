package kr.or.ddit.dao.bulletinboardfileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CultivationMethodFileItemVO;

@Service
public class IBulletinBoardFileItemDaoImpl implements IBulletinBoardFileItemDao{

	@Autowired
	private SqlMapClient client;
	
	@Override
	public BulletinBoardFileItemVO bulletinBoardFileItemInfo(
			Map<String, String> params) throws Exception {
		return (BulletinBoardFileItemVO) this.client.queryForObject("bulletinBoardFileItem.bulletinBoardFileItemInfo", params);
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
		for(BulletinBoardFileItemVO bulletinBoardFileItemInfo : bulletinBoardFileItemList){
			bulletinBoardFileItemInfo.setBbs_no(bbs_no);
			
			this.client.insert("bulletinBoardFileItem.insertBulletinBoardFileItem", bulletinBoardFileItemInfo);
		}

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
