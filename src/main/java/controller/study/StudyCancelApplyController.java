package controller.study;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.MemberSessionUtils;
import service.dto.Study;
import service.manager.StudyListManager;
import service.manager.StudyManager;

public class StudyCancelApplyController implements Controller {

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		MemberSessionUtils msu = new MemberSessionUtils();
		
		StudyManager manager = StudyManager.getInstance();
		StudyListManager lmanager = StudyListManager.getInstance();
		
		if(msu.hasLogined(session)) { //studyId와 Id
			try {
				int studyId = Integer.parseInt(request.getParameter("studyId"));				
				String leaderId = manager.findLeaderId(studyId);
				
				if(leaderId.equals(msu.getLoginId(session))) {
					return "/alert/leader.jsp";
				}
				else if(manager.findStudyMember(studyId, msu.getLoginId(session))) { //신청 취소 진행
					if(manager.cancelStudy(studyId, msu.getLoginId(session))) {
						return "/study/list";
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

