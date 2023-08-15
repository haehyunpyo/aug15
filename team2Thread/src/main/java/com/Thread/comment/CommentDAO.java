package com.Thread.comment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public int commentsInsert(Map<String, Object> map) {
		return sqlSession.insert("comment.commentsInsert", map);
	}

	
}
