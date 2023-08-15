package com.Thread.index;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ThreadDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ThreadDTO> threadList(){
		return sqlSession.selectList("thread.threadList");
	}
	
	public int write(ThreadDTO dto) {
		return sqlSession.insert("thread.write",dto);
	}

	public ThreadDTO detail(ThreadDTO dto) {
		return sqlSession.selectOne("thread.detail", dto);
	}
	
	public List<Map<String, Object>> commentList(int bno) {
		return sqlSession.selectList("thread.commentList", bno);
	}

	public int cdel(Map<String, Object> map) {
		return sqlSession.update("thread.cdel", map);
	}

	public int cedit(Map<String, Object> map) {
		return sqlSession.update("thread.cedit", map);
	}

	public int clikeUp(Map<String, Object> map) {
		return sqlSession.update("thread.clikeUp", map);
	}

}
