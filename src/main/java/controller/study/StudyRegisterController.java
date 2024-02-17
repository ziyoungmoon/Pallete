package controller.study;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.MemberSessionUtils;
import service.dto.Study;
import service.manager.MemberManager;
import service.manager.StudyListManager;
import service.manager.StudyManager;

public class StudyRegisterController implements Controller {

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
		StudyListManager lmanager = StudyListManager.getInstance();
		
		//코드추가
		HttpSession session = request.getSession(false);
		MemberSessionUtils msu = new MemberSessionUtils();
		
		if(msu.hasLogined(session)) {			
		try {			
			String DateStr = request.getParameter("deadline");
			Date deadline = java.sql.Date.valueOf(DateStr);
			//String leaderId = request.getParameter("leaderId");
			
			Study study = new Study(request.getParameter("part"), deadline, 
					request.getParameter("region"), Integer.parseInt(request.getParameter("quota")), 
					msu.getLoginId(session));	
			
			StudyManager manager = StudyManager.getInstance();
			manager.createStudy(study);
			
			List<Study> studys = lmanager.getStudyList();
			request.setAttribute("studyList", studys);
			
	        return "StudyList.jsp";
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			return "/Study/Register";
		}
		}
		else {
			return "/alert/loginAlert.jsp";
		}
	}	
}
