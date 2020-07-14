package kr.or.ddit.admin.noticeboard.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.user.noticeboard.service.INoticeboardService;
import kr.or.ddit.user.noticeboard.service.NoticeboardServiceImpl;

public class DeleteNoticeboardAction{
	private String board_no;
	
	public String execute(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", this.board_no);
		
		INoticeboardService service = NoticeboardServiceImpl.getInstance();
		service.deleteDataboard(params);
		return "success";
	}
	
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	
}
