package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberViewAction {

	// /StrutsToddler/user/member/memberView.do?mem_id=a001
	private String mem_id; // 전역변수와 Setter만 있으면 값이 주입됨.(= request.getParameter)
	private MemberVO memberInfo; // 전역변수와 getter (= setAttribute)
	
	public String memberView() { //  액션 메소드 변경을 설정파일에 알려줘야 함. Action의 method 속성
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", this.mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		this.memberInfo = service.memberInfo(params);
		
		return "success";
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public MemberVO getMemberInfo() {
		return memberInfo;
	}
}
