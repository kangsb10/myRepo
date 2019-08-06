package kr.or.ddit.dao.notice;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeFileItemVO;
import kr.or.ddit.vo.NoticeVO;


public interface INoticeDao {

	public NoticeVO noticeInfo(Map<String, String> params) throws Exception;
	
//	public NoticeVO upCultivationMethodInfo(Map<String, String> params) throws Exception;
	
	public List<NoticeVO> noticeList(Map<String, String> params) throws Exception;
	public String insertnoticeInfo(NoticeVO noticeInfo, 
											  List<NoticeFileItemVO> noticeFileItemList) throws Exception;
	public void deleteNoticeInfo(Map<String, String> params) throws Exception;
	public void updateNoticeInfo(NoticeVO noticeInfo) throws Exception;
	
	public int totalCount(Map<String, String> params) throws Exception;
	public void upHit(Map<String, String>params)throws Exception;
}
