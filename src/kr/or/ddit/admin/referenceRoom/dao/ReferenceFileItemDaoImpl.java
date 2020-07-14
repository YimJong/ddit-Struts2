package kr.or.ddit.admin.referenceRoom.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FileItemVO;

public class ReferenceFileItemDaoImpl implements IReferenceFileItemDao{
	private static IReferenceFileItemDao dao = new ReferenceFileItemDaoImpl();
	private SqlMapClient client;
	
	private ReferenceFileItemDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IReferenceFileItemDao getInstance(){
		return(dao == null) ? dao = new ReferenceFileItemDaoImpl() : dao;
	}
	@Override
	public void isertFileItem(List<FileItemVO> fileitemList) throws Exception {
		try{
		client.startTransaction();
		
		for(FileItemVO fileItemInfo : fileitemList){
			client.insert("referenceFileItem.insertFileItem",fileItemInfo);
		}
		client.commitTransaction();
		}finally{
			client.endTransaction();
		}
	}

	@Override
	public FileItemVO fileItemInfo(Map<String, String> params) throws Exception {
		return (FileItemVO) client.queryForObject("referenceFileItem.fileItemInfo",params);
	}

}
