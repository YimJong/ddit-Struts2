package kr.or.ddit.admin.question.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.admin.question.service.IQuestionService;
import kr.or.ddit.admin.question.service.QuestionServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.BoardVO;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class QuestionListAction implements Action{
	public List<BoardVO> questionList;
	public String currentPage;
	public String search_keyword;
	public String search_keycode;
	public String page;
	private IQuestionService service;
	private String updateMessage;
	private String insertMessage;
	private String deleteMessage;
	
	
	public QuestionListAction(){
		service = QuestionServiceImpl.getInstance();
	}
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest request =  ServletActionContext.getRequest();
		
		if(currentPage == null){
			currentPage = "1";
		}
		
		//검색어 한글로 바꿔주기 
		Map<String, String> params = new HashMap<String,String>();
		params.put("search_keyword", this.search_keyword);
		params.put("search_keycode", this.search_keycode);
		
		
		String totalCount = service.totalCount(params); //총 게시물 수 가져오기
		
		RolePaginationUtil pagination = new RolePaginationUtil(request, 
															   Integer.parseInt(currentPage),
															   Integer.parseInt(totalCount),
															   "/admin/question/questionList.do",
															   this.search_keyword,
															   this.search_keycode);
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		
		page = pagination.getPagingHtmls();
		this.questionList = service.questionList(params);
		
		return SUCCESS;
	}

	
	
	public List<BoardVO> getQuestionList() {
		return questionList;
	}


	public String getPage() {
		return page;
	}
	
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	
	public String getCurrentPage() {
		return currentPage;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}

	public String getSearch_keyword() {
		return search_keyword;
	}

	public String getSearch_keycode() {
		return search_keycode;
	}

	public String getInsertMessage() {
		return insertMessage;
	}

	public void setInsertMessage(String insertMessage) {
		this.insertMessage = insertMessage;
	}

	public String getDeleteMessage() {
		return deleteMessage;
	}

	public void setDeleteMessage(String deleteMessage) {
		this.deleteMessage = deleteMessage;
	}

	public String getUpdateMessage() {
		return updateMessage;
	}

	public void setUpdateMessage(String updateMessage) {
		this.updateMessage = updateMessage;
	}

	
}
