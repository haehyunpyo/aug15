package com.Thread.join;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("joinDAO")
public class JoinDAO {

	@Autowired
	private SqlSession sqlSession;

	public int join(Map<String, Object> map) {
		
		return sqlSession.insert("join.joingo", map);
	}

	public int checkID(String id) {
		
		return sqlSession.selectOne("join.checkID", id);
	}
	
}
