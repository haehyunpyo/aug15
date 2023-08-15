package com.Thread.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
@Autowired
private LoginDAO loginDAO;

public LoginDTO login(LoginDTO dto) {
	
	return loginDAO.login(dto);
}

public LoginDTO findID(LoginDTO dto) {
	// TODO Auto-generated method stub
	return loginDAO.findID(dto);
}

public int findPW(LoginDTO dto) {
	// TODO Auto-generated method stub
	return loginDAO.findPW(dto);
}

public int findPW2(LoginDTO dto) {
	return loginDAO.findPW2(dto);
	
}
}
