package kr.or.ddit.user.referenceRoom.controller;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ModelDriven;

import kr.or.ddit.user.freeboard.service.FreeboardServiceImpl;
import kr.or.ddit.user.freeboard.service.IFreeboardService;
import kr.or.ddit.user.referenceRoom.service.IReferenceRoomService;
import kr.or.ddit.user.referenceRoom.service.ReferenceRoomServiceImpl;
import kr.or.ddit.vo.BoardVO;

public class DeleterReferenceRoomAction{
	
	private String board_no;
	
	public String execute(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", this.board_no);
		
		IReferenceRoomService service = ReferenceRoomServiceImpl.getInstance();
		service.deleteReferenceRoom(params);
		
		return "success";
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	
	
}
