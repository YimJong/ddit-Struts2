package kr.or.ddit.join.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class LogoutAction implements Action {
	private String message;

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().invalidate();
		
		this.message = URLEncoder.encode("로그아웃 되었습니다.", "UTF-8");
		
		return SUCCESS;
	}
	
	public String getMessage() {
		return message;
	}
}
