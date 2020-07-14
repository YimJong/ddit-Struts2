package kr.or.ddit.admin.referenceRoom.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

import org.apache.commons.fileupload.FileItem;

public interface IReferenceRoomService {
	
	public List<BoardVO> referenceRoomList(Map<String,String> params);
	public String referenceRoomCount(Map<String,String> params);
	public String insertReferenceRoom(BoardVO databoardInfo, FileItem[] items);
	public BoardVO boardInfo(Map<String,String> params);
	public void deleteReferenceRoom(Map<String, String> params) ;
	public void updateReferenceRoom(BoardVO databoardInfo);
	public void updateCountNo(BoardVO databoardInfo);
}
