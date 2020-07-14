package kr.or.ddit.user.noticeboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.BoardVO;

public interface INoticeboardService {
	public List<BoardVO> noticeboardList(Map<String,String> params);
	public String totalCount(Map<String,String> params);
	public void  insertDataboard(BoardVO databoardInfo);
	public BoardVO boardInfo(Map<String,String> params);
	public void deleteDataboard(Map<String, String> params) ;
	public void updateDataboard(BoardVO databoardInfo);
	public void updateCountNo(BoardVO databoardInfo);
	public void plusHit(String board_no);
}
