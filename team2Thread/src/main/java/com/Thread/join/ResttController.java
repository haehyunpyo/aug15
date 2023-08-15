package com.Thread.join;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Thread.index.ThreadService;
import com.Thread.login.LoginDTO;
import com.Thread.login.LoginService;

@RestController
public class ResttController {
	
	@Autowired
	private LoginService loginService;
	
	@PostMapping("/findID")
	public String findID(HttpServletRequest request) {
		//System.out.println(request.getParameter("em"));
		LoginDTO dto = new LoginDTO();
		dto.setM_em(request.getParameter("em"));
		JSONObject json = new JSONObject();
		String result = "";
		String rname = "";
		dto = loginService.findID(dto);
		if(dto.getM_id() != null) {
			rname = dto.getM_name();
			result = dto.getM_id();
			json.put("mid", result);
			json.put("mname", rname);
		}
			
			//System.out.println(dto.getM_id());
			//System.out.println(result);

			 if(dto.getM_id()==null) {
				 result = "";
				 rname = "";
				 json.put("mid", result);
				 json.put("mname", rname);
			 }
			 System.out.println(dto.getM_name());
			 return json.toString();
	}
	
	@Autowired
	public JoinService joinService;
	
	
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		int result = joinService.checkID(id);
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();
	}
	

}
