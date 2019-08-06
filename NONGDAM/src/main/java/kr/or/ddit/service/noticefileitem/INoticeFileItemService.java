package kr.or.ddit.service.noticefileitem;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeFileItemVO;

public interface INoticeFileItemService {
	
	public NoticeFileItemVO noticeFileItemInfo(Map<String, String> params) throws Exception;
	public void insertNoticeFileItem(List<NoticeFileItemVO> noticeFileItemList, String notice_no)
			throws Exception ;
	public void updateCultivationMethodInfo(NoticeFileItemVO cultivationMethodInfo) throws Exception;
	public void deleteCultivationMethodInfo(Map<String,String> params) throws Exception;
}
