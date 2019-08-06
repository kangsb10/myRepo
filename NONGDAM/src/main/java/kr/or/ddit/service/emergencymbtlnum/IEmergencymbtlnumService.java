package kr.or.ddit.service.emergencymbtlnum;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmergencyMbtlNumVO;

public interface IEmergencymbtlnumService {
	public List<EmergencyMbtlNumVO>embergencymbtlnumList(Map<String, String>params)throws Exception;
	public void insertegmn(EmergencyMbtlNumVO egmnInfo)throws Exception;
	public int totalCount(Map<String, String>params)throws Exception;
}
