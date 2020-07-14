package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;

public class MyInfoFormAction implements Action {
	private String mem_id;
	private MemberVO memberInfo;
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		session.setAttribute("smallHeader", "마이프로필");
		
		IMemberService service = IMemberServiceImpl.getInstance();
		Map<String, String> params = new HashMap<>();
		params.put("mem_id", mem_id);
		
		memberInfo = service.memberInfo(params);
				
		request.setAttribute("memberInfo", memberInfo);
		
		return SUCCESS;
	}

	public MemberVO getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(MemberVO memberInfo) {
		this.memberInfo = memberInfo;
	}
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


}
