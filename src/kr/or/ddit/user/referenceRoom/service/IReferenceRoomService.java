package kr.or.ddit.user.referenceRoom.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

import org.apache.commons.fileupload.FileItem;

public interface IReferenceRoomService {

	
	public List<BoardVO> referenceRoomList(Map<String,String> params);
	
	public String referenceRoomCount(Map<String,String> params);
	
	public void insertReferenceRoom(BoardVO referenceInfo);
	
	public BoardVO boardInfo(Map<String,String> params);
	
	public void updateReferenceRoom(BoardVO referenceInfo);
	
	public void deleteReferenceRoom(Map<String, String> params) ;
	
	public String insertReferenceRoomReply(BoardVO referenceInfo);
	
	public void updateCountNo(BoardVO referenceInfo);
	
	public void plusHit(String board_no);
}
