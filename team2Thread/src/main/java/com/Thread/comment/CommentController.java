package com.Thread.comment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Thread.index.ThreadDTO;
import com.Thread.index.Util;

@Controller
public class CommentController {

	@Autowired
	public CommentService commentService;
	
	@Autowired
	public Util util;

	
	
	@PostMapping("/comment")
	public String comment(@RequestParam Map<String, Object> map, HttpSession session) {

		if (session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			int result = commentService.commentsInsert(map);
			if (result == 1) {
				return "redirect:comment?bno=" + map.get("bno");
			} else {
				return "warning";
			}
		} else {
			return "warning";
		}

	}
	
	

	
	
	
	
}
