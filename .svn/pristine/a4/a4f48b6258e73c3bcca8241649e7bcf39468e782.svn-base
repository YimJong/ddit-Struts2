package kr.or.ddit.user.referenceRoom.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

import org.apache.commons.fileupload.FileItem;

public interface IReferenceRoomDao {
	
	public List<BoardVO> referenceRoomList(Map<String,String> params) throws Exception;
	
	public String referenceRoomCount(Map<String,String> params) throws Exception;
	
	public String insertReferenceRoom(BoardVO referenceInfo) throws Exception;
	
	public BoardVO boardInfo(Map<String,String> params) throws Exception;
	
	public void updateReferenceRoom(BoardVO referenceInfo) throws Exception;
	
	public void deleteReferenceRoom(Map<String, String> params) throws Exception;
	
	public String insertReferenceRoomReply(BoardVO referenceInfo) throws Exception;
	
	public void updateCountNo(BoardVO referenceInfo) throws Exception;

	public void plusHit(String board_no) throws Exception;
}
