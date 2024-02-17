package controller.mentoring;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.MemberSessionUtils;
import service.dto.Mentoring;
import service.manager.MemberManager;
import service.manager.MentoringManager;

public class MentoringUnregisterController implements Controller {

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		MemberSessionUtils msu = new MemberSessionUtils();
		
		MemberManager mmanager = MemberManager.getInstance();
		MentoringManager manager = MentoringManager.getInstance();
		
		if(msu.hasLogined(session)) {
			
		try {
			String leaderId = request.getParameter("leaderId");
			int mtrId = Integer.parseInt(request.getParameter("mtrId"));
			
			if(leaderId.equals(msu.getLoginId(session))) {
			
			//멘토링 삭제
			if(manager.deleteMentoring(mtrId)) {
			
			List<Mentoring> mentorings = manager.MentoringList();
			request.setAttribute("mentorings", mentorings);
			
	        return "/mentoring/MentoringList.jsp";
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
