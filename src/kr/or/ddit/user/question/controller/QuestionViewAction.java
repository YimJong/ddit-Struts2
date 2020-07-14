package kr.or.ddit.user.question.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.user.question.service.IQuestionService;
import kr.or.ddit.user.question.service.QuestionServiceImpl;
import kr.or.ddit.vo.BoardVO;

public class QuestionViewAction {
	private String board_no;
	private String rnum;
	
	private String currentPage;
	private BoardVO questionInfo;
	private String questionList;
	private String search_keyword;
	private String search_keycode;
	
	public String getSearch_keycode() {
		return search_keycode;
	}



	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}



	public String execute() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", this.board_no);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		session.setAttribute("smallName", "상세 내용");
		
		IQuestionService service = QuestionServiceImpl.getInstance();
		this.questionInfo = service.boardInfo(params);
		
				
		return "success";
	}
	
	

	public BoardVO getQuestionInfo() {
		return questionInfo;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	
	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getBoard_no() {
		return board_no;
	}
	
	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	
	public String getQuestionList() {
		return questionList;
	}
	
	public void setQuestionList(String questionList) {
		this.questionList = questionList;
	}
	
	public String getSearch_keyword() {
		return search_keyword;
	}
	
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
}
