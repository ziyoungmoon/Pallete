package service.manager;

import java.sql.SQLException;
import java.util.List;

import model.dao.MemberDAO;
import model.dao.PostDAO;
import service.dto.Member;
import service.dto.Post;

public class PostManager {
	 private static PostManager postMan = new PostManager();
	    private PostDAO postDAO;
	   
	    public PostManager() {
	        try {
	        	postDAO = new PostDAO();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }           
	    }
	    
	    public static PostManager getInstance() {
	        return postMan;
	    }
	    
	    public void create(Post post) throws SQLException, ExistingUserException {
			/*
			 * if (postDAO.existingMember(post.getId()) == true) { throw new
			 * ExistingUserException(member.getId() + "는 존재하는 아이디입니다."); }
			 * memberDAO.createMember(member);
			 */
		}
	    
	    public List<Post> listPost() throws SQLException {
	            return  PostDAO.findPostList();
	    }
}
