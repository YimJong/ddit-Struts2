package kr.or.ddit.user.question.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

public interface IQuestionDao {

	public List<BoardVO> questionList(Map<String, String> params) throws Exception;
	
	public String totalCount(Map<String, String> params) throws Exception;
	
	public BoardVO boardInfo(Map<String,String> params) throws Exception;
	
	public void updateCountNo(BoardVO freeboardInfo) throws Exception;
	
	public BoardVO onlyQuestion(Map<String, String> params) throws Exception;
	
	public String questionTotalCounting(Map<String, String> params) throws Exception;
}
