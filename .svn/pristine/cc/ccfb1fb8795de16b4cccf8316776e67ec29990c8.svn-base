package kr.or.ddit.admin.referenceRoom.service;

import java.util.List;
import java.util.Map;

import kr.or.ddir.utiles.AttachFileMapper;
import kr.or.ddit.admin.referenceRoom.dao.IReferenceFileItemDao;
import kr.or.ddit.admin.referenceRoom.dao.IReferenceRoomDao;
import kr.or.ddit.admin.referenceRoom.dao.ReferenceFileItemDaoImpl;
import kr.or.ddit.admin.referenceRoom.dao.ReferenceRoomDaoImpl;
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
	public String insertReferenceRoom(BoardVO databoardInfo, FileItem[] items) {
		String bo_no = "";
		try {
			bo_no = dao.insertReferenceRoom(databoardInfo, items);
			List<FileItemVO> fileItemList = AttachFileMapper.mapper(items, bo_no);
			fileItemDao.isertFileItem(fileItemList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bo_no;
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
	public void deleteReferenceRoom(Map<String, String> params) {
		
		try {
			dao.deleteReferenceRoom(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateReferenceRoom(BoardVO databoardInfo) {
		try {
			dao.updateReferenceRoom(databoardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateCountNo(BoardVO databoardInfo) {
		try {
			dao.updateCountNo(databoardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
