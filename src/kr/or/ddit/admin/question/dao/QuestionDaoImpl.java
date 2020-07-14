package kr.or.ddit.admin.question.dao;

import java.util.List;
import java.util.Map;


import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardVO;

public class QuestionDaoImpl implements IQuestionDao{
	SqlMapClient client = SqlMapClientFactory.getSqlMapClient();
	private static QuestionDaoImpl dao;
	
	public static QuestionDaoImpl getInstance(){
		if(dao == null){
			dao = new QuestionDaoImpl();
		}
		return dao;
	}

	@Override
	public List<BoardVO> questionList(Map<String, String> params) throws Exception {
		return client.queryForList("question.questionList",params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("question.totalCount",params);
	}

	@Override
	public BoardVO boardInfo(Map<String, String> params) throws Exception {
		return (BoardVO) client.queryForObject("question.boardInfo",params);
	}

	@Override
	public void updateCountNo(BoardVO freeboardInfo) throws Exception {
		client.update("question.updateCountNo",freeboardInfo);
	}

	@Override
	public BoardVO onlyQuestion(Map<String, String> params) throws Exception {
		return (BoardVO) client.queryForObject("question.onlyQuestion",params);
	}

	@Override
	public String questionTotalCounting(Map<String, String> params)
			throws Exception {
		return (String) client.queryForObject("question.questionTotalCounting",params);
	}




	@Override
	public void deleteDataboard(BoardVO questionInfo) throws Exception {
		client.update("question.deleteDataboard",questionInfo);
	}

	@Override
	public void updateDataboard(BoardVO questionInfo) throws Exception {
		client.update("question.updateDataboard", questionInfo);
	}

	@Override
	public void insertDataboard(BoardVO questionInfo) throws Exception {
		client.insert("question.insertDataboard",questionInfo);
	}

}
