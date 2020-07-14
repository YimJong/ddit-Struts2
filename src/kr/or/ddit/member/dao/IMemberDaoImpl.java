package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;

public class IMemberDaoImpl implements IMemberDAO {
	private static IMemberDAO dao = new IMemberDaoImpl();
	private SqlMapClient client;
	
	private IMemberDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDAO getInstance(){
		return (dao == null) ? dao = new IMemberDaoImpl() : dao;
	}
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return (MemberVO)client.queryForObject("member.memberInfo", params);
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws Exception {
		return client.queryForList("member.memberList", params);
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params) throws Exception{
		// TODO Auto-generated method stub
		client.update("member.deleteMember", params);
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws Exception {
		//update쿼리
		//테이블 생성 
		//프로시저, 평션을 작성 및 호출 
		//client.update(arg0)
		client.update("member.updateMember", memberInfo);
		
		
	}

	@Override
	public void insertMemberInfo(MemberVO memberInfo) throws Exception{
		client.insert("member.insertMember", memberInfo);
		
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("member.totalCount", params);
	}

	@Override
	public String adminTotalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("member.adminTotalCount", params);
	}

	@Override
	public List<MemberVO> adminMemberList(Map<String, String> params)
			throws Exception {
		return client.queryForList("member.adminMemberList", params);
	}


}
