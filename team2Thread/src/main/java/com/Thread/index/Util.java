package com.Thread.index;

import org.springframework.stereotype.Component;

@Component
public class Util {
	// 문자열이 들어오면 숫자로 변경
	public int strToInt(String str) {
		int result = 0;
		try {
			result = Integer.parseInt(str);
		} catch (Exception e) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < str.length(); i++) {
				if (Character.isDigit(str.charAt(i))) {
					sb.append(str.charAt(i));
				}
			}
			result = Integer.parseInt(sb.toString());
		}
		return result;
	}
	
	//  < > 바꿈
	public String exchange(String str) {
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		return str;
	}

	// 숫자인지 확인
	public boolean isNum(Object obj) {
		try {
			Integer.parseInt(String.valueOf(obj));
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
