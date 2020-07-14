package kr.or.ddit.admin.noticeboard.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;



import kr.or.ddit.ibatis.factory.SqlMapClientFactory;

import kr.or.ddit.vo.FileItemVO;

public class NoticeFileItemDAOImpl implements INoticeFileItemDAO {
	private static INoticeFileItemDAO dao = new NoticeFileItemDAOImpl();
	private SqlMapClient client;
	
	private NoticeFileItemDAOImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static INoticeFileItemDAO getInstance(){
		return (dao == null) ? dao = new NoticeFileItemDAOImpl() : dao;
	}

	
	@Override
	public void isertFileItem(List<FileItemVO> fileitemList) throws Exception {
		try{
			client.startTransaction();

		for(FileItemVO fileItemInfo : fileitemList){
			client.insert("fileItem.noticeinsertFileItem", fileItemInfo);
			//client.insert("fileitem.insertnoticeboard", fileItemInfo);
		}
		client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		
	}

	@Override
	public FileItemVO fileItemInfo(Map<String, String> params) throws Exception {
		 return (FileItemVO) client.queryForObject("fileItem.fileitemInfo", params);
	}

}
