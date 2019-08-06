package kr.or.ddit.dao.cultivation;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.cultivation.ICultivationMethodDao;
import kr.or.ddit.dao.cultivationfileitem.ICultivationMethodFileItemDao;
import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.CultivationMethodVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICultivationMethodDaoImpl implements ICultivationMethodDao {
	@Autowired
	private SqlMapClient client;
	
	@Autowired
	private ICultivationMethodFileItemDao FileItemdao;
	
	@Override
	public CultivationMethodVO cultivationMethodInfo(Map<String, String> params)
			throws Exception {
		return (CultivationMethodVO) this.client.queryForObject("cultivationmethod.cultivationmethodInfo", params);
	}
	
	@Override
	public CultivationMethodVO upCultivationMethodInfo(
			Map<String, String> params) throws Exception {
		return (CultivationMethodVO) this.client.queryForObject("cultivationmethod.upCultivationmethodInfo", params);
	}

	@Override
	public List<CultivationMethodVO> cultivationMethodList(
			Map<String, String> params) throws Exception {
		return this.client.queryForList("cultivationmethod.cultivationmethodList", params);
	}

	@Override
	public String insertCultivationMethodInfo(
			CultivationMethodVO cultivationMethodInfo,
			List<CultivationMethodFileItemVO> cultivationMethodFileItemList)
			throws Exception {
		String ctvt_mth_no="";
		
//		this.client.startTransaction();
		
		ctvt_mth_no = (String) this.client.insert("cultivationmethod.insertCultivationMethod", cultivationMethodInfo);
		
		FileItemdao.insertCultivationMethodFileItem(cultivationMethodFileItemList, ctvt_mth_no);
		
//		this.client.commitTransaction();
		
//		this.client.endTransaction();
		
		return ctvt_mth_no;
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("cultivationmethod.totalCount",params);
	}

	@Override
	public void deleteCultivationMethodInfo(Map<String, String> params)
			throws Exception {
		this.client.update("cultivationmethod.deleteCultivationMethod", params);
	}

	@Override
	public void updateCultivationMethodInfo(
			CultivationMethodVO cultivationMethodInfo) throws Exception {
		this.client.update("cultivationmethod.updateCultivationMethod", cultivationMethodInfo);
	}

	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		client.update("cultivationmethod.updateHit", params);
	}



}
