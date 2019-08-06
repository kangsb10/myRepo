package kr.or.ddit.dao.nongupinfileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CommunityFileItemVO;
import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.NongupinFileItemVO;
import kr.or.ddit.vo.NongupinVO;

@Service
public class INongupinFileItemDaoImpl implements INongupinFileItemDao{

	@Autowired
	private SqlMapClient client;
	
	@Override
	public NongupinFileItemVO nongupinFileItemInfo(
			Map<String, String> params) throws Exception {
		return (NongupinFileItemVO) client.queryForObject("nongupinFileItem.nongupinFileItemInfo", params);
	}

	@Override
	public void insertNongupinFileItem(
			List<NongupinFileItemVO> nongupinFileItemList,
			String farming_in_no) throws Exception {
		for(NongupinFileItemVO nongupinFileItemInfo : nongupinFileItemList){
			nongupinFileItemInfo.setFarming_in_no(farming_in_no);
			
			client.insert("nongupinFileItem.insertNongupinFileItem", nongupinFileItemInfo);
		}

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
	public void updateNongupinInfo(NongupinFileItemVO nongupinInfo)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNongupinInfo(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		
	}



	

}
