package kr.or.ddit.dao.noticefileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.NoticeFileItemVO;

@Repository
public class INoticeFileItemDaoImpl implements INoticeFileItemDao {

	@Autowired
	private SqlMapClient client;
	
	@Override
	public NoticeFileItemVO noticeFileItemInfo(Map<String, String> params)
			throws Exception {
		return null;
	}

	@Override
	public void insertNoticeFileItem(List<NoticeFileItemVO> noticeFileItemList,
			String notice_no) throws Exception {
		for(NoticeFileItemVO noticefileitemInfo:noticeFileItemList){
			
		noticefileitemInfo.setNotice_no(notice_no);
		client.insert("noticefileitem.insertNoticeFileItem",noticefileitemInfo);
		}
	}

	@Override
	public void updateCultivationMethodInfo(
			NoticeFileItemVO cultivationMethodInfo) throws Exception {

	}

	@Override
	public void deleteCultivationMethodInfo(Map<String, String> params)
			throws Exception {

	}

}
