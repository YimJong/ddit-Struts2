package kr.or.ddit.user.qnaboard.controller;

import kr.or.ddit.user.qnaboard.service.IQnaboardService;
import kr.or.ddit.user.qnaboard.service.QnaboardServiceImpl;

public class QnaboardHitPlusAction {
	private String board_no;
	
	public void execute() {
		IQnaboardService service = QnaboardServiceImpl.getInstance();
		service.updateBoardHit(this.board_no);
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
}
