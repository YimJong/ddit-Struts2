package kr.or.ddit.user.sumnail.controller;

import kr.or.ddit.user.sumnail.service.FreeboardServiceImpl;
import kr.or.ddit.user.sumnail.service.IFreeboardService;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.ModelDriven;

public class replyFreeboardSubmitAction implements ModelDriven<BoardVO> {
	
	private BoardVO boardInfo;

	public String execute(){
		IFreeboardService service = FreeboardServiceImpl.getInstance();
		service.replyFreeboard(boardInfo);
		
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
