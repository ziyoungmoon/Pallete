package service.manager;
import java.sql.SQLException;
import java.util.List;


import model.dao.StudyDAO;
import service.dto.Study;

public class StudyListManager {
	private static StudyListManager studyList = new StudyListManager();
	private StudyDAO studyDAO;
	
	private StudyListManager() {
		try {
			studyDAO = new StudyDAO();	
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static StudyListManager getInstance() {
		return studyList;
	}
	
	public List<Study> getStudyList() throws SQLException {
		return studyDAO.getStudyList();
	}
	public List<Study> orderDateStudys() throws SQLException {
		return studyDAO.orderDateStudys();
	}
	public List<Study> findStudyList(String part)
			throws SQLException {
		return studyDAO.findStudysInPart(part);
	}
	

}
