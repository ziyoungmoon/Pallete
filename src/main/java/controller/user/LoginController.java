package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import service.dto.Member;
import service.manager.MemberManager;


public class LoginController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       String id = request.getParameter("id");
      String password = request.getParameter("password");
      
      try {
         MemberManager manager = MemberManager.getInstance();
          manager.login(id, password);
         HttpSession session = request.getSession();
            session.setAttribute(MemberSessionUtils.USER_SESSION_KEY, id);
                 
            return "redirect:/user/list";         
      } catch (Exception e) {
         
          request.setAttribute("loginFailed", true); request.setAttribute("exception",e); 
          return "/member/loginForm.jsp";
          
      
      }   
    }
}