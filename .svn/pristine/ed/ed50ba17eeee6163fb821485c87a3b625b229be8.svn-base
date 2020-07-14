/*package kr.or.ddit.user.sumnail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.user.sumnail.service.FreeboardServiceImpl;
import kr.or.ddit.user.sumnail.service.IFreeboardService;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.Action;

public class FreeboardListAction implements Action {

	private List<BoardVO> freeboardList;
	private String search_keyword;
	private String search_keycode;
	
	private String currentPage;
	private RolePaginationUtil pagingUtiles;
	private String totalCount;
	
	
	@Override
	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
	      HttpSession session = request.getSession();
	      
	      // 헤더 이름 변경..
	      session.setAttribute("smallHeader", "자유게시판");
		
		
	
		
		if(this.currentPage == null){
			this.currentPage = "1";
		}
		
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", this.search_keyword);
		params.put("search_keycode", this.search_keycode);
		
		IFreeboardService service = FreeboardServiceImpl.getInstance();
		
		this.totalCount = service.totalCounting(params);
		
		this.pagingUtiles = new RolePaginationUtil(request, Integer.parseInt(this.currentPage), Integer.parseInt(this.totalCount));
		
		params.put("startCount", String.valueOf(pagingUtiles.getStartCouont()));
		params.put("endCount", String.valueOf(pagingUtiles.getEndCouont()));
		
		
		
		this.freeboardList = service.freeboardList(params);
		
		return SUCCESS;
	}

	public List<BoardVO> getFreeboardList() {
		return freeboardList;
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
	
	
	
	
	

}*/


package kr.or.ddit.user.sumnail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.user.sumnail.service.FreeboardServiceImpl;
import kr.or.ddit.user.sumnail.service.IFreeboardService;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.Action;

public class FreeboardListAction implements Action {

	private List<BoardVO> freeboardList;
	private String search_keyword;
	private String search_keycode;
	private String option;
	
	private String currentPage;
	private RolePaginationUtil pagingUtiles;
	private String totalCount;
	
	
	@Override
	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
	    HttpSession session = request.getSession();
	      
	      // 헤더 이름 변경..
	    session.setAttribute("smallHeader", "썸네일게시판");
	    session.setAttribute("headerURI", request.getContextPath() + "/user/sumnail/sumnailList.do");
	    session.setAttribute("smallName", "목록");
		
	
		
		if(this.currentPage == null){
			this.currentPage = "1";
		}
		
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", this.search_keyword);
		params.put("search_keycode", this.search_keycode);
		
		IFreeboardService service = FreeboardServiceImpl.getInstance();
		
		this.totalCount = service.totalCounting(params);
		
		//this.pagingUtiles = new RolePaginationUtil(request, Integer.parseInt(this.currentPage), Integer.parseInt(this.totalCount));
		
		this.pagingUtiles = new RolePaginationUtil(request, 
				   Integer.parseInt(this.currentPage), 
				   Integer.parseInt(this.totalCount),
				   "/user/sumnail/sumnailList.do", 
				   this.search_keyword, this.search_keycode);
		
		params.put("startCount", String.valueOf(this.pagingUtiles.getStartCount()));
		params.put("endCount", String.valueOf(this.pagingUtiles.getEndCount()));
		
		
		
		this.freeboardList = service.freeboardList(params);
		
		return SUCCESS;
	}

	
	public String getSearch_keyword() {
		return search_keyword;
	}


	public String getSearch_keycode() {
		return search_keycode;
	}


	public String getOption() {
		return option;
	}


	public void setOption(String option) {
		this.option = option;
	}


	public List<BoardVO> getFreeboardList() {
		return freeboardList;
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
	
	
	
	
	

}
