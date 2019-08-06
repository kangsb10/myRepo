package kr.or.ddit.service.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.member.IMemberDao;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.MemberVO;

@Service("iMemberService")
public class IMemberServiceImpl implements IMemberService {

	@Resource
	private IMemberDao dao;
	
	public IMemberServiceImpl(){
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
		MemberVO memberInfo = null;
		memberInfo = dao.memberInfo(params);
		return memberInfo;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<MemberVO> memberList(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return dao.memberList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void insertMemberInfo(MemberVO memberInfo) throws Exception {
		try {
			dao.insertMemberInfo(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public int updateMemberInfo(MemberVO memberInfo) throws Exception {
		return dao.updateMemberInfo(memberInfo);
	}

	@Override
	public int deleteMemberInfo(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public MemberVO findMemId(MemberVO memberInfo) throws Exception {
			
		return dao.findMemId(memberInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public MemberVO findMemPwd(MemberVO memberInfo) throws Exception {
		return dao.findMemPwd(memberInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public int pwdChange(MemberVO memberInfo) throws Exception {
		return dao.pwdChange(memberInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public AdminVO adminInfo(Map<String, String> params) throws Exception {
		return dao.adminInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED,noRollbackFor={Exception.class})
	@Override
	public int adminUpdateMemberInfo(MemberVO memberInfo) throws Exception {
		return dao.adminUpdateMemberInfo(memberInfo);
	}

}
