package controller.mentoring;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import service.dto.Mentoring;
import service.manager.MentoringListManager;
public class MentoringListController implements Controller {

	public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
		MentoringListManager manager = MentoringListManager.getInstance();
		List<Mentoring> mentoringList = manager.getMentoringList();
		
		// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		request.setAttribute("mentorings", mentoringList);				
		return "/mentoring/MentoringList.jsp";        
    }
}
