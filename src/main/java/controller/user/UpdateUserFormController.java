package controller.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import service.manager.MemberManager;
import service.dto.*;

public class UpdateUserFormController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

         
        String userId = request.getParameter("userId");
        
        log.debug("UpdateForm Request : {}", userId);
           
        MemberManager manager = MemberManager.getInstance();
        
   
        Member member = manager.findMember(userId);
        if(member==null)
            return "redirect:/user/list";
            
        request.setAttribute("member", member);   
        
        
      return "/member/updateForm.jsp";   // 검색한 사용자 정보를 update form으로 전송     
      
    }
}
