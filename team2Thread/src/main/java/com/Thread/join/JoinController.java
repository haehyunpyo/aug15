package com.Thread.join;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Thread.index.Util;


@Controller
public class JoinController {

	@Autowired
	private JoinService joinService;
	
	@Autowired
	private Util util;
	
	@GetMapping("/join")
	public String join() {
		return "join";
	}

	@PostMapping("/join")
	public String join(@RequestParam Map<String, Object> map) {
		//System.out.println("jsp에서 오는 값: " + joindto.getGender());
		//System.out.println("jsp에서 오는 값: " + joindto.getBirth());
		System.out.println(map.toString());
		int result = joinService.join(map);
		
		//가입하면 1 리턴
		System.out.println(result);
		if(result == 1) { 
			
			return "join"; //나중에 수정해야 합니다.
		 	
		} else {
			return "join"; //이것도 수정해야 합니다.
		}
	}

	
	
	
}
