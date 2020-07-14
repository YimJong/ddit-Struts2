package kr.or.ddit.user.sumnail.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

public interface IFreeboardDAO {
	public List<BoardVO> freeboardList(Map<String, String> params) throws Exception;
	public String totalCounting(Map<String, String> params) throws Exception;
	public BoardVO freeboardInfo(Map<String, String> params) throws Exception;
	public void insertFreeboard(BoardVO freeboardInfo) throws Exception;
	public void insertFileitem(List<FileItemVO> fileitemList) throws Exception;
	public void updateBoardInfo(BoardVO freeboardInfo) throws Exception;
	public void deleteFreeboard(BoardVO freeboardInfo) throws Exception;
	public String replyFreeboard(BoardVO freeboardInfo) throws Exception;
	public String searchFile(String board_no) throws Exception;
	public void updateCountNo(BoardVO freeboardInfo) throws Exception;

}
