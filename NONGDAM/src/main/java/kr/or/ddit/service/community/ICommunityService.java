package kr.or.ddit.service.community;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CommunityVO;

public interface ICommunityService {

	public List<CommunityVO> communityList(Map<String, String> params) throws Exception;
	public CommunityVO communityInfo(Map<String, String> params) throws Exception;
	// 카페 등록
	public String communityIns(CommunityVO communityInfo, MultipartFile[] itemss) throws Exception;
	public void cafeBoardIns(CommunityVO communityInfo) throws Exception;
	// 중분류
	public List<CommunityVO> guMN(Map<String, String> params) throws Exception;
	// 소분류
	public List<CommunityVO> guNM(Map<String, String> params) throws Exception;
	// 카페회원가입
	public void cafeMberIns(CommunityVO communityInfo) throws Exception;
	// 카페닉네임체크
	public CommunityVO cafeNameCheck(Map<String, String> params) throws Exception;
	// 카페 게시판 리스트
	public List<CommunityVO> cafeBoList(Map<String, String> params) throws Exception;
	// 카페 게시판 게시글 리스트
	public List<CommunityVO> cafeSelList(Map<String, String> params) throws Exception;
	// 카페 게시판 이름 매칭
	public CommunityVO boardInfo(Map<String, String> params) throws Exception;
	// 글 갯수 카운트
	public int totalCount(Map<String, String> params) throws Exception;
	// 카페 갯수 카운트
	public int totalCounts(Map<String, String> params) throws Exception;
	// 게시판 글 등록
	public String insertCafeBoardInfo(CommunityVO communityInfo, 
			MultipartFile[] items) throws Exception;
	// 게시판 뷰
	public CommunityVO boardListInfo(Map<String, String> params) throws Exception;
	// 게시판 글 삭제
	public void deleteboardInfo(Map<String, String> params) throws Exception;
	// 게시판 글 수정
	public void updateboardInfo(CommunityVO communityInfo) throws Exception;
	// 게시판 삭제
	public void deletecafeboInfo(Map<String, String> params) throws Exception;
	// 게시판 수정
	public void updatecafeboInfo(CommunityVO communityInfo) throws Exception;
	// 별명 수정
	public void updatecafeNCNMInfo(CommunityVO communityInfo) throws Exception;
	// 카페 수정
	public void updatecafeInfo(CommunityVO communityInfo) throws Exception;
	// 카페 삭제
	public void deletecafeInfo(Map<String, String> params) throws Exception;
}
