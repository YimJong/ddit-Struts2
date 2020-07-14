package kr.or.ddit.user.freeboard.service;

import java.util.List;
import java.util.Map;


















import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.user.freeboard.dao.FreeboardDAOImpl;
import kr.or.ddit.user.freeboard.dao.IFreeboardDAO;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

public class FreeboardServiceImpl implements IFreeboardService {

	private static IFreeboardService service = new FreeboardServiceImpl();
	private IFreeboardDAO freeboardDAO;

	
	private FreeboardServiceImpl(){
		freeboardDAO = FreeboardDAOImpl.getInstance();
		
	}
	
	public static IFreeboardService getInstance(){
		return(service == null)? service= new FreeboardServiceImpl() : service;
	}

	@Override
	public List<BoardVO> freeboardList(Map<String, String> params) {
		List<BoardVO> freeboardList = null;
		try {
			freeboardList = freeboardDAO.freeboardList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return freeboardList;
	}

	@Override
	public String totalCounting(Map<String, String> params) {
		String totalCount = "";
		try {
			totalCount =  freeboardDAO.totalCounting(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public BoardVO freeboardInfo(Map<String, String> params) {
		BoardVO freeboardInfo = null;
		try {
			freeboardInfo = freeboardDAO.freeboardInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return freeboardInfo;
	}

	@Override
	public void insertFreeboard(BoardVO freeboardInfo) {
		try {
			freeboardDAO.insertFreeboard(freeboardInfo);
			List<FileItemVO> fileItemList = AttachFileMapper.mapper(freeboardInfo);
			freeboardDAO.insertFileitem(fileItemList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateBoardInfo(BoardVO freeboardInfo) {
		try {
			freeboardDAO.updateBoardInfo(freeboardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteFreeboard(BoardVO freeboardInfo) {
		try {
			freeboardDAO.deleteFreeboard(freeboardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public String replyFreeboard(BoardVO freeboardInfo) {
		String board_no = null;
		try{
		board_no = freeboardDAO.replyFreeboard(freeboardInfo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return board_no;
	}

	@Override
	public void updateCountNo(BoardVO freeboardInfo) {
		try {
			freeboardDAO.updateCountNo(freeboardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	

	


	
}
