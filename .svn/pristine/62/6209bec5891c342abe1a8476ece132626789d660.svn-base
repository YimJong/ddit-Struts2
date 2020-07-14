package kr.or.ddit.user.freeboard.controller;

import kr.or.ddit.user.freeboard.service.FreeboardServiceImpl;
import kr.or.ddit.user.freeboard.service.IFreeboardService;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateFreeboardAction implements ModelDriven<BoardVO> {
	
	
	private BoardVO boardInfo;
	
	public String execute(){
		IFreeboardService service = FreeboardServiceImpl.getInstance();
		service.updateBoardInfo(this.boardInfo);
		return "success";
	}

	@Override
	public BoardVO getModel() {
		this.boardInfo = new BoardVO();
		return this.boardInfo;
	}
}
