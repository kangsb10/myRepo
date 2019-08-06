package kr.or.ddit.dao.sfms;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FarmVO;
import kr.or.ddit.vo.SensorVO;

public interface ISfmsDao {
	public List<FarmVO> FarmList(Map<String , String> params) throws Exception;
	public FarmVO idCheck(Map<String , String>params) throws Exception;
	public String searchCode(Map<String, String>params)throws Exception;
	public void insertFarm(FarmVO farmInfo)throws Exception;
	public FarmVO farmInfo(Map<String, String>params)throws Exception;
	public int updateFarm(FarmVO farmInfo)throws Exception;
	public void deleteFarm(Map<String , String>params)throws Exception;
}
