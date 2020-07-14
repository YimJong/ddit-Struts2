package kr.or.ddit.admin.question.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.admin.question.service.IQuestionService;
import kr.or.ddit.admin.question.service.QuestionServiceImpl;
import kr.or.ddit.vo.BoardVO;

public class QuestionViewAction {
	private String questionList;
	private String board_no;
	private String rnum;
	private String currentPage;
	private BoardVO questionInfo;
	private String search_keyword;
	
	public String getQuestionList() {
		return questionList;
	}

	public BoardVO getQuestionInfo() {
		return questionInfo;
	}

	private String search_keycode;
	
	public String execute() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", this.board_no);
		
		IQuestionService service = QuestionServiceImpl.getInstance();
		this.questionInfo = service.boardInfo(params);
				
		return "success";
	}
	
	public BoardVO getquestionInfo() {
		return questionInfo;
	}

	public void setquestionList(String questionList) {
		this.questionList = questionList;
	}
	
	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getquestionList() {
		return questionList;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getSearch_keyword() {
		return search_keyword;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public String getSearch_keycode() {
		return search_keycode;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	
	
}
