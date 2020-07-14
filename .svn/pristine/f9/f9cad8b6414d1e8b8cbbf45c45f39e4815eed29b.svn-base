package kr.or.ddit.admin.question.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.admin.question.dao.IQuestionDao;
import kr.or.ddit.admin.question.dao.QuestionDaoImpl;
import kr.or.ddit.vo.BoardVO;

public class QuestionServiceImpl implements IQuestionService{

	private IQuestionDao dao;
	private static QuestionServiceImpl service;
	
	private QuestionServiceImpl(){
		dao = QuestionDaoImpl.getInstance();
	}
	
	public static QuestionServiceImpl getInstance(){
		if(service==null){
			service = new QuestionServiceImpl();
		}
		return service;
	}
	
	
	@Override
	public List<BoardVO> questionList(Map<String, String> params) {
		List<BoardVO> questionList = null;
		try {
			questionList = dao.questionList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return questionList;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = "";
		
		try {
			totalCount = dao.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public BoardVO boardInfo(Map<String, String> params) {
		BoardVO boardInfo = null;
		
		try {
			boardInfo = dao.boardInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardInfo;
	}

	@Override
	public void updateCountNo(BoardVO freeboardInfo) {
		try {
			dao.updateCountNo(freeboardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public BoardVO onlyQuestion(Map<String, String> params) {
		try {
			return dao.onlyQuestion(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String questionTotalCounting(Map<String, String> params) {
		String totalCount = "";
		
		try {
			totalCount = dao.questionTotalCounting(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}



	@Override
	public void deleteDataboard(BoardVO questionInfo) {
		try {
			dao.deleteDataboard(questionInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateDataboard(BoardVO questionInfo) {
		try {
			dao.updateDataboard(questionInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertDataboard(BoardVO questionInfo) {
		try{
			dao.insertDataboard(questionInfo);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
