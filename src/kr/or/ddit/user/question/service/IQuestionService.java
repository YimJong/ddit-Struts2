package kr.or.ddit.user.question.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

public interface IQuestionService {

	public List<BoardVO> questionList(Map<String, String> params);
	
	public String totalCount(Map<String, String> params);
	
	public BoardVO boardInfo(Map<String,String> params);
	
	public void updateCountNo(BoardVO freeboardInfo);
	
	public BoardVO onlyQuestion(Map<String, String> params);
	
	public String questionTotalCounting(Map<String, String> params);
	
	
}
