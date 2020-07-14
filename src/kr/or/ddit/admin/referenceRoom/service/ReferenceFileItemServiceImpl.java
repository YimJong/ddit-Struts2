package kr.or.ddit.admin.referenceRoom.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.user.referenceRoom.dao.IReferenceFileItemDao;
import kr.or.ddit.user.referenceRoom.dao.ReferenceFileItemDaoImpl;
import kr.or.ddit.vo.FileItemVO;

public class ReferenceFileItemServiceImpl implements IReferenceFileItemService{
	private static IReferenceFileItemService service;
	private static IReferenceFileItemDao dao;
	
	private ReferenceFileItemServiceImpl(){
		dao = ReferenceFileItemDaoImpl.getInstance();
	}
	
	public static IReferenceFileItemService getInstance(){
		return (service == null) ? service = new ReferenceFileItemServiceImpl() : service;
	}

	@Override
	public void insertFileItem(List<FileItemVO> fileitemList) {
		
	}

	@Override
	public FileItemVO fileItemInfo(Map<String, String> params) {
		FileItemVO fileItemInfo = null;
		
		try {
			fileItemInfo = dao.fileItemInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileItemInfo;
	}

}
