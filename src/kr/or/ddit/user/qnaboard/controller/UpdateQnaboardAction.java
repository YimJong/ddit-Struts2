package kr.or.ddit.user.qnaboard.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.user.qnaboard.service.IQnaboardService;
import kr.or.ddit.user.qnaboard.service.QnaboardServiceImpl;

import com.opensymphony.xwork2.Action;

public class UpdateQnaboardAction implements Action {
	private String board_no;
	private String board_title;
	private String board_content;
	private String updateMessage;
	
	@Override
	public String execute() throws Exception {
		IQnaboardService service = QnaboardServiceImpl.getInstance();
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", board_no);
		params.put("board_title", board_title);
		params.put("board_content", board_content);
		
		service.updateQnaboard(params);
		
		updateMessage = "수정되었습니다.";
		
		return SUCCESS;
	}

	public String getUpdateMessage() {
		return updateMessage;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

}
