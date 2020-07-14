package kr.or.ddit.admin.referenceRoom.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

import org.apache.commons.fileupload.FileItem;

public interface IReferenceRoomDao {

	public List<BoardVO> referenceRoomList(Map<String,String> params) throws Exception;
	public String referenceRoomCount(Map<String,String> params) throws Exception;
	public String insertReferenceRoom(BoardVO databoardInfo, FileItem[] items) throws Exception;
	public BoardVO boardInfo(Map<String,String> params) throws Exception;
	public void deleteReferenceRoom(Map<String, String> params) throws Exception ;
	public void updateReferenceRoom(BoardVO databoardInfo) throws Exception;
	public void updateCountNo(BoardVO databoardInfo) throws Exception;
}
