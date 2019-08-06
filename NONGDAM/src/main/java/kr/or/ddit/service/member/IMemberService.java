package kr.or.ddit.service.member;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.MemberVO;

public interface IMemberService {

	public MemberVO memberInfo(Map<String, String> params) throws Exception;
	public List<MemberVO> memberList(Map<String, String> params) throws Exception;
	public void insertMemberInfo(MemberVO memberInfo) throws Exception;
	public int updateMemberInfo(MemberVO memberInfo) throws Exception;
	public int deleteMemberInfo(Map<String, String> params) throws Exception;
	public MemberVO findMemId(MemberVO memberInfo) throws Exception;
	public MemberVO findMemPwd(MemberVO memberInfo) throws Exception;
	public int pwdChange(MemberVO memberInfo) throws Exception;
	public AdminVO adminInfo(Map<String, String>params)throws Exception;
	public int totalCount(Map<String, String>params)throws Exception;
	public int adminUpdateMemberInfo(MemberVO memberInfo) throws Exception;
}
