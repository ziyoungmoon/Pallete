package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import service.manager.*;
import service.dto.Member;

public class UpdateUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)   throws Exception {
        
        MemberManager manager = MemberManager.getInstance();
        
       String id = request.getParameter("userId");
       String pw = request.getParameter("password");
       String name = request.getParameter("name");
       String email = request.getParameter("email");
       String part = request.getParameter("part");
       String phone = request.getParameter("phone");
       String position = request.getParameter("position");
       String portfolio = request.getParameter("portfolio");
       
       Member updateMember = manager.findMember(id);
       log.debug("Update User : {}", updateMember);
   
      manager.updateMember(updateMember, id, pw, name, email, part, phone, position, portfolio);   
        return "redirect:/user/list"; //임시로! 나중에 홈화면으로 바꾸기          
    }
}