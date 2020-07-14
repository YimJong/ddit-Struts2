package kr.or.ddit.user.qnaboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.user.qnaboard.service.IQnaboardService;
import kr.or.ddit.user.qnaboard.service.QnaboardServiceImpl;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.Action;

public class QnaListAction implements Action{
	private List<BoardVO> qnaboardList;
	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	private IQnaboardService service;
	private String pagingHtml;
	private String insertMessage;
	private String updateMessage;
	private String deleteMessage;
	private String replyMessage;
	
	public QnaListAction() {
		service = QnaboardServiceImpl.getInstance();
	}

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		// 헤더 이름 변경..
		session.setAttribute("smallHeader", "Q&A게시판");
		session.setAttribute("headerURI", request.getContextPath() + "/user/qna/qnaboardList.do");
		session.setAttribute("smallName", "목록");
		
		if(currentPage == null) {
			this.currentPage = "1";
		}

		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		String totalCount = service.totalCount(params);
		
		RolePaginationUtil pagination = new RolePaginationUtil(request, 
															   Integer.parseInt(this.currentPage), 
															   Integer.parseInt(totalCount),
															   "/user/qna/qnaboardList.do", 
															   this.search_keyword, 
															   this.search_keycode);
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		this.pagingHtml = pagination.getPagingHtmls();
		
		this.qnaboardList = service.qnaboardList(params);
		
		return SUCCESS;
	}

	


	public List<BoardVO> getQnaboardList() {
		return qnaboardList;
	}
	
	public String getPagingHtml() {
		return pagingHtml;
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

	public String getSearch_keyword() {
		return search_keyword;
	}
	
	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
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

	public String getUpdateMessage() {
		return updateMessage;
	}

	public void setUpdateMessage(String updateMessage) {
		this.updateMessage = updateMessage;
	}

	public String getDeleteMessage() {
		return deleteMessage;
	}

	public void setDeleteMessage(String deleteMessage) {
		this.deleteMessage = deleteMessage;
	}

	public String getReplyMessage() {
		return replyMessage;
	}

	public void setReplyMessage(String replyMessage) {
		this.replyMessage = replyMessage;
	}
	
}
