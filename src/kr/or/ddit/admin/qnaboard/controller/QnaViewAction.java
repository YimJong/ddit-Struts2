package kr.or.ddit.admin.qnaboard.controller;

import java.util.List;

import kr.or.ddit.user.qnaboard.service.IQnaboardService;
import kr.or.ddit.user.qnaboard.service.QnaboardServiceImpl;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

import com.opensymphony.xwork2.Action;

public class QnaViewAction implements Action {
	private String board_no;
	private String rnum;
	private String currentPage;
	private BoardVO boardInfo;
	private List<FileItemVO> fileInfo;
	private String search_keyword;
	private String search_keycode;
	
	@Override
	public String execute() throws Exception {
		IQnaboardService service = QnaboardServiceImpl.getInstance();
		this.boardInfo = service.qnaboardInfo(this.board_no);
		this.fileInfo = service.fileListInfo(this.board_no);
		
		return SUCCESS;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
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

	public BoardVO getBoardInfo() {
		return boardInfo;
	}

	public List<FileItemVO> getFileInfo() {
		return fileInfo;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

}
