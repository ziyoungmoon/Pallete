package controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.dto.Mentoring;
import service.dto.Study;
import service.manager.MentoringListManager;
import service.manager.StudyListManager;
public class SearchResultController implements Controller{
   
    public String execute(HttpServletRequest request, HttpServletResponse response)   throws Exception {
      
          String part = request.getParameter("part");
          StudyListManager sManager = StudyListManager.getInstance();
          List<Study> studyList = sManager.findStudyList(part); 
          MentoringListManager mManager = MentoringListManager.getInstance();
         List<Mentoring> mentoringList = mManager.findMentoringList(part);
         
         // commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
            
         request.setAttribute("studyList", studyList);   
         request.setAttribute("mentoringList", mentoringList);
         return "/SearchResult.jsp";        
       
   
    }
}