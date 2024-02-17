package controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import service.dto.Member;
import service.manager.MemberManager;


public class ScoreController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {          
    
        MemberManager manager = MemberManager.getInstance();
         Member member = manager.findMember(request.getParameter("mentor"));
         System.out.println("멘토 이름"+member.getName());
         
         String leaderId = request.getParameter("mentor");
         manager.updateScore(leaderId, Integer.parseInt(request.getParameter("rating")));
         
         
         return "/Main.jsp";           
    }
}