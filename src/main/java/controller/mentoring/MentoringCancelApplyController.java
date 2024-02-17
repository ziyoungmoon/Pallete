package controller.mentoring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.MemberSessionUtils;
import service.manager.MentoringManager;
import service.manager.StudyListManager;
import service.manager.StudyManager;

public class MentoringCancelApplyController implements Controller {
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		MemberSessionUtils msu = new MemberSessionUtils();
		
		MentoringManager manager = MentoringManager.getInstance();
		
		if(msu.hasLogined(session)) { //mtrId와 Id
			try {
				int mtrId = Integer.parseInt(request.getParameter("mtrId"));				
				//String leaderId = manager.findLeaderId(studyId);
				
				if(manager.findMentoringMember(mtrId, msu.getLoginId(session))) { //신청 취소 진행
					if(manager.cancelMentoring(mtrId, msu.getLoginId(session))) {
						return "/mentoring/list";
					}
					else {
						return "/view/main";
					}
				}
				else {
					return "/alert/deny.jsp";
				}
				
			} catch (Exception e) {	
				e.printStackTrace();
			}	
			return null;
		}
			else {
				return "/alert/loginAlert.jsp";
			}
		} 
}
