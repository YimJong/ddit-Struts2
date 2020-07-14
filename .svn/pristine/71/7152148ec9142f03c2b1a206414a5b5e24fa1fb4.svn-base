package kr.or.ddit.user.qnaboard.controller;

import kr.or.ddit.user.qnaboard.service.IQnaboardService;
import kr.or.ddit.user.qnaboard.service.QnaboardServiceImpl;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class InsertReplyQnaboard implements Action, ModelDriven<BoardVO> {
	private BoardVO boardInfo;
	private String replyMessage;
	
	@Override
	public String execute() throws Exception {
		IQnaboardService service = QnaboardServiceImpl.getInstance();
		service.insertReplyQnaboard(this.boardInfo);
		
		replyMessage = "댓글을 등록했습니다.";
		
		return SUCCESS;
	}
	
	@Override
	public BoardVO getModel() {
		boardInfo = new BoardVO();
		return this.boardInfo;
	}

	public String getReplyMessage() {
		return replyMessage;
	}

}
