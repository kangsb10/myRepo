package kr.or.ddit.dao.nongupinfileitem;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CommunityFileItemVO;
import kr.or.ddit.vo.NongupinFileItemVO;

public interface INongupinFileItemDao {
	public NongupinFileItemVO nongupinFileItemInfo(Map<String, String> params) throws Exception;
	public NongupinFileItemVO nongupinInfo(Map<String, String> params) throws Exception;
	public List<NongupinFileItemVO> nongupinList(Map<String,String> params) throws Exception;
	public void insertNongupinFileItem(List<NongupinFileItemVO> nongupinFileItemList,
			String farming_in_no)
			throws Exception ;
	public void updateNongupinInfo(NongupinFileItemVO nongupinInfo) throws Exception;
	public void deleteNongupinInfo(Map<String,String> params) throws Exception;
}
