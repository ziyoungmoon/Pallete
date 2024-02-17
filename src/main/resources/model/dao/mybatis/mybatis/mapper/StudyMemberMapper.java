package mybatis.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;

public interface StudyMemberMapper {

	int create(Map<Integer, String> condition);
}
