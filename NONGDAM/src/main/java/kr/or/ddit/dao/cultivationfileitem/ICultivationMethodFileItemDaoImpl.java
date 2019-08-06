package kr.or.ddit.dao.cultivationfileitem;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.cultivationfileitem.ICultivationMethodFileItemDao;
import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.CultivationMethodVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICultivationMethodFileItemDaoImpl implements
		ICultivationMethodFileItemDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public CultivationMethodFileItemVO cultivationMethodFileItemInfo(
			Map<String, String> params) throws Exception {
		return (CultivationMethodFileItemVO) this.client.queryForObject("cultivationmethodfileitem.cultivationMethodFileItemInfo", params);
	}

	@Override
	public CultivationMethodVO cultivationMethodInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CultivationMethodVO> cultivationMethodList(
			Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertCultivationMethodFileItem(
			List<CultivationMethodFileItemVO> cultivationMethodfileItemList,
			String ctvt_mth_no) throws Exception {
		for(CultivationMethodFileItemVO cultivationMethodFileItemInfo : cultivationMethodfileItemList){
			cultivationMethodFileItemInfo.setCtvt_mth_no(ctvt_mth_no);
			
			this.client.insert("cultivationmethodfileitem.insertCultivationMethodFileItem", cultivationMethodFileItemInfo);
		}

	}

	@Override
	public void updateCultivationMethodInfo(
			CultivationMethodVO cultivationMethodInfo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCultivationMethodInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub

	}

}

