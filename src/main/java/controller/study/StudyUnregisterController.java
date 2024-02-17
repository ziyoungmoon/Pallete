package controller.study;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.MemberSessionUtils;
import service.dto.Mentoring;
import service.dto.Study;
import service.manager.MemberManager;
import service.manager.MentoringManager;
import service.manager.StudyListManager;
import service.manager.StudyManager;

public class StudyUnregisterController implements Controller{

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		MemberSessionUtils msu = new MemberSessionUtils();
		
		MemberManager mmanager = MemberManager.getInstance();
		StudyManager manager = StudyManager.getInstance();
		StudyListManager lmanager = StudyListManager.getInstance();
		
		if(msu.hasLogined(session)) {
			
		try {
			String leaderId = request.getParameter("leaderId");
			int studyId = Integer.parseInt(request.getParameter("studyId"));
			
			if(leaderId.equals(msu.getLoginId(session))) {
			
			if(manager.deleteStudy(studyId)) {
				
				return "/study/list";
			}
			else {
				return "/view/main";
			}
			}
			else {
				return "/alert/deny.jsp";
			}
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			return "/view/main";
		}
		}
		else {
			return "/alert/loginAlert.jsp";
		}
    }
}
