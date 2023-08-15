package com.Thread.join;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("joinService")
public class JoinService {

	@Autowired
	private JoinDAO joinDAO;

	public int join(Map<String, Object> map) {
		return joinDAO.join(map);
	}

	public int checkID(String id) {
		return joinDAO.checkID(id);
	}
}
