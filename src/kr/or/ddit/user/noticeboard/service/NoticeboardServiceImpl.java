package kr.or.ddit.user.noticeboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;






import kr.or.ddit.user.noticeboard.dao.INoticeFileItemDAO;
import kr.or.ddit.user.noticeboard.dao.INoticeboardDAO;
import kr.or.ddit.user.noticeboard.dao.NoticeFileItemDAOImpl;
import kr.or.ddit.user.noticeboard.dao.NoticeboardDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;


public class NoticeboardServiceImpl implements INoticeboardService{
	private static INoticeboardService service = new NoticeboardServiceImpl();
	private INoticeboardDAO noticeboardDAO;
	private INoticeFileItemDAO fileitemDAO;
	
	private NoticeboardServiceImpl(){
		noticeboardDAO = NoticeboardDAOImpl.getInstance();
		fileitemDAO = NoticeFileItemDAOImpl.getInstance();
	}
	
	public static INoticeboardService getInstance(){
		return (service == null) ? service = new NoticeboardServiceImpl() : service;
		
	}

	@Override
	public List<BoardVO> noticeboardList(Map<String, String> params) {
		List<BoardVO> noticeboardList= null;
		try {
			noticeboardList = noticeboardDAO.noticeboardList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeboardList;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		try{
			totalCount = noticeboardDAO.totalCount(params);
		}catch(Exception e){
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public void insertDataboard(BoardVO databoardInfo) {
		String bo_no = "";
		try{
			noticeboardDAO.insertDataboard(databoardInfo);
			List<FileItemVO> fileItemList = AttachFileMapper.mapper(databoardInfo);
			fileitemDAO.isertFileItem(fileItemList); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public BoardVO boardInfo(Map<String, String> params) {
		BoardVO boardInfo = null;
		
		try {
			boardInfo = noticeboardDAO.boardInfo(params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardInfo;
	}

	@Override
	public void deleteDataboard(Map<String, String> params) {
		try {
			noticeboardDAO.deleteDataboard(params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateDataboard(BoardVO databoardInfo) {
		try {
			noticeboardDAO.updateDataboard(databoardInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateCountNo(BoardVO databoardInfo) {
		try {
			noticeboardDAO.updateCountNo(databoardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void plusHit(String board_no) {
		try {
			noticeboardDAO.plusHit(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
