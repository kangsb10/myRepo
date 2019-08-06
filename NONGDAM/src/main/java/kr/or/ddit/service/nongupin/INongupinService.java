package kr.or.ddit.service.nongupin;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.NongupinVO;

public interface INongupinService {

	public List<NongupinVO> nongupinList(Map<String, String> params) throws Exception;
	public List<NongupinVO> nongupinAnswerList(Map<String, String> params) throws Exception;
	public NongupinVO nongupinInfo(Map<String, String> params) throws Exception;
	// 분류
	public List<NongupinVO> guNM(Map<String, String> params) throws Exception;
	// 글등록
	public String insertnongupin(NongupinVO nongupinInfo,
				MultipartFile[] items) throws Exception;
	// 답글 등록
	public void insertnongupinAnswer(NongupinVO nongupinInfo) throws Exception;
	// 글 갯수 카운트
	public int totalCount(Map<String, String> params) throws Exception;
	public void updateboardInfo(NongupinVO nongupinInfo) throws Exception;
	public void deleteboardInfo(Map<String, String> params) throws Exception;
	// 분류체크리스트
	public List<NongupinVO> categoryList(Map<String,String> params) throws Exception;
	// 답변채택
	public void answerSelect(NongupinVO nongupinInfo) throws Exception;
	public void updateHit(Map<String,String> params ) throws Exception;
	// 일일 질문 수 
	public int dayFarmIn() throws Exception;
	// 일일 답변 수
	public int dayAnswer() throws Exception;
	
	
	//강새벽추가
	public int maximumFarmInNo() throws Exception;
}
