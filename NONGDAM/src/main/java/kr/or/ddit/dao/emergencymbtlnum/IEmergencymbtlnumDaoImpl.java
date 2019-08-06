package kr.or.ddit.dao.emergencymbtlnum;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.EmergencyMbtlNumVO;

@Repository
public class IEmergencymbtlnumDaoImpl implements IEmergencymbtlnumDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<EmergencyMbtlNumVO> embergencymbtlnumList(
			Map<String, String> params) throws Exception {
		return client.queryForList("egmn.egmnList", params);
	}

	@Override
	public void insertegmn(EmergencyMbtlNumVO egmnInfo) throws Exception {
		client.insert("egmn.insertegmn" ,egmnInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("egmn.totalCount",params);
	}

}
