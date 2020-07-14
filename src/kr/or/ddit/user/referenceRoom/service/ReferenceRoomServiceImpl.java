package kr.or.ddit.user.referenceRoom.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.user.referenceRoom.dao.IReferenceFileItemDao;
import kr.or.ddit.user.referenceRoom.dao.IReferenceRoomDao;
import kr.or.ddit.user.referenceRoom.dao.ReferenceFileItemDaoImpl;
import kr.or.ddit.user.referenceRoom.dao.ReferenceRoomDaoImpl;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

import org.apache.commons.fileupload.FileItem;

public class ReferenceRoomServiceImpl implements IReferenceRoomService{
	private static IReferenceRoomService service = new ReferenceRoomServiceImpl();
	private IReferenceRoomDao dao;
	private IReferenceFileItemDao fileItemDao;
	
	private ReferenceRoomServiceImpl(){
		dao = ReferenceRoomDaoImpl.getInstance();
		fileItemDao = ReferenceFileItemDaoImpl.getInstance();
	}
	
	public static IReferenceRoomService getInstance(){
		return (service == null) ? service = new ReferenceRoomServiceImpl() : service;
	}
	@Override
	public List<BoardVO> referenceRoomList(Map<String, String> params) {
		List<BoardVO> referenceRoomList = null;
		try {
			referenceRoomList = dao.referenceRoomList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return referenceRoomList;
	}

	@Override
	public String referenceRoomCount(Map<String, String> params) {
		String referenceRoomCount = null;
		try {
			referenceRoomCount = dao.referenceRoomCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return referenceRoomCount;
	}

	@Override
	public void insertReferenceRoom(BoardVO referenceInfo) {
		try {
			String board_no = dao.insertReferenceRoom(referenceInfo);
			List<FileItemVO> fileItemList = AttachFileMapper.mapper(referenceInfo);
			fileItemDao.insertFileItem(fileItemList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public BoardVO boardInfo(Map<String, String> params) {
		BoardVO boardInfo = null;
		
		try {
			boardInfo = dao.boardInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardInfo;
	}

	@Override
	public void updateReferenceRoom(BoardVO referenceInfo) {
		try {
			dao.updateReferenceRoom(referenceInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteReferenceRoom(Map<String, String> params) {
		try {
			dao.deleteReferenceRoom(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String insertReferenceRoomReply(BoardVO referenceInfo) {
		String bo_no = null;
		try {
			bo_no = dao.insertReferenceRoomReply(referenceInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bo_no;
	}

	@Override
	public void updateCountNo(BoardVO referenceInfo) {
		try {
			dao.updateCountNo(referenceInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void plusHit(String board_no) {
		try {
			dao.plusHit(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	

}
