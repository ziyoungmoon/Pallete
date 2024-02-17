package controller.mentoring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import controller.Controller;
import controller.user.MemberSessionUtils;
import service.dto.Mentoring;
import service.manager.MemberManager;
import service.manager.MentoringManager;

public class MentoringRegisterController implements Controller {

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		MemberSessionUtils msu = new MemberSessionUtils();
		MemberManager mmanager = MemberManager.getInstance();
		
		if(msu.hasLogined(session)) {
			
		String part = request.getParameter("part");
		
		String DateStr = request.getParameter("deadline");
		Date deadline = java.sql.Date.valueOf(DateStr);
		
		String region = request.getParameter("region");
		int quota = Integer.parseInt(request.getParameter("quota"));
		//String leaderId = request.getParameter("leaderId");
		
		Mentoring mentoring = new Mentoring(part, deadline, region, quota, msu.getLoginId(session));		
        
		String position = mmanager.findPosition(msu.getLoginId(session));
		
		if(position.equals("멘티")) {
			return "/alert/mentiAlert.jsp";
		}
		
		try {
			MentoringManager manager = MentoringManager.getInstance();
			manager.createMentoring(mentoring);
			
			List<Mentoring> mentorings = manager.MentoringList();
			request.setAttribute("mentorings", mentorings);
			
	    	//log.debug("Create Mentoring : {}", comm);
	        return "/mentoring/MentoringList.jsp";
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			return "/mentoring/Register";
		}
		}
		else {
			return "/alert/loginAlert.jsp";
		}
    }
}

