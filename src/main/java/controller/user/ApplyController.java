package controller.user;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import controller.Controller;
import model.dao.MemberDAO;
import model.dao.MentoringMemberDAO;
import model.dao.StudyMemberDAO;
import service.dto.Member;
import service.dto.Mentoring;
import service.dto.Study;
import service.manager.MemberManager;
import service.manager.MentoringListManager;
import service.manager.StudyListManager;


public class ApplyController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {          
    
       
       MemberManager manager = MemberManager.getInstance();
        Member member = manager.findMember(UserSessionUtils.getLoginUserId(request.getSession()));         
        
         //MentoringListManager manager2 = MentoringListManager.getInstance();
        MentoringMemberDAO mentoringdao = new MentoringMemberDAO();
      List<Mentoring> applyMentoringList =  mentoringdao.applyedMentoringList(member.getId());
      
       StudyMemberDAO studydao = new StudyMemberDAO();
       List<Study> applyStudyList =  studydao.applyedStudyList(member.getId());
         
         request.setAttribute("member", member);
         request.setAttribute("applyMentoringList", applyMentoringList);      
         request.setAttribute("applyStudyList", applyStudyList);
         
         return "/member/applyList.jsp";           
    }
}