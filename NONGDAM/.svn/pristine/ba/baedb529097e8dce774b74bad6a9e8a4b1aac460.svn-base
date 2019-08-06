package kr.or.ddit.dao.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.MemberVO;

@Repository("iMemberDao")
public class IMemberDaoImpl implements IMemberDao {

	@Resource
	private SqlMapClient client;
	
	public IMemberDaoImpl(){
	}
	
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params)
			throws Exception {
		return client.queryForList("member.memberList", params);
	}

	@Override
	public int updateMemberInfo(MemberVO memberInfo) throws Exception {
		return client.update("member.updateMember", memberInfo);
	}

	@Override
	public int deleteMemberInfo(Map<String, String> params) throws Exception {
		return 0;
	}
	@Override
	public void insertMemberInfo(MemberVO memberInfo) throws Exception {
		client.insert("member.insertMember", memberInfo);
	}

	@Override
	public MemberVO findMemId(MemberVO memberInfo) throws Exception {
		return (MemberVO) client.queryForObject("member.findMemId", memberInfo);
	}

	@Override
	public MemberVO findMemPwd(MemberVO memberInfo) throws Exception {
		return (MemberVO) client.queryForObject("member.findMemPwd", memberInfo);
	}

	@Override
	public int pwdChange(MemberVO memberInfo) throws Exception {
		return  client.update("member.pwdChange", memberInfo);
				
		
	}

	@Override
	public AdminVO adminInfo(Map<String, String> params) throws Exception {
		return (AdminVO) client.queryForObject("member.adminInfo", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("member.totalCount", params);
	}

	@Override
	public int adminUpdateMemberInfo(MemberVO memberInfo) throws Exception {
		return (int) client.update("member.adminupdateMember", memberInfo);
	}

}
