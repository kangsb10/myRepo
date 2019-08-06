package kr.or.ddit.service.noticefileitem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.noticefileitem.INoticeFileItemDao;
import kr.or.ddit.vo.NoticeFileItemVO;

@Service
public class INoticeFileItemServiceImpl implements INoticeFileItemService {

	@Autowired
	private INoticeFileItemDao noticefileitemdao;
	
	
	@Override
	public NoticeFileItemVO noticeFileItemInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertNoticeFileItem(List<NoticeFileItemVO> noticeFileItemList,
			String notice_no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateCultivationMethodInfo(
			NoticeFileItemVO cultivationMethodInfo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCultivationMethodInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
