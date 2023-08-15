package com.Thread.index;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ThreadService {
	
	@Autowired
	public ThreadDAO threadDAO;
	
	public List<ThreadDTO> threadList(){
		return threadDAO.threadList();
	}
	
	public int write(ThreadDTO dto) {
		return threadDAO.write(dto);
	}

	public ThreadDTO detail(ThreadDTO dto) {
		return threadDAO.detail(dto);
	}
	
	public List<Map<String, Object>> commentList(int bno) {
		return threadDAO.commentList(bno);
	}

	public int cdel(Map<String, Object> map) {
		return threadDAO.cdel(map);
	}

	public int cedit(Map<String, Object> map) {
		return threadDAO.cedit(map);
	}
	
	public int clikeUp(Map<String, Object> map) {
		return threadDAO.clikeUp(map);
	}


}
