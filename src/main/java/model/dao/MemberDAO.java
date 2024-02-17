package model.dao;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.dto.Member;



public class MemberDAO {
   private JDBCUtil jdbcUtil = null;
   
   public MemberDAO(){
      jdbcUtil = new JDBCUtil();
   }
   
   public Member findMember(String id) throws SQLException{
       String query = "SELECT id, password, name, phonenum, email, part, position, image, portfolio "
                + "FROM member "
                + "WHERE id = ? ";
       Member member = null;
       jdbcUtil.setSqlAndParameters(query, new Object[] {id});
       try {
          ResultSet rs = jdbcUtil.executeQuery();
          if(rs.next()) {
          String memberID = rs.getString("id");      
          String memberPW = rs.getString("password");
          String memberName = rs.getString("name");
          String phoneNum = rs.getString("phonenum");
          String memberEmail = rs.getString("email");
          String memberPart = rs.getString("part");
          String position = rs.getString("position");
          String image = rs.getString("image");
          String portfolio = rs.getString("portfolio");

          
          member = new Member(memberID, memberPW, memberName, phoneNum,memberEmail,memberPart,position, image, portfolio);
          }
          }catch (SQLException ex) {
          ex.printStackTrace();
          }finally {
          jdbcUtil.close();
          }
          return member;
    }
   
   public void createMember(Member member) throws SQLException {
      String sql = "INSERT INTO member (id, password, name,  phonenum, email, part, position, image) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";      
      Object[] param = new Object[] {member.getId(), member.getPassword(),member.getName(),
            member.getPhoneNum(), member.getEmail(), member.getPart(), member.getPosition(), member.getImage()};            
      jdbcUtil.setSqlAndParameters(sql, param);
         
      try {    
         jdbcUtil.executeUpdate();  // insert 문 실행
         
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      } finally {      
         jdbcUtil.commit();
         jdbcUtil.close();   // resource 반환
      }   
      
   }
   
   public int deleteMember(int id) throws SQLException{
      String query = "DELETE FROM member WHERE id=?";
      jdbcUtil.setSqlAndParameters(query, new Object[] {id});
      try {            
         int result = jdbcUtil.executeUpdate();   // delete 문 실행
         return result;
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      }
      finally {
         jdbcUtil.commit();
         jdbcUtil.close();   // resource 반환
      }      
      return 0;
   }
 
   public int updateMember(Member member, String id, String pw, String name, String email, String part, String phone, String position, String portfolio) throws SQLException {
	      String query = "UPDATE member "
	               + "SET id= ?, password=?, name=?, email=?, part=?, phonenum=?, position=?, portfolio=? "
	               + "WHERE id=?";
	      Object[] param = new Object[] {id, pw, name, email, part, phone, position, portfolio, member.getId()};            
	      jdbcUtil.setSqlAndParameters(query, param);   // JDBCUtil에 update문과 매개 변수 설정
	         
	      try {            
	         int result = jdbcUtil.executeUpdate();   // update 문 실행
	         return result;
	      } catch (Exception ex) {
	         jdbcUtil.rollback();
	         ex.printStackTrace();
	      }
	      finally {
	         jdbcUtil.commit();
	         jdbcUtil.close();   // resource 반환
	      }      
	      return 0;
	   }


   //다시 추가
   public boolean existingMember(String id) throws SQLException {
      String sql = "SELECT count(*) FROM member WHERE id=?";      
      jdbcUtil.setSqlAndParameters(sql, new Object[] {id});   // JDBCUtil에 query문과 매개 변수 설정

      try {
         ResultSet rs = jdbcUtil.executeQuery();      // query 실행
         if (rs.next()) {
            int count = rs.getInt(1);
            return (count == 1 ? true : false);
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close();      // resource 반환
      }
      return false;
   }
   
   public String findPosition(String id) throws SQLException {
	   String sql = "SELECT * FROM member WHERE id=?";
	   jdbcUtil.setSqlAndParameters(sql, new Object[] {id}); 
	   
	   try {
	         ResultSet rs = jdbcUtil.executeQuery();      // query 실행
	         if (rs.next()) {
	            String position = rs.getString(7);	            	
	            return position;
	         }
	   } catch (Exception ex) {
	         ex.printStackTrace();
	   } finally {
	         jdbcUtil.close();      // resource 반환
	   }
	      return null;
   }
   
   public List<Member> ranking() {
	      String sql = "SELECT FROM member ORDER BY score desc";
	      jdbcUtil.setSqlAndParameters(sql, null);
	      try {
	         ResultSet rs = jdbcUtil.executeQuery();
	         List<Member> list = new ArrayList<Member>();
	         while (rs.next()) {
	            Member dto = new Member();
	            dto.setName(rs.getString("name")); 
	            dto.setPart(rs.getString("part"));
	            dto.setScore(rs.getInt("score"));
	            list.add(dto);
	         }
	         return list;
	      } catch (Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         jdbcUtil.close();
	      }
	      return null;
	   }

   public int updateScore(String leaderId, int score) throws SQLException {
       String query = "UPDATE member "
                + "SET score = NVL(score,0) + ? "
                + "WHERE id = ?";
       Object[] param = new Object[] {score, leaderId};            
       jdbcUtil.setSqlAndParameters(query, param);   // JDBCUtil에 update문과 매개 변수 설정
          
       try {            
          int result = jdbcUtil.executeUpdate();   // update 문 실행
          return result;
       } catch (Exception ex) {
          jdbcUtil.rollback();
          ex.printStackTrace();
       }
       finally {
          jdbcUtil.commit();
          jdbcUtil.close();   // resource 반환
       }      
       return 0;
    }
public int getNumbers(String leaderId) {
     String sql = "SELECT COUNT(*) "
                 + "FROM MENTORING_MEMBER c LEFT OUTER JOIN MENTORING u ON c.mtrId = u.mtrId "
                 + "WHERE u.leaderId = ?";              
     jdbcUtil.setSqlAndParameters(sql, new Object[] {leaderId}); // JDBCUtil에 query문과 매개 변수 설정
     
     try {
         ResultSet rs = jdbcUtil.executeQuery();     // query 실행
         rs.next();                                      
         return rs.getInt(1);            
     } catch (Exception ex) {
         ex.printStackTrace();
     } finally {
         jdbcUtil.close();       // resource 반환
     }
     return 0;
 }
 
 public int updateMemberImg(Member member, String id, String pw, String name, String email, String part, String phone, String position, String img) throws SQLException {
    String query = "UPDATE member "
             + "SET id= ?, password=?, name=?, email=?, part=?, phonenum=?, position=?, image=? "
             + "WHERE id=?";
    Object[] param = new Object[] {id, pw, name, email, part,phone,position, img, member.getId()};            
    jdbcUtil.setSqlAndParameters(query, param);   // JDBCUtil에 update문과 매개 변수 설정
       
    try {            
       int result = jdbcUtil.executeUpdate();   // update 문 실행
       return result;
    } catch (Exception ex) {
       jdbcUtil.rollback();
       ex.printStackTrace();
    }
    finally {
       jdbcUtil.commit();
       jdbcUtil.close();   // resource 반환
    }      
    return 0;
 }
 
 public List<Member> MemberList() throws SQLException {
     String sql = "SELECT id, password, name, phonenum, email, part, position, NVL(score,0) AS score " 
              + "FROM member";
    jdbcUtil.setSqlAndParameters(sql, null);      // JDBCUtil에 query문 설정
             
    try {
       ResultSet rs = jdbcUtil.executeQuery();            
       List<Member> memberList = new ArrayList<Member>();   
       while (rs.next()) {
          Member member = new Member(         
             rs.getString("id"),
             rs.getString("password"),
             rs.getString("name"),
             rs.getString("phonenum"),
             rs.getString("email"),
             rs.getString("part"),
             rs.getString("position"),
             rs.getInt("score"));
          memberList.add(member);            
       }      
       return memberList;               
       
    } catch (Exception ex) {
       ex.printStackTrace();
    } finally {
       jdbcUtil.close();      // resource 반환
    }
    return null;
 }
 
 
}
