package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import model.dao.JDBCUtil;
import service.dto.Study;

public class StudyDAO {

	private JDBCUtil jdbcUtil = null;

	public StudyDAO() {
		jdbcUtil = new JDBCUtil();
	}

	private static String query = "SELECT studyId, " + "leaderId, " + "part, " + "deadline, " + "region, " + "quota";

	public List<Study> getStudyList() {
		String allQuery = query + " FROM STUDY";

		jdbcUtil.setSqlAndParameters(allQuery, null);
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<Study> list = new ArrayList<Study>();
			while (rs.next()) {
				Study dto = new Study();
				dto.setStudyId(rs.getInt("studyId")); 
				dto.setPart(rs.getString("part"));
				dto.setDeadline(rs.getDate("deadline"));
				dto.setRegion(rs.getString("region"));
				dto.setQuota(rs.getInt("quota"));
				dto.setLeaderId(rs.getString("leaderId"));
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

	public List<Study> findStudysInPart(String part) {
		String allQuery = query + " FROM STUDY WHERE part LIKE '%' || ? || '%'";

		jdbcUtil.setSqlAndParameters(allQuery, new Object[] { part });
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<Study> list = new ArrayList<Study>();
			while (rs.next()) {
				Study dto = new Study();
				dto.setStudyId(rs.getInt("studyId"));
				dto.setPart(rs.getString("part"));
				dto.setDeadline(rs.getDate("deadline"));
				dto.setRegion(rs.getString("region"));
				dto.setQuota(rs.getInt("quota"));
				dto.setLeaderId(rs.getString("leaderId"));
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
	
	public List<Study> orderDateStudys() {
		String allQuery = query + " FROM STUDY ORDER BY deadline asc";

		jdbcUtil.setSqlAndParameters(allQuery, null);
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<Study> list = new ArrayList<Study>();
			while (rs.next()) {
				Study dto = new Study();
				dto.setStudyId(rs.getInt("studyId")); 
				dto.setPart(rs.getString("part"));
				dto.setDeadline(rs.getDate("deadline"));
				dto.setRegion(rs.getString("region"));
				dto.setQuota(rs.getInt("quota"));
				dto.setLeaderId(rs.getString("leaderId"));
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
	
	public List<Study> findStudysInId(int id) {
		String allQuery = query + " FROM STUDY WHERE studyId = ?";

		jdbcUtil.setSqlAndParameters(allQuery, new Object[] { id });
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			List<Study> list = new ArrayList<Study>();
			while (rs.next()) {
				Study dto = new Study();
				dto.setStudyId(rs.getInt("studyId"));
				dto.setLeaderId(rs.getString("leaderId"));
				dto.setPart(rs.getString("part"));
				dto.setDeadline(rs.getDate("deadline"));
				dto.setRegion(rs.getString("region"));
				dto.setQuota(rs.getInt("quota"));
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
	public int create(Study study) {
		int result = 0;
		String insertQuery = "INSERT INTO STUDY (studyId, leaderId, part, " + "deadline, region, quota)"
				+ "VALUES (Sequence_419.NEXTVAL" + ", ?, ?, ?, ?, ?)";

		Object[] param = new Object[] { study.getLeaderId(), study.getPart(), study.getDeadline(), study.getRegion(),
				study.getQuota() };
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

	public void update(Study study) {
		int result = 0;
		String update = "UPDATE study SET leaderId = ?, part = ?, " + "deadline = ?, region = ?, quota = ?"
				+ " WHERE studyId = ?";

		jdbcUtil.setSqlAndParameters(update, new Object[] { study.getLeaderId(), study.getPart(), study.getDeadline(),
				study.getRegion(), study.getQuota(), study.getStudyId() });

		try {
			jdbcUtil.executeUpdate();
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
	}

	
	 public int apply(Study study) { 
		 int result = 0; 
		 String applyQuery = "INSERT INTO APPLY (applyId, studyId, is_applied)" + "VALUES (Sequence_419.NEXTVAL, ?, ?)";
	 
		 Object[] parm = new Object[] {study.getStudyId(), 1}; //1=isapplied
		 jdbcUtil.setSqlAndParameters(applyQuery, parm);
	 
		 try { 
			 result = jdbcUtil.executeUpdate(); 
		} catch(Exception ex) {
			 jdbcUtil.rollback(); 
			 ex.printStackTrace(); 
		} finally { 
			jdbcUtil.commit();
			jdbcUtil.close(); 
		} 
		 return result; 
		}
	 
	 public String findLeaderId(int studyId) throws SQLException {
		 String find = "SELECT * FROM STUDY WHERE studyId=?";
		 jdbcUtil.setSqlAndParameters(find, new Object[] {studyId});
		 
		 try {
	         ResultSet rs = jdbcUtil.executeQuery();      // query 실행
	         if (rs.next()) {
	            String leaderId = rs.getString(6);	            	
	            return leaderId;
	         }
	   } catch (Exception ex) {
	         ex.printStackTrace();
	   } finally {
	         jdbcUtil.close();      // resource 반환
	   }
	      return null;
	 }
	 
	 public int remove(int studyId) throws SQLException {
	      String sql = "DELETE FROM STUDY WHERE studyId = ?";      
	      
	      Object[] param = new Object[] {studyId};    
	      jdbcUtil.setSqlAndParameters(sql, param);   
	      
	      int result = 0;
	      
	      try {            
	         result = jdbcUtil.executeUpdate();
	      } catch (Exception ex) {
	         jdbcUtil.rollback();
	         ex.printStackTrace();
	      }
	      finally {
	         jdbcUtil.commit();
	         jdbcUtil.close();   // resource 반환
	      }      
	      return result;
	   }
}
