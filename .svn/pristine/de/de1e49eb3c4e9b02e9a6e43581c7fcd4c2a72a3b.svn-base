package kr.or.ddit.member.controller;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateMyInfoAction implements Action, ModelDriven<MemberVO>{
	private MemberVO memberInfo;
	private String myUpdateMessage;
	
	@Override
	public String execute() throws Exception {
		IMemberService service = IMemberServiceImpl.getInstance();
		service.updateMemberInfo(memberInfo);
		
		myUpdateMessage = "개인정보를 수정했습니다.";
		
		return SUCCESS;
	}

	@Override
	public MemberVO getModel() {
		memberInfo = new MemberVO();
		return memberInfo;
	}

	public MemberVO getMemberInfo() {
		return memberInfo;
	}

	public String getMyUpdateMessage() {
		return myUpdateMessage;
	}

}
