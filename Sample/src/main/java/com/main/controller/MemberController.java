package com.main.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.service.MemberService;
import com.main.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	MemberService memberservice;

	private MemberVo membervo;

	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}

	@RequestMapping("/signupCheck")
	public @ResponseBody boolean signupCheck(@RequestParam("user_id") String user_id) {
		// memberservice.signupCheck() 메서드는 user_id가 중복되는지 여부를 확인하는 메서드로 가정
		boolean checkResult = memberservice.signupCheck(user_id);
		return checkResult;
	}

	@RequestMapping("/postsignup")
	public @ResponseBody boolean signup(@RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw, @RequestParam("user_name") String user_name,
			@RequestParam("user_phone") String user_phone, @RequestParam("user_address") String user_address) {

		// 중복 체크
		boolean checkResult = memberservice.signupCheck(user_id);

		// 결과에 따라 회원가입 수행
		boolean result;
		if (checkResult) {
			MemberVo membervo = new MemberVo();
			membervo.setUser_id(user_id);
			membervo.setUser_pw(user_pw);
			membervo.setUser_name(user_name);
			membervo.setUser_phone(user_phone);
			membervo.setUser_address(user_address);

			// memberservice.signupSuccess() 메서드는 회원가입을 수행하는 메서드로 가정
			memberservice.signupSuccess(membervo);

			result = true;
		} else {
			result = false;
		}
		return result;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();

		session.invalidate();

		// 해당 페이지에서 로그아웃을 할 시 http hearder를 통해 해당페이지로 이동
		String referer = request.getHeader("Referer");
		if (referer != null) {
			return "redirect:" + referer;
		} else {
			// 만약 Referer가 없는 경우, 기본적으로 메인 페이지로 이동하도록 처리
			return "redirect:/main.jsp";
		}

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> login(@RequestParam("user_id") String user_id,
	        @RequestParam("user_pw") String user_pw, HttpServletRequest request) {

	    Map<String, String> response = new HashMap<>();

	    MemberVo membervo = new MemberVo();
	    membervo.setUser_id(user_id);
	    membervo.setUser_pw(user_pw);

	    MemberVo result = memberservice.login(membervo);

	    if (result != null) {
	        // 로그인 성공 시 세션에 사용자 정보 저장
	        HttpSession session = request.getSession();
	        session.setAttribute("membervo", result);

	        // "returnUrl" 파라미터 추출
	        String referer = request.getHeader("Referer");
	        int index = referer.indexOf("returnUrl=");
	        if (index != -1) {
	            String returnUrl = referer.substring(index + 10);

	            // 추출한 returnUrl을 기반으로 새로운 URL 생성
	            if (!returnUrl.isEmpty()) {
	                // user_id와 함께 returnUrl로 리다이렉트
	                response.put("redirect", returnUrl + "?user_id=" + user_id);
	                return response;
	            }
	        }

	        // "returnUrl"이 없으면 기본적으로 main으로 이동
	        response.put("redirect", "/main");
	    }

	    return response;
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public ResponseEntity<String> idCheck(@RequestParam String user_id) {

		MemberVo membervo = new MemberVo();

		membervo.setUser_id(user_id);

		boolean idExists = memberservice.idCheck(membervo);

		if (idExists) {
			return ResponseEntity.ok("exists");
		} else {
			return ResponseEntity.ok("not_exists");
		}
	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public @ResponseBody boolean loginCheck(@RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw) {

		MemberVo membervo = new MemberVo();
		membervo.setUser_id(user_id);
		membervo.setUser_pw(user_pw);

		boolean check = memberservice.loginCheck(membervo);

		return check;
	}
}
