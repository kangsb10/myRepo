package kr.or.ddit.service.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.notice.INoticeDao;
import kr.or.ddit.dao.noticefileitem.INoticeFileItemDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.NoticeFileItemVO;
import kr.or.ddit.vo.NoticeVO;

@Service
public class INoticeServiceImpl implements INoticeService {
	
	@Autowired
	private INoticeDao dao;
	
	@Autowired
	private INoticeFileItemDao noticefileitemdao;
	
	@Autowired
	private AttachFileMapper fileMapper;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception {
		return dao.noticeInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<NoticeVO> noticeList(Map<String, String> params)
			throws Exception {
		return dao.noticeList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public String insertnoticeInfo(NoticeVO noticeInfo,
									MultipartFile[] items)
														throws Exception {
		String notice_no = null;
		
		
		String temp = noticeInfo.getNotice_sj();
		String temp1 = temp.replaceAll("<", "&lt");
		String temp2 = temp1.replaceAll(">", "&gt");
		noticeInfo.setNotice_sj(temp2);
		
		List<NoticeFileItemVO> noticeFileItemList=fileMapper.NoticeFileItemmapping(items, notice_no);
		return dao.insertnoticeInfo(noticeInfo, noticeFileItemList);
	}

	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public void deleteNoticeInfo(Map<String, String> params) throws Exception {
		dao.deleteNoticeInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void updateNoticeInfo(NoticeVO noticeInfo) throws Exception {
		dao.updateNoticeInfo(noticeInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void upHit(Map<String, String> params) throws Exception {
		dao.upHit(params);
		
	}

}
