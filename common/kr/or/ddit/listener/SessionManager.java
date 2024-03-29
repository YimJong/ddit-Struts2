package kr.or.ddit.listener;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import kr.or.ddit.vo.MemberVO;


public class SessionManager implements HttpSessionAttributeListener,
		HttpSessionListener {
	
	public static SessionManager sessionManager = null;
	
	//생성된 모든 세션 (모든 클라이언트)들을 저장 
	public static Hashtable<String, Object> sessionMonitor;
	
	public SessionManager(){
		if(sessionMonitor == null){
			sessionMonitor = new Hashtable<String, Object>();

		}
	}
	public static synchronized SessionManager getInstance(){
		if(sessionManager == null){
			sessionManager = new SessionManager();
		}
		
		return sessionManager;
	}
	

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		// 금본 신규 생성된 세션 취득 
		HttpSession newSession = event.getSession();
		synchronized (sessionMonitor) {
			sessionMonitor.put(newSession.getId(), newSession);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		//금번 삭제되는 세션 취득 
		HttpSession removeSession = event.getSession();
		synchronized (sessionMonitor) {
			sessionMonitor.remove(removeSession.getId());
		}
	}

	public boolean loginDuplicaionCheck(String sessionID, String mem_id){
		boolean flag = false;
		
		Enumeration<Object> sessions = sessionMonitor.elements();
		while(sessions.hasMoreElements()){
			HttpSession session = (HttpSession) sessions.nextElement();
			
			//로그인 회원정보 취득 
			MemberVO loginedMemberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
			
			if(loginedMemberInfo != null){
				//해당 메서드에 전달된 mem_id값은 금번 신규 로그인한 회원의 아이디
				//loginedMemberInfo.getMem_id()값은 기존 로그인한 회원의 아이디 
				if(mem_id.intern() == loginedMemberInfo.getMem_id().intern() &&
						sessionID.intern() != session.getId().intern()){
					session.invalidate();
					flag = true;
				}
			}
		}
		return flag;
	}
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

}
