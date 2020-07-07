package kr.or.ddit.member.controller;

import java.net.URLEncoder;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class InsertMemberAction implements Action, ModelDriven<MemberVO> {
	private MemberVO memberInfo;
	private String message;
	
	@Override
	public String execute() throws Exception {
		IMemberService service = IMemberServiceImpl.getInstance();
		service.insertMember(memberInfo);
		
		// this.message = URLEncoder.encode("회원가입 되었습니다!", "UTF-8");
		message = "회원가입 되었습니다!";
		
		return SUCCESS;
	}

	@Override
	public MemberVO getModel() {
		this.memberInfo = new MemberVO();
		
		return memberInfo;
	}

	public String getMessage() {
		return message;
	}

}
