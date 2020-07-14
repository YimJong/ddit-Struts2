package kr.or.ddit.user.noticeboard.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.user.noticeboard.service.INoticeboardService;
import kr.or.ddit.user.noticeboard.service.NoticeboardServiceImpl;
import kr.or.ddit.vo.BoardVO;

public class NoticeboardListAction implements Action{
	
	private List<BoardVO> boardList;
	private String search_keyword;
	private String search_keycode;
	private String currentPage;
	private RolePaginationUtil pagingnation;
	private String totalCount;
	private String myUpdateMessage;

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
	    HttpSession session = request.getSession();
	      
        // 헤더 이름 변경..
        session.setAttribute("smallHeader", "공지사항");
        session.setAttribute("headerURI", request.getContextPath() + "/user/noticeboard/noticeboardList.do");
        session.setAttribute("smallName", "목록");
        
		if(this.currentPage == null){
			this.currentPage = "1";
		}
		
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", this.search_keyword);
		params.put("search_keycode", this.search_keycode);
		
		INoticeboardService service = NoticeboardServiceImpl.getInstance();
		
		this.totalCount = service.totalCount(params);
		
		this.pagingnation = new RolePaginationUtil(request, Integer.parseInt(this.currentPage),Integer.parseInt(this.totalCount),
												   "/user/noticeboard/noticeboardList.do",this.search_keyword, this.search_keycode);
		params.put("startCount", String.valueOf(this.pagingnation.getStartCount()));
		params.put("endCount", String.valueOf(this.pagingnation.getEndCount()));
	
		this.boardList = service.noticeboardList(params);
		return SUCCESS;
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
	
	public RolePaginationUtil getpagingnation() {
		return pagingnation;
	}


	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public void setpagingnation(RolePaginationUtil pagingnation) {
		this.pagingnation = pagingnation;
	}

	public String getTotalCount() {
		return totalCount;
	}
	
	public List<BoardVO> getBoardList() {
		return boardList;
	}

	public String getSearch_keyword() {
		return search_keyword;
	}

	public String getSearch_keycode() {
		return search_keycode;
	}

	public String getMyUpdateMessage() {
		return myUpdateMessage;
	}

	public void setMyUpdateMessage(String myUpdateMessage) {
		this.myUpdateMessage = myUpdateMessage;
	}
	
	
	
}
