package kr.or.ddit.user.referenceRoom.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import kr.or.ddit.admin.referenceRoom.controller.referenceRoomListAction;
import kr.or.ddit.user.question.service.IQuestionService;
import kr.or.ddit.user.question.service.QuestionServiceImpl;
import kr.or.ddit.user.referenceRoom.service.IReferenceRoomService;
import kr.or.ddit.user.referenceRoom.service.ReferenceRoomServiceImpl;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.utiles.RolePaginationUtil;
import com.opensymphony.xwork2.Action;

public class ReferenceRoomListAction implements Action{

	private List<BoardVO> referenceRoomList;
	private String search_keyword;
	private String search_keycode;
	private String currentPage;
	private RolePaginationUtil pagingUtiles;
	private String totalCount;
	private IReferenceRoomService service;
	
	public ReferenceRoomListAction(){
		service = ReferenceRoomServiceImpl.getInstance();
	}
	
	

	@Override
	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
	    HttpSession session = request.getSession();
	    session.setAttribute("smallName", "목록");
	      
	    // 헤더 이름 변경..
	    session.setAttribute("smallHeader", "자료실");
	    session.setAttribute("headerURI", request.getContextPath() + "/user/referenceRoom/referenceRoomList.do");
	    session.setAttribute("smallName", "목록");
	    
		if(this.currentPage == null){
			this.currentPage = "1";
		}
		
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", this.search_keyword);
		params.put("search_keycode", this.search_keycode);
		
		IReferenceRoomService service = ReferenceRoomServiceImpl.getInstance();
		
		this.totalCount = service.referenceRoomCount(params);
	
		this.pagingUtiles = new RolePaginationUtil(request, Integer.parseInt(this.currentPage),Integer.parseInt(this.totalCount),
				   "/user/referenceRoom/referenceRoomList.do",this.search_keyword, this.search_keycode);
		params.put("startCount", String.valueOf(pagingUtiles.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtiles.getEndCount()));
		
		
		this.referenceRoomList = service.referenceRoomList(params);
		
		return SUCCESS;
	}

	public List<BoardVO> getReferenceRoomList() {
		return referenceRoomList;
	}


	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}

	
	
	
	
	public String getCurrentPage() {
		return currentPage;
	}

	public RolePaginationUtil getPagingUtiles() {
		return pagingUtiles;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public void setPagingUtiles(RolePaginationUtil pagingUtiles) {
		this.pagingUtiles = pagingUtiles;
	}

	public String getTotalCount() {
		return totalCount;
	}



	public String getSearch_keyword() {
		return search_keyword;
	}



	public String getSearch_keycode() {
		return search_keycode;
	}

}

