package com.main.controller;


import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/save")
	public String save() {
		return "save";
	}
	
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
	public @ResponseBody boolean signup(
	        @RequestParam("user_id") String user_id,
	        @RequestParam("user_pw") String user_pw,
	        @RequestParam("user_name") String user_name,
	        @RequestParam("user_phone") String user_phone,
	        @RequestParam("user_address") String user_address) {

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
//	@RequestMapping("/signupCheck")
//	public @ResponseBody boolean signup(
//			@RequestParam("user_id") String user_id,
//			@RequestParam("user_pw") String user_pw,
//			@RequestParam("user_name") String user_name,
//			@RequestParam("user_phone") String user_phone,
//			@RequestParam("user_address") String user_address
//			) {
//		
//		boolean checkResult = memberservice.signupCheck(user_id);
//		
//		boolean result;
//		
//		if(checkResult) {
//			MemberVo membervo = new MemberVo();
//			try { 
//				membervo.setUser_id(user_id);
//				membervo.setUser_pw(user_pw);
//				membervo.setUser_name(user_name);
//				membervo.setUser_phone(user_phone);
//				membervo.setUser_address(user_address);
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//			memberservice.signupSuccess(membervo);
//			result = true;
//		} else {
//			result = false;
//		}
//		return result;
//	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody String login(
			@RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw,
			HttpServletRequest request) {
		
		String login;
		MemberVo membervo = new MemberVo();
		
	
		membervo.setUser_id(user_id);
		membervo.setUser_pw(user_pw);
		
		MemberVo result = memberservice.login(membervo);
		
		request.getSession().setAttribute("memberVo", result);
		
		login = "redirect:/main";
		
		return "";
	}
	
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> login(
//	        @RequestParam("user_id") String user_id,
//	        @RequestParam("user_pw") String user_pw,
//	        HttpServletRequest request) {
//
//	    MemberVo membervo = new MemberVo();    
//	    membervo.setUser_id(user_id);
//	    membervo.setUser_pw(user_pw);
//	    
//	    MemberVo result = memberservice.login(membervo);
//	                    
//	    request.getSession().setAttribute("memberVo", result);
//
//	    // 리다이렉트할 URL을 포함한 응답 데이터
//	    Map<String, Object> response = new HashMap<>();
//	    
//	    // MemberVo에서 user_auth 값을 가져와서 응답 데이터에 추가
//	    response.put("user_auth", result.getUser_auth());
//	    
//	    return response;
//	}
	
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
	public @ResponseBody boolean loginCheck(
			@RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw) {
		
		MemberVo membervo = new MemberVo();
		membervo.setUser_id(user_id);
		membervo.setUser_pw(user_pw);
		
		boolean check = memberservice.loginCheck(membervo);
	
		return check;
	}
	
//	@RequestMapping(value = "/userstatus", method = RequestMethod.GET)
//	public String userstatus() {
//		return "userstatus";
//	}
	
//	@RequestMapping(value = "/userstatus", method = RequestMethod.POST)
//	public @ResponseBody String loginuser(String user_id, Model model) {
//		
//		MemberVo membervo = memberservice.selectMemberdetail(user_id);
//		
//		model.addAttribute("membervo", membervo);
//		
//		return "userstatus";
//	}
//	
//	@RequestMapping(value = "/newuserstatus", method = RequestMethod.GET)
//		public String newuserstatus() {
//			return "newuserstatus";
//		}
//	
//    @RequestMapping(value = "/adminlist", method = RequestMethod.GET)
//    public @ResponseBody ModelAndView admin(Model model, HttpServletRequest request,
//    		@RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo,
//    		@RequestParam(name = "listSize", defaultValue = "10") int listSize,
//    		@RequestParam(name = "naviSize", defaultValue = "20") int naviSize,
//    		@RequestParam(value = "search", defaultValue = "") String search
//    		) {
//    	Map<String, Object> keyword = new HashMap<String, Object>();
//    	keyword.put("search", search);
//    	
//    	int totalCount = memberservice.selectTotalCount(keyword);
//    	
//    	
//    	Map<String, Object> map = new HashMap<String, Object>();
//    	map.put("pageNo", pageNo);
//    	map.put("totalCount", totalCount);
//    	map.put("listSize", listSize);
//    	map.put("naviSize", naviSize);
//    	map.put("search", search);
//
//    	// 계산된 startRow와 endRow를 Map에 추가
//        PageNavigation pageNavigation = new PageNavigation(map);
//        map.put("startRow", pageNavigation.getStartRow());
//        map.put("endRow", pageNavigation.getEndRow());
//    	
//    	model.addAttribute("pageAttribute", map);
//    	
//    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
//    	
//    	model.addAttribute("navigation", navigation);
//    	
//    	List<MemberVo> memberList = memberservice.selectMemberList(map);
//    	
//    	model.addAttribute("member", memberList);
//    	
//    	ModelAndView mv = new ModelAndView("admin");
//    	
//    	return mv;
//    }
	
	// 관리자현황 검색
//    @RequestMapping(value = "/adminlist", method = RequestMethod.POST)
//    public ResponseEntity<List<MemberVo>> searchMembers(@RequestParam(value = "search", required = false) String search) {
//        
//    	Map<String, Object> map = new HashMap<String, Object>();
//    	map.put("search", search);
//    	
//    	
//    	List<MemberVo> memberList = memberservice.selectMemberList(map);
//    	
//        return ResponseEntity.ok(memberList);
//    }
//	   @RequestMapping(value = "/adminlist", method = RequestMethod.POST)
//	    public ResponseEntity<Object> handleAdminRequest(
//	            @RequestParam(name = "page", defaultValue = "1") int page,
//	            @RequestParam(name = "pageSize", defaultValue = "10") int pageSize,
//	            @RequestParam(value = "search", required = false) String search) {
//
//	        if (search != null) {
//	            // POST 요청에서 검색을 수행하고 JSON 응답 반환
//	            List<MemberVo> memberList = memberservice.selectMemberList(search);
//	            return ResponseEntity.ok(memberList);
//	        } else {
//	            // POST 요청에서 페이지 로딩 처리 후 JSON 응답 반환
//	            PagingVo pagingVo = memberservice.createPagingVo(page, pageSize);
//	            List<MemberVo> memberList = memberservice.getMemberListPaging(pagingVo.getStartIndex(), pagingVo.getPageSize());
//	            int totalMembers = memberservice.getTotalMembers();
//	            
//	            Map<String, Object> responseData = new HashMap<>();
//	            responseData.put("member", memberList);
//	            responseData.put("pagingVO", pagingVo);
//	            responseData.put("totalMembers", totalMembers);
//	            return ResponseEntity.ok(responseData);
//	        }
//	    }
    
    // 관리자현황 상세보기
//    @RequestMapping(value = "/adminupdate", method = RequestMethod.GET)
//    public String update(String user_id, String user_name,Model model) {
//    	
//    	MemberVo membervo = memberservice.selectMemberdetail(user_id);
//    	
//    	model.addAttribute("membervo", membervo);
//    	
//    	return "/adminupdate";
//    }
    
    // 관리자삭제
//    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
//    public ResponseEntity<String> deleteUser(@RequestParam("user_id") String user_id) {
//        // 사용자 삭제를 수행하는 서비스 메서드 호출
//        int deletedRows = memberservice.deleteUserId(user_id);
//        
//        if (deletedRows > 0) {
//            // 삭제 성공 시 응답
//            return ResponseEntity.ok("사용자가 삭제되었습니다.");
//        } else {
//            // 삭제 실패 시 응답
//            return ResponseEntity.status(500).body("사용자 삭제에 실패하였습니다.");
//        }
//    }
    
//    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
//    public ResponseEntity<Object> updateUser(@RequestBody MemberVo membervo) {
//        // 받아온 사용자 정보를 가지고 업데이트 로직을 수행합니다.
//        // 여기에서는 간단한 예시로 출력만 하겠습니다.
//                membervo.getUser_name() +
//                ", " + membervo.getUser_phone() +
//                ", " + membervo.getUser_pw() +
//                ", " + membervo.getUser_id() +
//                ", " + membervo.getUser_auth());
//
//        try {
//             memberservice.updateUser(membervo); // 실제로는 업데이트 로직을 수행해야 합니다.
//            // 성공적으로 수정되었을 경우
//            return ResponseEntity.ok().body("{\"status\":\"success\"}");
//        } catch (Exception e) {
//            // 수정에 실패한 경우
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
//        }
//    }
}

