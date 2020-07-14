package kr.or.ddit.user.referenceRoom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.user.referenceRoom.service.IReferenceRoomService;
import kr.or.ddit.user.referenceRoom.service.ReferenceRoomServiceImpl;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.Action;

public class ReferenceRoomViewAction implements Action {
	private String board_no;
	private String rnum;
	private BoardVO referenceInfo;
	private String search_keyword;
	private String search_keycode;
	private String currentPage;

	public String execute(){
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", this.board_no);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		session.setAttribute("smallName", "상세 내용");
		
		IReferenceRoomService service = ReferenceRoomServiceImpl.getInstance();
		this.referenceInfo = service.boardInfo(params);
		service.plusHit(this.board_no);
		
		return "success";
		
		
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getBoard_no() {
		return board_no;
	}

	public BoardVO getReferenceInfo() {
		return referenceInfo;
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
