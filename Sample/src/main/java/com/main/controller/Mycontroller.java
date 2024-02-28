package com.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

public class Mycontroller {
	
	@RequestMapping(value="/mypage" , method = {RequestMethod.GET, RequestMethod.POST})
	public String mypage (Model model) {
		
		return "mypage";
	}
	@RequestMapping(value="/mypageproduct" , method = {RequestMethod.GET, RequestMethod.POST})
	public String mypageproduct (Model model) {
		
		return "mypageproduct";
	}
//	@RequestMapping(value="/mypageqnainsert" , method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	public String mypageqna (Model model,
//			 @RequestParam(value = "code", required = false) String code, HttpServletRequest request) {
//		
//		return "mypageqna";
//	}

}
