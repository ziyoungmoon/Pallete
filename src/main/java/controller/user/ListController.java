package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import controller.Controller;
import model.dao.MemberDAO;
import service.dto.Member;
import service.manager.MemberManager;


public class ListController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {          
        // 로그인 여부 확인
        if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";     // login form 요청으로 redirect
        }
            
        request.setAttribute("curUserId", 
            UserSessionUtils.getLoginUserId(request.getSession()));       // 사용자 정보 저장     
                
        MemberManager manager = MemberManager.getInstance();
        Member member = manager.findMember(UserSessionUtils.getLoginUserId(request.getSession()));
        
        request.setAttribute("member", member);
        System.out.println("멤버 이미지: "+member.getImage());
        return "/member/list.jsp";               // 사용자 보기 화면으로 이동
    }
}