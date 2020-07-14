package kr.or.ddit.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.ModelDriven;

public class InsertMemberInfoAction implements ModelDriven<MemberVO>{
private MemberVO memberInfo;
private String message;

	public String getMessage() {
	return message;
}
	public String execute(){
		IMemberService service = IMemberServiceImpl.getInstance();
		service.insertMemberInfo(this.memberInfo);
		try {
			this.message = URLEncoder.encode("회원가입 되었습니다.", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		return "success";
	}
	@Override
	public MemberVO getModel() {
		this.memberInfo = new MemberVO();
		return this.memberInfo;
	}
		
	
}
