package kr.or.ddit.user.qnaboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

public interface IQnaboardService {

	public String totalCount(Map<String, String> params);
	
	public List<BoardVO> qnaboardList(Map<String, String> params);
	
	public void insertQnaboard(BoardVO boardInfo, List<FileItemVO> fileList);
	
	public BoardVO qnaboardInfo(String board_no);
	
	public List<FileItemVO> fileListInfo(String board_no);
	
	public void updateQnaboard(Map<String, String> params);
	
	public void deleteQnaboard(String board_no);
	
	public void updateBoardHit(String board_no);
	
	public void insertReplyQnaboard(BoardVO boardInfo);
	
	public void insertAdminQnaReply(BoardVO boardInfo, List<FileItemVO> fileList);
}
