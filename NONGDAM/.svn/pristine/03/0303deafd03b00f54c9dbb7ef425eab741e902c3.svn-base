package kr.or.ddit.service.notice;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.NoticeFileItemVO;
import kr.or.ddit.vo.NoticeVO;

public interface INoticeService {
	
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception;
	
//	public NoticeVO upCultivationMethodInfo(Map<String, String> params) throws Exception;
	
	public List<NoticeVO> noticeList(Map<String, String> params) throws Exception;
	public String insertnoticeInfo(NoticeVO noticeInfo, 
			MultipartFile[] items ) throws Exception;
	public void deleteNoticeInfo(Map<String, String> params) throws Exception;
	public void updateNoticeInfo(NoticeVO noticeInfo) throws Exception;
	
	public int totalCount(Map<String, String> params) throws Exception;
	public void upHit(Map<String, String>params)throws Exception;
	
}
