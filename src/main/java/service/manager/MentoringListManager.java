package service.manager;

import java.sql.SQLException;
import java.util.List;

import model.dao.MentoringDAO;
import model.dao.MentoringMemberDAO;
import service.dto.Mentoring;

public class MentoringListManager {
   private static MentoringListManager mentoring = new MentoringListManager();
   private MentoringDAO mentoringDAO;
   private MentoringMemberDAO mentoringmemDAO;
   
   private MentoringListManager() {
      try {
         mentoringDAO = new MentoringDAO();   
      } catch (Exception e) {
         e.printStackTrace();
      }         
   }
   
   public static MentoringListManager getInstance() {
      return mentoring;
   }
   
   public List<Mentoring> getMentoringList() throws SQLException {
      return mentoringDAO.findMentoringList();
   }

   public List<Mentoring> findMenoringList(int currentPage, int countPerPage)
         throws SQLException {
      return mentoring.findMenoringList(currentPage, countPerPage);
   }
   
   public List<Mentoring> findMentoringList(String part)
         throws SQLException {
      return mentoringDAO.findMentoringInPart(part);
   }
   
   public List<Mentoring> getApplyedMentoringList(String id) throws SQLException {
	      return mentoringmemDAO.applyedMentoringList(id);
	   }
   
}