package com.Thread.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSession sqlSession;

	public LoginDTO login(LoginDTO dto) {
		
		return sqlSession.selectOne("login.login", dto);
	}

	public LoginDTO findID(LoginDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("login.findID", dto);
	}

	public int findPW(LoginDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("login.findPW", dto);
	}

	public int findPW2(LoginDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("login.findPW2", dto);
	}
}
