package kr.or.ddit.user.freeboard.service;

import java.util.List;
import java.util.Map;







import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

public interface IFreeboardService {
	public List<BoardVO> freeboardList(Map<String, String> params);
	public String totalCounting(Map<String, String> params);
	public BoardVO freeboardInfo(Map<String, String> params);
	public void insertFreeboard(BoardVO freeboardInfo);
	public void updateBoardInfo(BoardVO freeboardInfo);
	public void deleteFreeboard(BoardVO freeboardInfo);
	public String replyFreeboard(BoardVO freeboardInfo);
	public void updateCountNo(BoardVO freeboardInfo);
}
