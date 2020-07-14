package kr.or.ddit.admin.member.controller;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateMemberAction implements Action, ModelDriven<MemberVO> {
	private MemberVO memberInfo;
	private String updateMessage;
	
	@Override
	public String execute() throws Exception {
		IMemberService service = IMemberServiceImpl.getInstance();
		service.updateMemberInfo(memberInfo);
		
		updateMessage = "정보가 수정되었습니다.";
		
		return SUCCESS;
	}

	@Override
	public MemberVO getModel() {
		this.memberInfo = new MemberVO();
		return this.memberInfo;
	}
	public String getUpdateMessage() {
		return updateMessage;
	}

}
