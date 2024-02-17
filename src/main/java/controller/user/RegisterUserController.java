package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import service.dto.Member;
import service.manager.ExistingUserException;
import service.manager.MemberManager;


public class RegisterUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	if (request.getMethod().equals("GET")) {	
    		// GET request: 회원정보 등록 form 요청	
    		log.debug("RegisterForm Request");
		
			return "/member/registerForm.jsp";   // 검색한 커뮤니티 리스트를 registerForm으로 전송     	
	    }	

    	// POST request (회원정보가 parameter로 전송됨)
       	Member member = new Member(
			request.getParameter("id"),
			request.getParameter("password"),
			request.getParameter("name"),
			request.getParameter("phoneNum"),
			request.getParameter("email"),
			request.getParameter("part"),
			request.getParameter("position"),
			request.getParameter("image"));
		
        log.debug("Create Member : {}", member);

		try {
			MemberManager manager = MemberManager.getInstance();
			manager.create(member);
	        //return "redirect:/home";	// 성공 시 홈 화면으로 redirect
	        //테스트
			return "redirect:/view/main";
		} catch (ExistingUserException e) {	// 예외 발생 시 회원가입 form으로 forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("member", member);
			return "/member/registerForm.jsp";
		}
    }
}

