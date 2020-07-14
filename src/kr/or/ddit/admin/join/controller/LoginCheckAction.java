package kr.or.ddit.admin.join.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;

public class LoginCheckAction implements Action {
	private String mem_id;
	private String mem_pass;
	private String message;


	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		mem_id = CryptoGenerator.decryptRSA(session, mem_id);
		mem_pass = CryptoGenerator.decryptRSA(session, mem_pass);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("mem_pass", mem_pass);
		
		MemberVO memberInfo = service.memberInfo(params);
		
		if(memberInfo == null) {
			this.message = URLEncoder.encode("아이디 또는 비밀번호가 틀렸습니다.", "UTF-8");
			return "loginForm";
		} else if(memberInfo != null && !memberInfo.getMem_id().equals("admin")) {
			this.message = URLEncoder.encode("관리자 전용 페이지 입니다. 관리자 아이디로 로그인 해주세요.", "UTF-8");
			return "loginForm";
		} else {
			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
			return "success";
		}
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	
	public String getMessage() {
		return message;
	}
}
