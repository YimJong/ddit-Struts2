package kr.or.ddit.file.controller;

import kr.or.ddit.user.noticeboard.service.INoticeboardService;
import kr.or.ddit.user.noticeboard.service.NoticeboardServiceImpl;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class NoticeboardFileAction implements Action,ModelDriven<BoardVO> {
	private BoardVO boardInfo;
	private String fileName;
	
	@Override
	public String execute() throws Exception {
		INoticeboardService service = NoticeboardServiceImpl.getInstance();
		service.insertDataboard(this.boardInfo);
		
		
		return SUCCESS;
	}
	
	@Override
	public BoardVO getModel() {
		this.boardInfo = new BoardVO();
		return this.boardInfo;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
	
	
	


}
