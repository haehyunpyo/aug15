package com.Thread.comment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

@Service
public class CommentService {

	@Autowired
	public CommentDAO commentDAO;

	public int commentsInsert(Map<String, Object> map) {
		return commentDAO.commentsInsert(map);
	}

	
	

}
