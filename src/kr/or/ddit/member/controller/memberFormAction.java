package kr.or.ddit.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class memberFormAction {

		
	public String execute(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
	    HttpSession session = request.getSession();
	      
	    // 헤더 이름 변경..
	    session.setAttribute("smallHeader", "회원가입");
	    session.setAttribute("headerURI", request.getContextPath() + "/user/member/memberForm.do");
	    session.setAttribute("smallName", "회원가입 양식");
	      
		return "success";
		
	}
	
}
