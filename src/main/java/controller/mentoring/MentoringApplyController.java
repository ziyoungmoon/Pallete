package controller.mentoring;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.MemberSessionUtils;
import service.dto.Mentoring;
import service.dto.MentoringMember;
import service.dto.Study;
import service.manager.MemberManager;
import service.manager.MentoringManager;

public class MentoringApplyController implements Controller {

	 @Override
	    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    	
		 MemberManager mmanager = MemberManager.getInstance();
		 HttpSession session = request.getSession(false);
		 MemberSessionUtils msu = new MemberSessionUtils();
		 
		 MentoringManager manager = MentoringManager.getInstance(); 
		 
		 if (request.getMethod().equals("GET")) { 			
			 //리스트에서 int형 mtrid 받음 -> mentoringform으로
			int mtrId = Integer.parseInt(request.getParameter("mtrId"));
			Mentoring mentoring = manager.findMentoring(mtrId);
			request.setAttribute("mentoring", mentoring);
						
			return "/mentoring/mentoringForm.jsp";			
		}
		 else { 
			 if(msu.hasLogined(session)) {
				 
				 String position = mmanager.findPosition(msu.getLoginId(session));
				 int mtrId = Integer.parseInt(request.getParameter("mtrId"));
				 if (position.equals("멘토")) {
					 return "/alert/mentoAlert.jsp";
				 }
				 else if(manager.findMentoringMember(mtrId, msu.getLoginId(session))) {
					 return "/alert/applied.jsp";
				 }
				 else {							 
					 manager.applyMentoring(mtrId, msu.getLoginId(session));
			 
					 List<Mentoring> mentorings = manager.MentoringList();
					 request.setAttribute("mentorings", mentorings);
			 
					 return "/mentoring/MentoringList.jsp";
				 }
			 }
			 else 
			 {
				return "/alert/loginAlert.jsp";
			 }
		 }		
	}
}
