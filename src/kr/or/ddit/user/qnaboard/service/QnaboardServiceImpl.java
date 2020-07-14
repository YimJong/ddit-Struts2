package kr.or.ddit.user.qnaboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.user.qnaboard.dao.IQnaboardDao;
import kr.or.ddit.user.qnaboard.dao.QnaboardDaoImpl;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

import org.apache.commons.fileupload.FileItem;

public class QnaboardServiceImpl implements IQnaboardService {
	
	private static IQnaboardService service;
	private IQnaboardDao dao;
	
	private QnaboardServiceImpl() {
		dao = QnaboardDaoImpl.getInstance();
	}
	
	public static IQnaboardService getInstance() {
		return service == null ? service = new QnaboardServiceImpl() : service;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = "";
		
		try {
			totalCount = dao.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public List<BoardVO> qnaboardList(Map<String, String> params) {
		List<BoardVO> boardList = null;
		try {
			boardList = dao.qnaboardList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public void insertQnaboard(BoardVO boardInfo, List<FileItemVO> fileList) {
		try {
			String board_no = dao.insertQnaboard(boardInfo, fileList);
			for(FileItemVO fileInfo : fileList) {
				fileInfo.setBoard_no(board_no);
			}
			
			dao.insertFileitem(fileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public BoardVO qnaboardInfo(String board_no) {
		BoardVO boardInfo = null;
		try {
			boardInfo = dao.qnaboardInfo(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardInfo;
	}

	@Override
	public List<FileItemVO> fileListInfo(String board_no) {
		List<FileItemVO> fileList = null;
		try {
			fileList = dao.fileListInfo(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileList;
	}

	@Override
	public void updateQnaboard(Map<String, String> params) {
		try {
			dao.updateQnaboard(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteQnaboard(String board_no) {
		try {
			dao.deleteFileitem(board_no);
			dao.deleteQnaboard(board_no);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	
	}

	@Override
	public void updateBoardHit(String board_no) {
		try {
			dao.updateBoardHit(board_no);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertReplyQnaboard(BoardVO boardInfo) {
		try {
			dao.insertReplyQnaboard(boardInfo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertAdminQnaReply(BoardVO boardInfo, List<FileItemVO> fileList) {
		try {
			String board_no = dao.insertAdminQnaReply(boardInfo, fileList);
			for(FileItemVO fileInfo : fileList) {
				fileInfo.setBoard_no(board_no);
			}
			dao.insertFileitem(fileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
