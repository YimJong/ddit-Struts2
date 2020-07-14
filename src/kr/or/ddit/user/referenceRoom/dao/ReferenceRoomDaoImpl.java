package kr.or.ddit.user.referenceRoom.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardVO;















import com.ibatis.sqlmap.client.SqlMapClient;

public class ReferenceRoomDaoImpl implements IReferenceRoomDao{
	private static IReferenceRoomDao dao = new ReferenceRoomDaoImpl();
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
	public String insertReferenceRoom(BoardVO referenceInfo)throws Exception {
		 return (String) client.insert("referenceRoom.insertReferenceRoom", referenceInfo);
	}

	@Override
	public BoardVO boardInfo(Map<String, String> params) throws Exception {
		return (BoardVO) client.queryForObject("referenceRoom.boardInfo",params);
	}

	@Override
	public void updateReferenceRoom(BoardVO referenceInfo) throws Exception {
		client.update("referenceRoom.updateReferenceRoom",referenceInfo);
	}

	@Override
	public void deleteReferenceRoom(Map<String, String> params)
			throws Exception {
		client.delete("referenceRoom.deleteReferenceRoom",params);
		
	}
	
	@Override
	public String insertReferenceRoomReply(BoardVO referenceInfo)
			throws Exception {
		String bo_no = null;
		
		try{
			client.startTransaction();
			
			String bo_seq;
			if("0".intern() == referenceInfo.getBoard_seq().intern()){
				bo_seq = (String) client.queryForObject("referenceRoom.incrementSeq", referenceInfo);
			}else{
				client.update("referenceRoom.updateSeq",referenceInfo);
				bo_seq = String.valueOf(Integer.parseInt(referenceInfo.getBoard_seq())+1);
			}
			
			referenceInfo.setBoard_seq(bo_seq);
			
			String bo_depth = String.valueOf(Integer.parseInt(referenceInfo.getBoard_depth())+1);
			referenceInfo.setBoard_depth(bo_depth);
			
			bo_no = (String) client.insert("referenceRoom.insertReferenceRoomReply",referenceInfo);
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return bo_no;
	}

	@Override
	public void updateCountNo(BoardVO referenceInfo) throws Exception {
		client.update("referenceRoom.updateCountNo",referenceInfo);
	}

	@Override
	public void plusHit(String board_no) throws Exception {
		client.update("referenceRoom.plusHit", board_no);
		
	}
	


	}


