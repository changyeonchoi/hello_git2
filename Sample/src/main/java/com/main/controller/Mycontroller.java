package com.main.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class Mycontroller {
	
	@RequestMapping(value="/mypage" , method = {RequestMethod.GET, RequestMethod.POST})
	public String mypage (Model model) {
		
		return "mypage";
	}
	@RequestMapping(value="/mypageproduct" , method = {RequestMethod.GET, RequestMethod.POST})
	public String mypageproduct (Model model) {
		
		return "mypageproduct";
	}
	@RequestMapping(value="/mypageqna" , method = {RequestMethod.GET, RequestMethod.POST})
	public String mypageqna (Model model) {
		
		return "mypageqna";
	}

}
