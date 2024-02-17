package service.manager;

import java.sql.SQLException;
import java.util.List;

import model.dao.MentoringDAO;
import model.dao.MentoringMemberDAO;
import service.dto.Mento;
import service.dto.Mentoring;

public class MentoringManager {

	private static MentoringManager mentoringMan = new MentoringManager();
	private MentoringDAO mentoringDao = new MentoringDAO();
	//private MentoDAO mentoDao = new MentoDAO();
	private MentoringMemberDAO mentoringmemDao = new MentoringMemberDAO();
	private MentoringManager() {
		try {
			mentoringDao = new MentoringDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static MentoringManager getInstance() {
		return mentoringMan;
	}
	
	public void createMentoring(Mentoring mentoring) throws SQLException {
		//if (userDAO.existingUser(user.getUserId()) == true) {
		//	throw new ExistingUserException(user.getUserId() + "는 존재하는 아이디입니다.");
		//}
		mentoringDao.create(mentoring);
	}
	
	public List<Mentoring> MentoringList() throws SQLException {
		return mentoringDao.findMentoringList();
	}
	
	public Mentoring findMentoring(int mtrId) throws SQLException {
		return mentoringDao.findMentoring(mtrId);
	}
	
	public void applyMentoring(int mtrId, String id) {
		try {
			mentoringmemDao.create(mtrId, id);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean findMentoringMember(int mtrId, String id) {
		try {
			if(mentoringmemDao.findMentoringMember(mtrId, id))
				return true;			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteMentoring(int mtrId) {
		try {
			if(mentoringmemDao.deleteMentoringMember(mtrId) > 0) {
				if((mentoringDao.remove(mtrId) > 0)) {
					return true;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean cancelMentoring(int mtrId, String id) {
		try {
			if(mentoringmemDao.deleteMentoringApplyMember(mtrId, id) > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
