package kr.or.ddit.dao.notice;

import java.util.List;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dao.noticefileitem.INoticeFileItemDaoImpl;
import kr.or.ddit.vo.NoticeFileItemVO;
import kr.or.ddit.vo.NoticeVO;

@Repository
public class INoticeDaoImpl implements INoticeDao {

	@Autowired
	private SqlMapClient client;
	
	@Autowired
	private INoticeFileItemDaoImpl FileitemDao;
	
	@Override
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception {
		return (NoticeVO) this.client.queryForObject("notice.noticeInfo", params);
	}

	@Override
	public List<NoticeVO> noticeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("notice.noticeList", params);
	}
	
	@Override
	public String insertnoticeInfo(NoticeVO noticeInfo,
								   List<NoticeFileItemVO> noticeFileItemList)
								   throws Exception {
		String notice_no=null;
		notice_no=(String) this.client.insert("notice.insertNotice", noticeInfo);
		
		FileitemDao.insertNoticeFileItem(noticeFileItemList, notice_no);
		
		return notice_no;
	}

	@Override
	public void deleteNoticeInfo(Map<String, String> params) throws Exception {
		this.client.update("notice.deletenotice", params);
	}

	@Override
	public void updateNoticeInfo(NoticeVO noticeInfo) throws Exception {
		this.client.update("notice.updatenotice",noticeInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) this.client.queryForObject("notice.totalCount",params);
	}

	@Override
	public void upHit(Map<String, String> params) throws Exception {
		client.update("notice.updateHit", params);
	}

}
