package kr.or.ddit.dao.nongupin;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.nongupinfileitem.INongupinFileItemDao;
import kr.or.ddit.vo.NongupinFileItemVO;
import kr.or.ddit.vo.NongupinVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class INongupinDaoImpl implements INongupinDao{

	@Autowired
	private SqlMapClient client;
 
	@Autowired
	private INongupinFileItemDao filedao;
	
	// 글 리스트 출력
	@Override
	public List<NongupinVO> nongupinList(Map<String, String> params)
			throws Exception {
		return client.queryForList("nongupin.nongupinList", params);
	}
	
	// 질문 리스트 출력
	@Override
	public List<NongupinVO> nongupinAnswerList(Map<String, String> params)
			throws Exception {
		return client.queryForList("nongupin.nongupinAnswerList", params);
	}

	// 글 정보 확인
	@Override
	public NongupinVO nongupinInfo(Map<String, String> params) throws Exception {
		return (NongupinVO) client.queryForObject("nongupin.nongupinInfo", params);
	}

	// 구분 리스트 ajax로 리스트 
	@Override
	public List<NongupinVO> guNM(Map<String, String> params) throws Exception {
		return client.queryForList("nongupin.guNM", params);
	}

	// 글 등록 (사진 파일)
	@Override
	public String insertnongupin(NongupinVO nongupinInfo,
			List<NongupinFileItemVO> nongupinFileItemList) throws Exception {
		
		String farming_in_no = "";
		
		farming_in_no = (String) client.insert("nongupin.nongupinIns", nongupinInfo);
		client.update("nongupin.memberseed", nongupinInfo);
		filedao.insertNongupinFileItem(nongupinFileItemList, farming_in_no);
		
		return farming_in_no;
	}
	
	@Override
	public void insertnongupinAnswer(NongupinVO nongupinInfo) throws Exception {
		client.update("nongupin.updateAnswer", nongupinInfo.getFarm_in_no());
		client.insert("nongupin.nongupinAnswerIns", nongupinInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("nongupin.totalCount", params);
	}

	@Override
	public void updateboardInfo(NongupinVO nongupinInfo) throws Exception {
		client.update("nongupin.updateNongupin", nongupinInfo);
		
	}

	@Override
	public void deleteboardInfo(Map<String, String> params) throws Exception {
		client.delete("nongupin.deleteNongupin", params);
		
	}

	@Override
	public List<NongupinVO> categoryList(Map<String, String> params)
			throws Exception {
		return client.queryForList("nongupin.categoryList", params);
	}

	@Override
	public void answerSelect(NongupinVO nongupinInfo) throws Exception {
		
		client.update("nongupin.answerSelect", nongupinInfo.getAnswer_no());
		client.update("nongupin.answerCheck", nongupinInfo.getFarm_in_no());
		client.update("nongupin.answerSeed", nongupinInfo);
	}

	@Override
	public void updateHit(Map<String, String> params) throws Exception {
		client.update("nongupin.updateHit", params);
	}

	@Override
	public int dayFarmIn()
			throws Exception {
		return (int) client.queryForObject("nongupin.dayFarmIn");
	}

	@Override
	public int dayAnswer()
			throws Exception {
		return (int) client.queryForObject("nongupin.dayAnswer");
	}

	@Override
	public int maximumFarmInNo() throws Exception {
		return (int) client.queryForObject("nongupin.maximumFarmInNo");
	}
	
}
