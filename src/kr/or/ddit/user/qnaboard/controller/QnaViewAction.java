package kr.or.ddit.user.qnaboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.user.qnaboard.service.IQnaboardService;
import kr.or.ddit.user.qnaboard.service.QnaboardServiceImpl;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

import com.opensymphony.xwork2.Action;

public class QnaViewAction implements Action{

	private String board_no;
	private String rnum;

	private BoardVO boardInfo;
	private List<FileItemVO> fileInfo;
	private String search_keyword;
	private String search_keycode;
	private String currentPage;

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		session.setAttribute("smallName", "상세 내용");
		
		IQnaboardService service = QnaboardServiceImpl.getInstance();
		this.boardInfo = service.qnaboardInfo(board_no);
		this.fileInfo = service.fileListInfo(board_no);
		
		
		
		return SUCCESS;
	}

	
	
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	
	public String getRnum() {
		return rnum;
	}

	public BoardVO getBoardInfo() {
		return boardInfo;
	}

	public List<FileItemVO> getFileInfo() {
		return fileInfo;
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
