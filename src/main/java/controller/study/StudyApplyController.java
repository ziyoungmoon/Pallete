package controller.study;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.MemberSessionUtils;
import model.dao.StudyDAO;
import service.dto.Study;
import service.dto.StudyMember;
import service.manager.StudyListManager;
import service.manager.StudyManager;

public class StudyApplyController implements Controller {
	
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		MemberSessionUtils msu = new MemberSessionUtils();
		
		StudyManager manager = StudyManager.getInstance();
		StudyListManager lmanager = StudyListManager.getInstance();
		
		//study 신청
		if (request.getMethod().equals("GET")) { 			
			 //리스트에서 int형 studyid 받음 -> studyform으로
			int studyId = Integer.parseInt(request.getParameter("studyId"));
			Study study = manager.findStudy(studyId).get(0);
			request.setAttribute("study", study);
						
			return "/study/studyForm.jsp";			
		}
		else {
			if(msu.hasLogined(session)) {
			try {
				int studyId = Integer.parseInt(request.getParameter("studyId"));
				//String id = request.getParameter("id");
				
				String leaderId = manager.findLeaderId(studyId);
				
				if(leaderId.equals(msu.getLoginId(session))) {
					return "/alert/leader.jsp";
				}
				else if(manager.findStudyMember(studyId, msu.getLoginId(session))) {
					return "/alert/applied.jsp";
				}
				else {
				manager.applyStudy(studyId, msu.getLoginId(session));					
				List<Study> studys = lmanager.getStudyList();
				request.setAttribute("studyList", studys);
				return "/study/StudyList.jsp";
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
}
