package kr.or.ddit.admin.referenceRoom.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardVO;

import org.apache.commons.fileupload.FileItem;

import com.ibatis.sqlmap.client.SqlMapClient;

public class ReferenceRoomDaoImpl implements IReferenceRoomDao{
	private static ReferenceRoomDaoImpl dao = new ReferenceRoomDaoImpl();
	private SqlMapClient client;
	
	private ReferenceRoomDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IReferenceRoomDao getInstance(){
		return (dao == null) ? dao = new ReferenceRoomDaoImpl() : dao;
	}

	@Override
	public List<BoardVO> referenceRoomList(Map<String, String> params)
			throws Exception {
		return client.queryForList("referenceRoom.referenceRoomList",params);
	}

	@Override
	public String referenceRoomCount(Map<String, String> params)
			throws Exception {
		return (String) client.queryForObject("referenceRoom.referenceRoomCount",params);
	}

	@Override
	public String insertReferenceRoom(BoardVO databoardInfo, FileItem[] items)
			throws Exception {
		return (String) client.insert("referenceRoom.insertReferenceRoom",databoardInfo);
	}

	@Override
	public BoardVO boardInfo(Map<String, String> params) throws Exception {
		return (BoardVO) client.queryForObject("referenceRoom.boardInfo",params);
	}

	@Override
	public void deleteReferenceRoom(Map<String, String> params)
			throws Exception {

		client.update("referenceRoom.deleteReferenceRoom",params);
	}

	@Override
	public void updateReferenceRoom(BoardVO databoardInfo) throws Exception {
		client.delete("referenceRoom.updateReference",databoardInfo);
	}

	@Override
	public void updateCountNo(BoardVO databoardInfo) throws Exception {
		client.update("referenceRoom.updateCountNo",databoardInfo);
	}

}
