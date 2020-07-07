package kr.or.ddit.member.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;

import com.opensymphony.xwork2.Action;

public class DeleteMemberAction implements Action{
	private String mem_id; 
	private String message;
	
	@Override
	public String execute() throws Exception {
		
		IMemberService service = IMemberServiceImpl.getInstance();
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", this.mem_id);
		
		service.deleteMemberInfo(params);
		message = URLEncoder.encode("정상적으로 탈퇴되었습니다.", "UTF-8");
		
		return SUCCESS;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMessage() {
		return message;
	}
	
}
