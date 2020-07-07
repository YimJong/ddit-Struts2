package kr.or.ddit.member.controller;


import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateMemberAction implements Action, ModelDriven<MemberVO> { // 맵핑 될 VO 설정
	private MemberVO memberInfo;
	
	@Override
	public String execute() throws Exception {
		
		IMemberService service = IMemberServiceImpl.getInstance();
		service.updateMemberInfo(this.memberInfo);
		
		return SUCCESS;
	}

	@Override
	public MemberVO getModel() { // ▶ 인터셉터 선언 순서를 기초로 실행됨.
								 // ▶ 인터셉터 ModelDriven 역할
								 //    클라이언트로부터 전송되는 대량의 쿼리 스트링을 VO와 맵핑을 하기 위해
								 //    해당 VO의 인스턴스를 ValueStack에 배치.
		                         // ▶ 인터셉터 params 역할
							     //    (action의 default 인터셋터 - 생략가능)
								 //    * 기타 인터셉터와 병행 활용 시에는 생략 불가.
			                     //    ValueStack에 배치된 인스턴스화가 안료되어진 VO를 대상으로
							     //    쿼리스트링의 값을 주입
		this.memberInfo = new MemberVO();
		return this.memberInfo; // 리턴 값이 ValueStack으로 감
	}

}
