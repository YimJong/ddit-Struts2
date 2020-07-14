package kr.or.ddit.user.referenceRoom.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;

import kr.or.ddit.vo.BoardVO;

public class replyReferenceRoomAction implements ModelDriven<BoardVO>{
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

}
