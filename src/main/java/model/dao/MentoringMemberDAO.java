package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.dto.Mentoring;

public class MentoringMemberDAO {
	
	private JDBCUtil jdbcUtil = null;
	
	public MentoringMemberDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public int create(int mtrId, String id) {
		int result = 0;
		String insertQuery = "INSERT INTO MENTORING_MEMBER (mtrId, Id)"
				+ "VALUES (?, ?)";
		
		Object[] param = new Object[] {mtrId, id};
		jdbcUtil.setSqlAndParameters(insertQuery, param);
		
		try {
			result = jdbcUtil.executeUpdate();
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return result;
	}
	
	public boolean findMentoringMember(int mtrId, String id) {
		String Query = "SELECT * FROM MENTORING_MEMBER WHERE Id = ? and mtrId = ?";

		Object[] param = new Object[] {id, mtrId};
		jdbcUtil.setSqlAndParameters(Query, param);

		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs.next()) {
				return true; 
			}
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return false;
	}
	
	public int deleteMentoringMember(int mtrId) throws SQLException {
		String Query = "DELETE FROM MENTORING_MEMBER WHERE mtrId = ?";

		Object[] param = new Object[] {mtrId};
		jdbcUtil.setSqlAndParameters(Query, param);

		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0;
	}
	
	public int deleteMentoringApplyMember(int mtrId, String id) throws SQLException {
		String Query = "DELETE FROM MENTORING_MEMBER WHERE mtrId = ? and id = ?";

		Object[] param = new Object[] {mtrId, id};
		jdbcUtil.setSqlAndParameters(Query, param);

		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0;
	}
	
	public List<Mentoring> applyedMentoringList(String id) throws SQLException {
        String sql = "SELECT u.part, u.deadline, u.region, u.quota, u.leaderId, u.mtrId " 
                 + "FROM MENTORING_MEMBER c LEFT OUTER JOIN MENTORING u ON c.mtrId = u.mtrId "
                 + "WHERE c.id = ?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {id});      // JDBCUtil에 query문 설정
               
      try {
         ResultSet rs = jdbcUtil.executeQuery();         // query 실행         
         List<Mentoring> mentoringList = new ArrayList<Mentoring>();   // Mentoring들의 리스트 생성
         while (rs.next()) {
            Mentoring mentoring = new Mentoring(         // Mentoring 객체를 생성하여 현재 행의 정보를 저장
                  rs.getInt("mtrId"),
                  rs.getString("part"),
                  rs.getDate("deadline"),
                  rs.getString("region"),
                  rs.getInt("quota"),
                  rs.getString("leaderId"));
            mentoringList.add(mentoring);            // List에 Mentoring 객체 저장
         }      
         return mentoringList;               
         
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close();      // resource 반환
      }
      return null;
   }

}
