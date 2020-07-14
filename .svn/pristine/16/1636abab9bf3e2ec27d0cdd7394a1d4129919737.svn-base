package kr.or.ddit.user.referenceRoom.controller;

import kr.or.ddit.user.referenceRoom.service.IReferenceRoomService;
import kr.or.ddit.user.referenceRoom.service.ReferenceRoomServiceImpl;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateReferenceRoomAction implements ModelDriven<BoardVO> {
	
	
	private BoardVO boardInfo;

	public String execute(){
		IReferenceRoomService service = ReferenceRoomServiceImpl.getInstance();
		service.updateReferenceRoom(this.boardInfo);
		return "success";
	}

	@Override
	public BoardVO getModel() {
		this.boardInfo = new BoardVO();
		return this.boardInfo;
	}
}
