package kr.or.ddit.utiles;

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
	
	// 생성된 세션들을 저장, 저장된 세션중 세션이 삭제될 때 삭제.
	public static Hashtable<String, Object> sessionMonitor = null;
	
	// WAS는 Servlet, Filter, Listener의 default생성자를 활용해서 인스턴스화 수행.
	public SessionManager(){
		if(sessionMonitor == null)
			sessionMonitor = new Hashtable<String, Object>();
	}
	
	public static synchronized SessionManager getInstance(){
		if(sessionManager == null){
			sessionManager = new SessionManager();
		}
		return sessionManager;
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession newSession = event.getSession();
		synchronized (sessionMonitor) {
			sessionMonitor.put(newSession.getId(), newSession);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession deleteSession = event.getSession();
		synchronized (sessionMonitor) {
			sessionMonitor.remove(deleteSession.getId());
		}
	}
	
	// 현재의 세션내에 저장된 로그인한 유저정보를 가지는 기존 세션이 
	// SessionMonitor에 저장되어 있는지...
	// loginCheck.jsp 	SessionManager.sessionDuplicationCheck(현재 세션ID, 금번 로그인시 입력된 mem_id)
	public boolean sessionDuplicationCheck(String sessionID, String mem_id){
		boolean flag = false;
		
		Enumeration<Object> sessions = sessionMonitor.elements();
		while(sessions.hasMoreElements()){
			HttpSession session = (HttpSession)sessions.nextElement();
			
			MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
			
			if(memberInfo != null){
				if(mem_id.equals(memberInfo.getMber_id()) && sessionID.equals(session.getId())){
					session.invalidate();
					flag = true;
				}
			}
		}
		return flag;
	}

	public static int currentContextUserCnt(){
		return sessionMonitor.size();
	}
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
	}

}
