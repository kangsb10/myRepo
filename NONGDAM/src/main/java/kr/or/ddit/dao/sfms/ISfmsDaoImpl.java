package kr.or.ddit.dao.sfms;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FarmVO;
import kr.or.ddit.vo.SensorVO;

@Repository
public class ISfmsDaoImpl implements ISfmsDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<FarmVO> FarmList(Map<String, String> params) throws Exception {
		return client.queryForList("sfms.farmList", params);
	}

	@Override
	public FarmVO idCheck(Map<String, String> params) throws Exception {
		return (FarmVO) client.queryForObject("sfms.idCheck", params);
	}

	@Override
	public String searchCode(Map<String, String> params)
			throws Exception {
		return (String) client.queryForObject("sfms.searchCode", params);
	}

	@Override
	public void insertFarm(FarmVO farmInfo) throws Exception {
		client.insert("sfms.insertFarm", farmInfo);
	}

	@Override
	public FarmVO farmInfo(Map<String, String> params) throws Exception {
		return (FarmVO) client.queryForObject("sfms.farmInfo",params);
	}

	@Override
	public int updateFarm(FarmVO farmInfo) throws Exception {
		return client.update("sfms.updateFarm",farmInfo);
	}

	@Override
	public void deleteFarm(Map<String, String> params) throws Exception {
		client.update("sfms.deleteFarm",params);
	}
}
