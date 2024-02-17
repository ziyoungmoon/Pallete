package service.manager;

import java.sql.SQLException;

import model.dao.MemberDAO;
import service.dto.Member;


public class MemberManager {
    private static MemberManager memMan = new MemberManager();
    private MemberDAO memberDAO;
   
    public MemberManager() {
        try {
            memberDAO = new MemberDAO();
        } catch (Exception e) {
            e.printStackTrace();
        }           
    }
    
    public static MemberManager getInstance() {
        return memMan;
    }
    
    public void create(Member member) throws SQLException, ExistingUserException {
      if (memberDAO.existingMember(member.getId()) == true) {
         throw new ExistingUserException(member.getId() + "는 존재하는 아이디입니다.");
      }
      memberDAO.createMember(member);
   }
    
    public Member findMember(String userName)
            throws SQLException, UserNotFoundException {
            Member member = memberDAO.findMember(userName);
            if(member == null) {
                throw new UserNotFoundException(userName + "는 존재하지 않는 닉네임입니다.");
            }       
            return member;
        }

    public int updateMember(Member member,String id, String pw, String name, String email,String part, String phone, String position, String portfolio) throws SQLException {
        return memberDAO.updateMember(member, id, pw, name, email, part, phone, position, portfolio);
    }   

    
    public boolean login(String userId, String password)
            throws SQLException, UserNotFoundException, PasswordMismatchException {
            Member member = findMember(userId);

            if (!member.matchPassword(password)) {
                throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
            }
            return true;
     }
    
    public String findPosition(String id) throws SQLException {
        String position = memberDAO.findPosition(id);
        return position;
    }
    
    public int updateScore(String leaderId, int score) throws SQLException {
        return memberDAO.updateScore(leaderId, score);
    }   
    
    public int updateMemberImg(Member member,String id, String pw, String name, String email,String part,String phone, String position, String img) throws SQLException {
        return memberDAO.updateMemberImg(member, id,pw,name,email,part,phone,position,img);
    }   
    
}