package kr.or.ddit.admin.noticeboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.BoardVO;

public interface INoticeboardDAO {
	public List<BoardVO> noticeboardList(Map<String,String> params) throws Exception;
	public String totalCount(Map<String,String> params) throws Exception;
	public void insertDataboard(BoardVO databoardInfo ) throws Exception;
	public BoardVO boardInfo(Map<String,String> params) throws Exception;
	public void deleteDataboard(Map<String, String> params) throws Exception;
	public void updateDataboard(BoardVO databoardInfo) throws Exception;
	public void updateCountNo(BoardVO databoardInfo) throws Exception;
}
