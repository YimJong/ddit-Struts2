package kr.or.ddit.user.question.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BoardVO;


public class QuestionDaoImpl implements IQuestionDao{
	private static IQuestionDao dao = new QuestionDaoImpl();
	private SqlMapClient client;
	
	private QuestionDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IQuestionDao getInstance(){
		return (dao == null) ? dao = new QuestionDaoImpl() : dao;
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



}
