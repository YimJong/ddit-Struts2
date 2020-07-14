package kr.or.ddit.admin.member.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;

public class MemberViewAction implements Action {
	private String mem_id;
	private MemberVO memberInfo;
	
	private String currentPage;
	
	@Override
	public String execute() throws Exception {
		IMemberService service = IMemberServiceImpl.getInstance();
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", this.mem_id);
		
		this.memberInfo = service.memberInfo(params);
		
		return SUCCESS;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public MemberVO getMemberInfo() {
		return memberInfo;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
}
