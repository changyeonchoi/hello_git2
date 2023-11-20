package com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/BT")
public class FrontController {

	@RequestMapping("/main")
	public String main() {
		return "main";
	}
}
