package kr.or.ddit.user.sumnail.dao;

import java.util.List;
import java.util.Map;




















import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FileItemVO;

import com.ibatis.sqlmap.client.SqlMapClient;


public class FreeboardDAOImpl implements IFreeboardDAO {

	private SqlMapClient client;
	private static IFreeboardDAO dao = new FreeboardDAOImpl();
	
	private FreeboardDAOImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreeboardDAO getInstance(){
		return (dao == null) ? dao = new FreeboardDAOImpl() : dao;
	}
	
	
	
	@Override
	public List<BoardVO> freeboardList(Map<String, String> params) throws Exception{
		return client.queryForList("sumnail.freeboardList", params);
	}

	@Override
	public String totalCounting(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("sumnail.totalCounting", params);
	}

	@Override
	public BoardVO freeboardInfo(Map<String, String> params) throws Exception {
		return (BoardVO) client.queryForObject("sumnail.freeboardInfo", params);
	}

	@Override
	public void insertFreeboard(BoardVO freeboardInfo) throws Exception {
		 client.insert("sumnail.insertFreeboard", freeboardInfo);
	}

	@Override
	public void insertFileitem(List<FileItemVO> fileitemList) throws Exception {
		try{
			client.startTransaction();
			
			for(FileItemVO fileitemInfo : fileitemList){
				client.insert("fileItem.insertSumnailFileitem",fileitemInfo);
			}
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		
	}

	@Override
	public void updateBoardInfo(BoardVO freeboardInfo) throws Exception {
		client.update("sumnail.updateBoardInfo", freeboardInfo);
	}

	@Override
	public void deleteFreeboard(BoardVO freeboardInfo) throws Exception {
		client.update("sumnail.deleteFreeboard",freeboardInfo);
		
	}

	@Override
	public String replyFreeboard(BoardVO freeboardInfo) throws Exception {
		String board_no = "";
		try {
			client.startTransaction();
			
			String board_seq;
			
			// 내 부모가 댓글인지 루트 글인지 구분해야함
			
			if("0".intern() == freeboardInfo.getBoard_seq().intern()){ // 부모가 root 글이다.
				// 1 증가 시켜야함 왜 냐하면 부모이니까 나는 무조건 댓글임
				board_seq = (String) client.queryForObject("sumnail.incrementSeqbyFreeboard", freeboardInfo);
			}else{
				// 부모가 루트 글이 아니면 댓글이 부모인데 이럴 경우에는 자신(댓글)이 끼어들면 나보다 늦게 오는 bo_seq를 전부 1씩 증가 시켜줘야 한다.
				client.update("sumnail.updateSeqbyFreeboard", freeboardInfo); // 여기서는 사이에 끼어 드는 것이기 때문에 bo_seq보다 큰 애들을  증가 시키는 것이다.
				board_seq = String.valueOf(Integer.parseInt(freeboardInfo.getBoard_seq()) + 1 ); // 부모의 bo_seq를 가져온 것이다. 여기에 +1 해주면 지금 들어가는 댓글의 bo_seq
			}
			
			freeboardInfo.setBoard_seq(board_seq); // 여기에 게시판 번호를 넣어준다. // 여기가 자신의 bo_seq
			
			String board_depth = String.valueOf(Integer.parseInt(freeboardInfo.getBoard_depth()) + 1); // 부모의 댑스 : freeboardInfo.getBo_depth() 여기에 +1을 해줘야 댑스가 늘어난다.
			freeboardInfo.setBoard_depth(board_depth); // bo_depth 는 바꿀 필요 없이 그대로 쓰면 된다.
			
			board_no = (String) client.insert("sumnail.replyFreeboard", freeboardInfo);
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		
		return board_no;
	}

	@Override
	public String searchFile(String board_no) throws Exception {
		return (String) client.queryForObject("sumnail.searchFile",board_no);
	}

	@Override
	public void updateCountNo(BoardVO freeboardInfo) throws Exception {
		client.update("sumnail.updateCountNo",freeboardInfo);
		
	}


	





	
	

}
