package kr.or.ddit.user.qnaboard.controller;

import kr.or.ddit.user.qnaboard.service.QnaboardServiceImpl;

import kr.or.ddit.user.qnaboard.service.IQnaboardService;

import com.opensymphony.xwork2.Action;

public class DeleteQnaboardAction implements Action {
	private String board_group;
	private String deleteMessage;

	@Override
	public String execute() throws Exception {
		IQnaboardService service = QnaboardServiceImpl.getInstance();
		service.deleteQnaboard(this.board_group);
		
		this.deleteMessage = "삭제되었습니다.";
		
		return SUCCESS;
	}

	public void setBoard_group(String board_group) {
		this.board_group = board_group;
	}

	public String getDeleteMessage() {
		return deleteMessage;
	}
}
