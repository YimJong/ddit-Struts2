package kr.or.ddit.user.qnaboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class QnaboardDaoImpl implements IQnaboardDao {

	private static IQnaboardDao dao;
	private SqlMapClient client;
	
	private QnaboardDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IQnaboardDao getInstance() {
		return dao == null ? dao = new QnaboardDaoImpl() : dao;
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("qnaboard.totalCount", params);
	}

	@Override
	public List<BoardVO> qnaboardList(Map<String, String> params)
			throws Exception {
		return client.queryForList("qnaboard.qnaboardList", params);
	}

	@Override
	public String insertQnaboard(BoardVO boardInfo, List<FileItemVO> fileList)
			throws Exception {
		return (String) client.insert("qnaboard.insertQnaboard", boardInfo);
	}

	@Override
	public void insertFileitem(List<FileItemVO> fileitemList) throws Exception {
		
		try {
			client.startTransaction();
			
			for(int i = 0; i < fileitemList.size(); i++) {
				client.insert("qnaFileitem.insertFile", fileitemList.get(i));
			}
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
	}

	@Override
	public BoardVO qnaboardInfo(String board_no) throws Exception {
		return (BoardVO) client.queryForObject("qnaboard.qnaboardInfomation", board_no);
	}

	@Override
	public List<FileItemVO> fileListInfo(String board_no) throws Exception {
		return client.queryForList("qnaFileitem.fileListInfo", board_no);
	}

	@Override
	public void updateQnaboard(Map<String, String> params) throws Exception {
		client.update("qnaboard.updateQnaboard", params);
	}

	@Override
	public void deleteQnaboard(String board_no) throws Exception {
		client.update("qnaboard.deleteQnaboard", board_no);
	}

	@Override
	public void deleteFileitem(String board_no) throws Exception {
		client.update("qnaFileitem.deleteFileitem", board_no);
	}

	@Override
	public void updateBoardHit(String board_no) throws Exception {
		client.update("qnaboard.updateBoardHit", board_no);
	}

	@Override
	public void insertReplyQnaboard(BoardVO boardInfo) throws Exception {
		
		
		String board_no = "";
		try {
			client.startTransaction();
			
			String board_seq;
			
			if("0".intern() == boardInfo.getBoard_seq().intern()){
				board_seq = (String) client.queryForObject("qnaboard.incrementSeqbyQnaboard", boardInfo);
			}else{
				client.update("qnaboard.updateSeqbyQnaboard", boardInfo);
				board_seq = String.valueOf(Integer.parseInt(boardInfo.getBoard_seq()) + 1 ); 
			}
			
			boardInfo.setBoard_seq(board_seq); 
			
			String board_depth = String.valueOf(Integer.parseInt(boardInfo.getBoard_depth()) + 1); 
			boardInfo.setBoard_depth(board_depth); 
			
			client.insert("qnaboard.insertReplyQnaboard", boardInfo);
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
	}

	
	@Override
	public String insertAdminQnaReply(BoardVO boardInfo, List<FileItemVO> fileList)
			throws Exception {
		String board_no = "";
		try {
			client.startTransaction();
			
			String board_seq;
			
			if("0".intern() == boardInfo.getBoard_seq().intern()){
				board_seq = (String) client.queryForObject("qnaboard.incrementSeqbyQnaboard", boardInfo);
			}else{
				client.update("qnaboard.updateSeqbyQnaboard", boardInfo);
				board_seq = String.valueOf(Integer.parseInt(boardInfo.getBoard_seq()) + 1 ); 
			}
			
			boardInfo.setBoard_seq(board_seq); 
			
			String board_depth = String.valueOf(Integer.parseInt(boardInfo.getBoard_depth()) + 1); 
			boardInfo.setBoard_depth(board_depth); 
			
			board_no = (String) client.insert("qnaboard.insertReplyQnaboard", boardInfo);
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		
		return board_no;
	}
}
