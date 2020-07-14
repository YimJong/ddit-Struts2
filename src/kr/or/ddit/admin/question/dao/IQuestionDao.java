package kr.or.ddit.admin.question.dao;

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
	
	public void deleteDataboard(BoardVO questionInfo) throws Exception;
	
	public void updateDataboard(BoardVO questionInfo) throws Exception;
	
	public void insertDataboard(BoardVO questionInfo) throws Exception;

}
