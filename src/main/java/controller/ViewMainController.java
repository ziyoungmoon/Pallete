package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MemberDAO;
import service.dto.Member;
import service.dto.Study;
import service.manager.StudyListManager;

public class ViewMainController implements Controller{
	
	 public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		 StudyListManager manager = StudyListManager.getInstance();
			List<Study> studyList = manager.orderDateStudys();
			
			// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
			//System.out.println(studyList.get(0).getPart());
			request.setAttribute("studyList", studyList);	
			
			MemberDAO dao = new MemberDAO();
			List<Member> memberList = dao.MemberList();
				
			Map<String, Integer> map =  new HashMap<>();
			for(Member member : memberList) {
				if(dao.getNumbers(member.getId()) != 0){
					System.out.println("결과 : "+member.getScore()+ " " +dao.getNumbers(member.getId()) +" "+member.getScore()/dao.getNumbers(member.getId()));
				  map.put(member.getId(), member.getScore()/dao.getNumbers(member.getId()));
				}
			}
			
			 List<String> keySet = new ArrayList<>(map.keySet());
			 keySet.sort((o1, o2) -> map.get(o2).compareTo(map.get(o1)));
		        
		     
		     List<Member> rankingList = new ArrayList<Member>();
		     for (String key : keySet) {
		    	  Member member = dao.findMember(key);
		    	  member.setScore(map.get(key));
		    	  //member.setImage(member.getImage());
		    	  rankingList.add(member);
		      }   
		     
		     request.setAttribute("rankingList", rankingList);	
		
			
			return "/Main.jsp";        
	    }
}
