package kr.or.ddit.user.referenceRoom.controller;

import com.opensymphony.xwork2.ModelDriven;

import kr.or.ddit.user.referenceRoom.service.IReferenceRoomService;
import kr.or.ddit.user.referenceRoom.service.ReferenceRoomServiceImpl;
import kr.or.ddit.vo.BoardVO;

public class replyReferenceRoomSubmitAction implements ModelDriven<BoardVO> {
	private BoardVO boardInfo;

	public String execute(){
		IReferenceRoomService service = ReferenceRoomServiceImpl.getInstance();
		service.insertReferenceRoomReply(boardInfo);
		
		return "success";
	}

	@Override
	public BoardVO getModel() {
		this.boardInfo = new BoardVO();
		return this.boardInfo;
	}
	
	public void setBoardInfo(BoardVO boardInfo) {
		this.boardInfo = boardInfo;
	}
}
