package service.manager;

import java.sql.SQLException;
import java.util.List;

import model.dao.StudyDAO;
import model.dao.StudyMemberDAO;
import service.dto.Study;
import service.dto.StudyMember;

public class StudyManager {

	private static StudyManager studyMan = new StudyManager();
	private StudyDAO studyDao = new StudyDAO();
	private StudyMemberDAO studymemDao = new StudyMemberDAO();
	
	private StudyManager() {
		try {
			studyDao = new StudyDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static StudyManager getInstance() {
		return studyMan;
	}
	
	public int createStudy(Study study) throws SQLException {
		//if (userDAO.existingUser(user.getUserId()) == true) {
		//	throw new ExistingUserException(user.getUserId() + "는 존재하는 아이디입니다.");
		//}
		return studyDao.create(study);
	}
	
	public void applyStudy(int studyId, String id) {
		try {
			studymemDao.create(studyId, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateStudy(Study study) throws SQLException {
		studyDao.update(study);
	}
	
	public List<Study> findStudy(int studyId) throws SQLException {
		List<Study> studys = studyDao.findStudysInId(studyId);
		return studys;
	}
	
	public String findLeaderId(int studyId) throws SQLException {
		String leaderId = studyDao.findLeaderId(studyId);
		return leaderId;
	}
	
	public boolean findStudyMember(int studyId, String id) throws SQLException {
		if(studymemDao.findStudyMember(studyId, id))
			return true;
		return false;
	}
	
	public boolean deleteStudy(int studyId) {
		try {
			if(studymemDao.deleteStudyMember(studyId) > 0) {
				if((studyDao.remove(studyId) > 0)) {
					return true;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean cancelStudy(int studyId, String id) {
		try {
			if(studymemDao.deleteStudyApplyMember(studyId, id) > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
