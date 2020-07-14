package kr.or.ddit.file.controller;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

import kr.or.ddit.user.noticeboard.service.INoticeboardService;
import kr.or.ddit.user.noticeboard.service.NoticeboardServiceImpl;
import kr.or.ddit.user.referenceRoom.service.IReferenceRoomService;
import kr.or.ddit.user.referenceRoom.service.ReferenceRoomServiceImpl;
import kr.or.ddit.vo.BoardVO;

public class ReferenceRoomFileAction implements Action,ModelDriven<BoardVO>{
	private BoardVO boardInfo;
	private String fileName;
	
	@Override
	public String execute() throws Exception {
		IReferenceRoomService service = ReferenceRoomServiceImpl.getInstance();
		service.insertReferenceRoom(this. boardInfo);
		
		
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
