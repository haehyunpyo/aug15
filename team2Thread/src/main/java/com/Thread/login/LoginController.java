package com.Thread.login;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@PostMapping("/login")
	public String login(HttpServletRequest request) {
		LoginDTO dto = new LoginDTO();
		dto.setM_id(request.getParameter("id"));
		dto.setM_pw(request.getParameter("pw"));
		System.out.println(dto.getM_id());
		System.out.println(dto.getM_pw());
		dto = loginService.login(dto);

		HttpSession session = request.getSession();
		if (dto.getCount() == 1) {
			session.setAttribute("mname", dto.getM_name());
			session.setAttribute("mid", request.getParameter("id"));
			System.out.println(session.getAttribute("mname"));
			return "redirect:/";
		} else {
			return "redirect:login";
		}
	}

	@GetMapping("/login")
	public String login() {
		return "/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("mname") != null) {
			session.removeAttribute("mname");// 세선 삭제하기

		}
		if (session.getAttribute("mid") != null) {
			session.removeAttribute("mid");
		}

		session.setMaxInactiveInterval(0); // 세션 유지시간을 0으로 = 종료시키기
		session.invalidate();// 세션 초기화 = 종료 = 세션의 모든 속성 값을 제거

		return "redirect:login";
	}

	@GetMapping("/findID")
	public String findID() {
		return "findID";
	}

	@GetMapping("/findPW")
	public String findPW() {
		return "findPW";
	}

	@ResponseBody
	@PostMapping("/findPW")
	public String findPW(HttpServletRequest request) {
		JSONObject json = new JSONObject();
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("birth"));
		LoginDTO dto = new LoginDTO();
		dto.setM_id(request.getParameter("id"));
		dto.setM_birth(request.getParameter("birth"));
		int result = loginService.findPW(dto);
		System.out.println(result);
		if (result == 1) {
			String uuid = new String();
			uuid = UUID.randomUUID().toString().substring(0, 8);
			System.out.println(uuid.substring(0, 8));
			dto.setM_pw(uuid);
			int newPW = loginService.findPW2(dto);
			System.out.println(newPW);
			json.put("newPW", dto.getM_pw());
		}

		return json.toString();
	}
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("findID") public String findID(@RequestParam("findID") String
	 * id) { JSONObject json = new JSONObject();
	 * 
	 * 
	 * return json.toString(); }
	 */

}
