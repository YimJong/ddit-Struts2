package kr.or.ddit.admin.referenceRoom.controller;

import kr.or.ddit.admin.referenceRoom.service.IReferenceRoomService;
import kr.or.ddit.admin.referenceRoom.service.ReferenceRoomServiceImpl;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateReferenceAction implements ModelDriven<BoardVO>{

	private BoardVO referenceInfo;
	
	public String execute(){
		IReferenceRoomService service = ReferenceRoomServiceImpl.getInstance();
		service.updateReferenceRoom(referenceInfo);
		
		return "success";
	}

	@Override
	public BoardVO getModel() {
		this.referenceInfo = new BoardVO();
		return this.referenceInfo;
	}

/*	public void setreferenceInfo(BoardVO referenceInfo) {
		this.referenceInfo = referenceInfo;
	}*/
}
