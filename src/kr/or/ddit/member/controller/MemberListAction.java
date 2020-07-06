package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;

public class MemberListAction implements Action {
	private List<MemberVO> memberList; // EL 쓰려면 전역변수와 getter메소드 필요함. = request.setAttribute("memberList", memberList);
									   // 포워딩 처리
	
	@Override
	public String execute() throws Exception {
		IMemberService service = IMemberServiceImpl.getInstance();
		this.memberList = service.memberList(new HashMap<String, String>());
		
		return SUCCESS;
	}

	public List<MemberVO> getMemberList() {
		return memberList;
	}
}
