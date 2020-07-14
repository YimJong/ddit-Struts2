package kr.or.ddit.user.qnaboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class ReplyQnaboard implements Action {
	private String board_group;
	private String board_seq;
	private String board_depth; 
	private String board_no; 
	private String rnum;

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		session.setAttribute("smallName", "댓글 등록");
		
		
		return SUCCESS;
	}

	public String getBoard_group() {
		return board_group;
	}

	public String getBoard_seq() {
		return board_seq;
	}

	public String getBoard_depth() {
		return board_depth;
	}

	public String getBoard_no() {
		return board_no;
	}

	public String getRnum() {
		return rnum;
	}

	public void setBoard_group(String board_group) {
		this.board_group = board_group;
	}

	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}

	public void setBoard_depth(String board_depth) {
		this.board_depth = board_depth;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

}
