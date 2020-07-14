package kr.or.ddit.admin.question.controller;

import kr.or.ddit.admin.question.service.IQuestionService;
import kr.or.ddit.admin.question.service.QuestionServiceImpl;
import kr.or.ddit.vo.BoardVO;

import com.opensymphony.xwork2.ModelDriven;

public class InsertQuestionAction implements ModelDriven<BoardVO>{
	private BoardVO questionInfo;
	
	public String execute(){
		IQuestionService service = QuestionServiceImpl.getInstance();
		service.updateDataboard(questionInfo);
		return "success";
	}

	@Override
	public BoardVO getModel() {
		this.questionInfo = new BoardVO();
		return this.questionInfo;
	}

	public void setQuestionInfo(BoardVO questionInfo) {
		this.questionInfo = questionInfo;
	}
}
