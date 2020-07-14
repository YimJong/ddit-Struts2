package kr.or.ddit.user.sumnail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.ModelDriven;


public class replyFreeboardAction implements ModelDriven<BoardVO>{

	private BoardVO boardInfo;

	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		session.setAttribute("smallName", "댓글 등록");
		return "success";
	}


	
	@Override
	public BoardVO getModel() {
		this.boardInfo = new BoardVO();
		return this.boardInfo;
	}

	public void setBoardInfo(BoardVO boardInfo) {
		this.boardInfo = boardInfo;
	}



	public BoardVO getBoardInfo() {
		return boardInfo;
	}
	
	
	

}
