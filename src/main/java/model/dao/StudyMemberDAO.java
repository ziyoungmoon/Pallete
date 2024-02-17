package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.dto.Member;
import service.dto.Study;

public class StudyMemberDAO {

	private JDBCUtil jdbcUtil = null;

	public StudyMemberDAO() {
		jdbcUtil = new JDBCUtil();
	}
	
	public int create(int studyId, String id) {
		int result = 0;
		String insertQuery = "INSERT INTO STUDY_MEMBER (studyId, Id)"
				+ "VALUES (?, ?)";

		Object[] param = new Object[] { studyId,id};
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
	
	public boolean findStudyMember(int studyId, String id) {
		String Query = "SELECT * FROM STUDY_MEMBER WHERE Id = ? and studyId = ?";

		Object[] param = new Object[] {id, studyId};
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
	
	public int deleteStudyMember(int studyId) throws SQLException {
		String Query = "DELETE FROM STUDY_MEMBER WHERE studyId = ?";

		Object[] param = new Object[] {studyId};
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
	
	public int deleteStudyApplyMember(int studyId, String id) throws SQLException {
		String Query = "DELETE FROM STUDY_MEMBER WHERE studyId = ? and id = ?";

		Object[] param = new Object[] {studyId, id};
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
	
	public List<Study> applyedStudyList(String id) throws SQLException {
        String sql = "SELECT u.studyId, u.part, u.deadline, u.region, u.quota, u.leaderId " 
                 + "FROM STUDY_MEMBER c LEFT OUTER JOIN STUDY u ON c.studyId = u.studyId "
                 + "WHERE c.id = ?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {id});      
               
      try {
         ResultSet rs = jdbcUtil.executeQuery();                 
         List<Study> studyList = new ArrayList<Study>();   
         while (rs.next()) {
            Study study = new Study(         
                  rs.getString("part"),
                  rs.getDate("deadline"),
                  rs.getString("region"),
                  rs.getInt("quota"),
                  rs.getString("leaderId"));
            studyList.add(study);            
         }      
         return studyList;               
         
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close();      // resource 반환
      }
      return null;
   }
}
