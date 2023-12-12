package com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
//@RequestMapping(value = "/BT")
public class ProductController {

	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/{type}", method = {RequestMethod.GET, RequestMethod.POST})
	public String product(
			@PathVariable String type,
			@RequestParam(value = "code", required=false) String code) {
		
		String returnUrl = null;
		
	    if (type.startsWith("fashion")) {
	        code = "fashion";
	    } else if (type.startsWith("makeup")) {
	        code = "makeup";
	    } else if (type.startsWith("accessory")) {
	        code = "accessory";
	    }
		
	    System.out.println(code);
	    
		if("fashion".equals(code)) {
			
			if("fashionproduct".equals(type)) {
				
				returnUrl = "/fashionproduct";
				
			} else if("fashiondetail".equals(code)) {
				
				returnUrl = "/fashiondetail";
			}
		}
		return returnUrl;
	}
}
