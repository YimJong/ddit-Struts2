package kr.or.ddit.admin.noticeboard.controller;

import com.opensymphony.xwork2.ModelDriven;

import kr.or.ddit.admin.noticeboard.service.INoticeboardService;
import kr.or.ddit.admin.noticeboard.service.NoticeboardServiceImpl;
import kr.or.ddit.vo.BoardVO;

public class UpdateNoticeboardAction implements ModelDriven<BoardVO>{
	private BoardVO boardInfo;
	
	public String execute(){
		INoticeboardService service = NoticeboardServiceImpl.getInstance();
		service.updateDataboard(this.boardInfo);
		return "success";
	}

	@Override
	public BoardVO getModel() {
		this.boardInfo = new BoardVO();
		return this.boardInfo;
	}

	
}
