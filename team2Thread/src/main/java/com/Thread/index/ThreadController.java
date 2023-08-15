package com.Thread.index;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ThreadController {
	
	@Autowired
	public ThreadService threadService;
	
	@Autowired
	private Util util;
	
	@GetMapping("/")
	public String thread(Model model) {
		List<ThreadDTO> list= threadService.threadList();
		model.addAttribute("list", list);
		return "thread";
	}
	
	// restcontroller에 적으면 안나옴
	@GetMapping("/write")
	public String write(HttpSession session) {
		if (session.getAttribute("mid") != null) {
			return "write";
		} else {
			return "redirect:/login";
		}
	}

	@ResponseBody
	@PostMapping("/write2")
	public String write2(@RequestBody List<Map<String, Object>> contents, HttpServletRequest request) {
		int result = 0;
		HttpSession session = request.getSession();
		System.out.println(contents);
		String bcontent = "";
		// List<Object> bcontent = new ArrayList<Object>();

		if (session.getAttribute("mid") != null) {
			ThreadDTO dto = new ThreadDTO();
			dto.setM_id((String) session.getAttribute("mid"));
			for (Map<String, Object> map : contents) {
				System.out.println(map.values());
				bcontent += map.values();

				// List<Object> list = new ArrayList<Object>(map.values());
				// bcontent.addAll(list);
			}
			dto.setBcontent(bcontent);
			result = threadService.write(dto);

			JSONObject json = new JSONObject();
			json.put("result", result);
			return json.toString();

		} else {
			return "redirect:/login";
		}

	}
		

	//댓글 띄우기
	@GetMapping("/comment")
	public String detail(HttpServletRequest request, Model model) {
		int bno = util.strToInt(request.getParameter("bno"));
		ThreadDTO dto = new ThreadDTO();
		dto.setBno(bno);
				
		ThreadDTO result = threadService.detail(dto);
		//System.out.println(result.getBno());
		
		// 댓글이 있다면 불러옴
		if (result.getCommentcount() > 0) { 
			List<Map<String, Object>> commentsList = threadService.commentList(bno); 
			model.addAttribute("commentsList", commentsList);
			// comment페이지에도 댓글갯수표시
			int count = result.getCommentcount();
			dto.setCommentcount(count);
		}
		 
		model.addAttribute("dto", dto);

		return "comment";
	}
	

	// 댓글 삭제
	@ResponseBody
	@PostMapping("/cdelR")
	public String cdelR(@RequestParam Map<String, Object> map, HttpSession session) {
		
		int result = 0;
		JSONObject json = new JSONObject();
		// 로그인 했다면
		if(session.getAttribute("mid") != null) {
			// bno & cno 값이 제대로 들어간다면 댓글삭제 진행
			if( map.get("bno") != null && map.get("cno") != null &&
				!(map.get("bno").equals("")) && !(map.get("cno").equals("")) &&
				util.isNum(map.get("bno")) && util.isNum(map.get("cno"))) {
				//System.out.println(map);
				
				map.put("mid", session.getAttribute("mid"));
				result = threadService.cdel(map);
				//System.out.println("나와라" + result);
				}
			json.put("result", result);
		}
		return json.toString()+"";
	}
	
	
	// 댓글수정
	 @PostMapping("/cedit")
	 public String cedit(@RequestParam Map<String, Object> map, HttpSession session) {
		 //System.out.println(map);
		int result = 0;
		// 로그인 했다면
		if(session.getAttribute("mid") != null) {
			// bno & cno 값이 제대로 들어간다면 댓글삭제 진행
			 if( (map.get("bno") != null && map.get("cno") != null) &&
				!(map.get("bno").equals("")) && !(map.get("cno").equals(""))){
				 
				 map.put("mid", session.getAttribute("mid"));
				 //System.out.println(map);
				 result = threadService.cedit(map);
				 //System.out.println(result);
				 
				 return "redirect:/comment?bno=" + map.get("bno");
			 } else {
				 return "redirect:/board";
			 }
		}
		 return "redirect:/login";
	 }
	
		// 댓글 좋아요
	 @ResponseBody
	 @PostMapping("/clikeUp")
	 public String clikeUp(@RequestParam Map<String, Object> map, HttpSession session) {
		 int result = 0;
		 JSONObject json = new JSONObject();
		 
		 // 클릭한 bno&cno&mid에 대해 clikeon을 1으로 바꾼다.
		 if (session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			
			result = threadService.clikeUp(map);
			System.out.println(result);
			json.put("result", result);
			
		 }
		 return json.toString();
	 }
	 
	
	
}
