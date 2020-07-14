package kr.or.ddit.user.noticeboard.service;

import java.util.List;
import java.util.Map;




import kr.or.ddit.user.noticeboard.dao.INoticeFileItemDAO;
import kr.or.ddit.user.noticeboard.dao.NoticeFileItemDAOImpl;
import kr.or.ddit.vo.FileItemVO;

public class NoticeFileItemServiceImpl implements INoticeFileItemService{
	private static INoticeFileItemService service = new NoticeFileItemServiceImpl();
	private static INoticeFileItemDAO dao;
	
	private NoticeFileItemServiceImpl(){
		dao = NoticeFileItemDAOImpl.getInstance();
	}
	
	
	public static INoticeFileItemService getInstance(){
		return (service == null) ? service = new NoticeFileItemServiceImpl() : service;
	}
	
	
	
	
	
	@Override
	public void insertFileItem(List<FileItemVO> fileitemList) {
		
	}

	@Override
	public FileItemVO fileItemInfo(Map<String, String> params) {
		// TODO Auto-generated method stub
		FileItemVO fileitemInfo = null;
		try {
			fileitemInfo = dao.fileItemInfo(params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileitemInfo;

	}
	
	

}
