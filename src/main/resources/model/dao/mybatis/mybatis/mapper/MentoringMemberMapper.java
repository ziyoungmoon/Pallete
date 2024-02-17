package model.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import service.dto.MentoringMember;

public interface MentoringMemberMapper {

	public int createMentoringMember(HashMap<Integer, String> map); 
	
	public MentoringMember findMentoringMember(HashMap<Integer, String> map); 
	
	public int deleteMentoringMember(String id);
	
	public int deleteMentoringApplyMember(HashMap<Integer, String> map);
	
}
