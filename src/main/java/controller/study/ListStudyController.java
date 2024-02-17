package controller.study;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import service.dto.Study;
import service.manager.StudyListManager;

public class ListStudyController implements Controller{
	
	 public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
			
	    	StudyListManager manager = StudyListManager.getInstance();
			List<Study> studyList = manager.getStudyList();
			
			// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
			//System.out.println(studyList.get(0).getPart());
			request.setAttribute("studyList", studyList);				
			return "/study/StudyList.jsp";        
	    }
}

