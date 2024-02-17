package model.dao.mybatis;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.dao.mybatis.mapper.MentoringMemberMapper;


public class MentoringMemberDAO2 {
	private final static String namespace = "model.dao.mybatis.mapper.MentoringMemberMapper";
	private static SqlSessionFactory sqlSessionFactory;
	
	public MentoringMemberDAO2() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	public static int createMentoringMember(HashMap<Integer, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = sqlSession.getMapper(MentoringMemberMapper.class).createMentoringMember(map);
		try {if (result > 0) {
			sqlSession.commit();
		} 
		return result;
	} finally {
		sqlSession.close();
		
	}
}
	
	
	
}
