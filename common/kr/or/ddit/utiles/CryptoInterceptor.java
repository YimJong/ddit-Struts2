package kr.or.ddit.utiles;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.utils.CryptoGenerator;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CryptoInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession(); // 비밀키를 얻어내기 위해서.
		
		// 공개키, 비밀키 저장.
		Map<String, String> publicKeyMap = CryptoGenerator.generatePairKey(session);
		request.setAttribute("publicKeyMap", publicKeyMap);
		
		// 여기에서 해당 요청을 처리하는 액션 클래스의 액션 메소드가 호출됨.
		String returnValue = actionInvocation.invoke();
		
		return returnValue;
	}
}
