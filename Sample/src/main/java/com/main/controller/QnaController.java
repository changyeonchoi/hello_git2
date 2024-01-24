package com.main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.main.service.PageNavigigationService;
import com.main.service.QnaService;
import com.main.vo.MemberVo;
import com.main.vo.QnaVo;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qnaservice;
	
	@Autowired
	PageNavigigationService pagenavigigationservice;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/fashionqnalist" , method = {RequestMethod.GET, RequestMethod.POST})
	public String qnalist (Model model, HttpSession session, HttpServletRequest request
			, QnaVo qnavo
			, @RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo
			, @RequestParam(name = "listSize", defaultValue = "10") int listSize
    		, @RequestParam(name = "naviSize", defaultValue = "10") int naviSize
			, @RequestParam(value = "search", defaultValue = "") String search
			, @RequestParam(value = "code", defaultValue="fashion") String code) {
	    
	 	String returnUrl = "/fashionqnalist";

	    Map<String, Object> keyword = new HashMap<String, Object>();
    	keyword.put("search", search);
    	keyword.put("code", code);
    	
    	// 총 갯수
    	int totalCount = qnaservice.QnaTotalCount(keyword);
    	
    	model.addAttribute("totalCount", totalCount);

    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("pageNo", pageNo);
    	map.put("totalCount", totalCount);
    	map.put("listSize", listSize);
    	map.put("naviSize", naviSize);
    	map.put("search", search);
    	map.put("code", code);
    	
    	// 해당 pageNavigation에서 html code생성
    	PageNavigation pageNavigation = new PageNavigation(map);
    	map.put("startRow", pageNavigation.getStartRow());
    	map.put("endRow", pageNavigation.getEndRow());
    	
    	// 페이지 네비게이션 객체 생성
    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
		// 각 상품 리스트 
    	List<QnaVo> qnaList = qnaservice.selectQnaFashionList(map);
    	
    	model.addAttribute("pageAttribute", map);
    	model.addAttribute("qnaList", qnaList);
    	model.addAttribute("navigation", navigation);
    	
    	return returnUrl;
	}

	
//	@RequestMapping(value="/fashionqnaenroll" , method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody
//	public String fashionqnainsert (HttpSession session, Model model,MultipartHttpServletRequest request,
//		 @RequestParam(value = "user_id", required=false) String user_id
////		String user_id, String qna_title, String qna_detail, String qna_like_yn, String code
//		, @RequestParam(value = "qna_title", required=false) String qna_title
//		, @RequestParam(value = "file_img", required=false) List<MultipartFile> file_img
////		, MultipartFile file_img
//		, @RequestParam(value = "qna_detail", required=false) String qna_detail
//		, @RequestParam(value = "qna_like_yn", required=false) String qna_like_yn
//		, @RequestParam(value = "code", required=false) String code
////		, @RequestParam HashMap<String, Object> param
//		) throws IOException {
//		
//		String returnUrl = "/fashionqnainsert";
//		
//	 	// 로그인 세션 가져오기
//		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
//		QnaVo qnavo = new QnaVo();
//		qnavo.setUser_id(membervo.getUser_id());
//		qnavo.setQna_title(request.getParameter("qna_title"));
//		qnavo.setFile_img(request.getFiles("file_img").get(0), uploadPath, qnavo.getFile_img());
//		qnavo.setQna_detail(request.getParameter("qna_detail"));
//		qnavo.setQna_like_yn(request.getParameter("qna_like_yn"));
//		
//	    System.out.println("user_id: " + user_id);
//	    System.out.println("qna_title: " + qna_title);
////	    System.out.println("file_img: " + file_img);
//	    System.out.println("qna_detail: " + qna_detail);
//	    System.out.println("qna_like_yn: " + qna_like_yn);
//	    System.out.println("code: " + code);
////	    System.out.println(param);
//		System.out.println("등록수행 전" + qnavo);
//		
//		qnaservice.insertqna(qnavo);
//		
//		System.out.println("등록수행후" + qnavo);
//
//		return returnUrl;
//	}
	@RequestMapping(value="/fashionqnaenroll" , method = {RequestMethod.GET, RequestMethod.POST})
	public String fashionqnainsert (HttpSession session, Model model,HttpServletRequest request
		, @RequestParam(value = "user_id", required=false) String user_id
		, @RequestParam(value = "qna_title", required=false) String qna_title
		, @RequestParam(value = "file_img", required=false) MultipartFile file_img
		, @RequestParam(value = "qna_detail", required=false) String qna_detail
		, @RequestParam(value = "qna_like_yn", required=false) String qna_like_yn
		, @RequestParam(value = "code", required=false) String code
		) throws IOException {
		
		String returnUrl = "/fashionqnainsert";
		
		// 로그인 세션 가져오기
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		QnaVo qnavo = new QnaVo();
		qnavo.setUser_id(membervo.getUser_id());
		qnavo.setQna_title(qna_title);
		qnavo.setFile_img(file_img, uploadPath, qnavo.getFile_img());
		qnavo.setQna_detail(qna_detail);
		qnavo.setQna_like_yn(qna_like_yn);
		qnavo.setCode(code);
		
		qnaservice.insertQnaFashion(qnavo);
		
		return returnUrl;
	}
	
	@RequestMapping(value="/fashionqnadetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String fashionqnadetail(QnaVo qnavo, Model model, HttpServletRequest request,
	        @RequestParam(value = "seq_id", required = false) Integer seq_id,
	        @RequestParam(value = "file_img", required = false) MultipartFile file_img,
	        @RequestParam(value = "user_id", required = false) MultipartFile user_id) throws IOException {

	    qnavo = qnaservice.detailQnaFashion(seq_id);
	    
	    model.addAttribute("qnavo", qnavo);
	    
	    MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
	    
	    String uploadUrl = qnavo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
	    qnavo.setFile_img(uploadUrl);
	    String userId = qnavo.getUser_id();

	    if (membervo == null) {
	        return "fashionqnadetail";
	    }

	    String MuserId = membervo.getUser_id();

	    if (userId.equals(MuserId) && MuserId != null) {
	        return "fashionqnauserdetail";
	    } else {
	        return "fashionqnadetail";
	    }
	}
	
	@RequestMapping(value="/fashionqnaupdate", method = {RequestMethod.GET, RequestMethod.POST})
	public String fashionqnaupdate(Model model, HttpServletRequest request,
			@RequestParam(value = "qna_title", required = false) String qna_title
			, @RequestParam(value = "file_img", required = false) MultipartFile file_img
			, @RequestParam(value = "qna_detail", required = false) String qna_detail
			, @RequestParam(value = "qna_like_yn", required = false) String qna_like_yn
			, @RequestParam(value = "seq_id", required = false) Integer seq_id
			, @RequestParam(value = "code", defaultValue="fashion") String code) throws IOException {
		
		
		QnaVo qnavo = new QnaVo();
		qnavo.setQna_title(qna_title);
		qnavo.setFile_img(file_img, uploadPath, qnavo.getFile_img());
		qnavo.setQna_detail(qna_detail);
		qnavo.setQna_like_yn(qna_like_yn);
		qnavo.setSeq_id(seq_id);
		
		qnaservice.fashionqnaupdate(qnavo);
		
		return "/fashionqnalist";
	}
	
	@RequestMapping(value="/accessoryqnalist" , method = {RequestMethod.GET, RequestMethod.POST})
	public String accessorylist (Model model, HttpSession session, HttpServletRequest request
			, QnaVo qnavo
			, @RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo
			, @RequestParam(name = "listSize", defaultValue = "10") int listSize
    		, @RequestParam(name = "naviSize", defaultValue = "10") int naviSize
			, @RequestParam(value = "search", defaultValue = "") String search
			, @RequestParam(value = "code", defaultValue="accessory") String code) {
	    
	 	String returnUrl = "/accessoryqnalist";

	    Map<String, Object> keyword = new HashMap<String, Object>();
    	keyword.put("search", search);
    	keyword.put("code", code);
    	
    	// 총 갯수
    	int totalCount = qnaservice.QnaTotalCount(keyword);
    	
    	model.addAttribute("totalCount", totalCount);

    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("pageNo", pageNo);
    	map.put("totalCount", totalCount);
    	map.put("listSize", listSize);
    	map.put("naviSize", naviSize);
    	map.put("search", search);
    	map.put("code", code);
    	
    	// 해당 pageNavigation에서 html code생성
    	PageNavigation pageNavigation = new PageNavigation(map);
    	map.put("startRow", pageNavigation.getStartRow());
    	map.put("endRow", pageNavigation.getEndRow());
    	
    	// 페이지 네비게이션 객체 생성
    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
		// 각 상품 리스트 
    	List<QnaVo> qnaList = qnaservice.selectQnaAccessoryList(map);
    	
    	model.addAttribute("pageAttribute", map);
    	model.addAttribute("qnaList", qnaList);
    	model.addAttribute("navigation", navigation);
    	
    	return returnUrl;
	}
	
	@RequestMapping(value="/accessoryqnaenroll" , method = {RequestMethod.GET, RequestMethod.POST})
	public String accessoryqnainsert (HttpSession session, Model model,HttpServletRequest request
		, @RequestParam(value = "user_id", required=false) String user_id
		, @RequestParam(value = "qna_title", required=false) String qna_title
		, @RequestParam(value = "file_img", required=false) MultipartFile file_img
		, @RequestParam(value = "qna_detail", required=false) String qna_detail
		, @RequestParam(value = "qna_like_yn", required=false) String qna_like_yn
		, @RequestParam(value = "code", required=false) String code
		) throws IOException {
		
		String returnUrl = "/accessoryqnainsert";
		
		// 로그인 세션 가져오기
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		QnaVo qnavo = new QnaVo();
		qnavo.setUser_id(membervo.getUser_id());
		qnavo.setQna_title(qna_title);
		qnavo.setFile_img(file_img, uploadPath, qnavo.getFile_img());
		qnavo.setQna_detail(qna_detail);
		qnavo.setQna_like_yn(qna_like_yn);
		qnavo.setCode(code);
		
		qnaservice.insertQnaAccessory(qnavo);
		
		return returnUrl;
	}
	
	@RequestMapping(value="/accessoryqnadetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String accessoryqnadetail(QnaVo qnavo, Model model, HttpServletRequest request,
	        @RequestParam(value = "seq_id", required = false) Integer seq_id,
	        @RequestParam(value = "file_img", required = false) MultipartFile file_img,
	        @RequestParam(value = "user_id", required = false) MultipartFile user_id) throws IOException {

	    qnavo = qnaservice.detailQnaAccessory(seq_id);
	    
	    model.addAttribute("qnavo", qnavo);
	    
	    MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
	    
	    String uploadUrl = qnavo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
	    qnavo.setFile_img(uploadUrl);
	    String userId = qnavo.getUser_id();

	    if (membervo == null) {
	        return "accessoryqnadetail";
	    }

	    String MuserId = membervo.getUser_id();

	    if (userId.equals(MuserId) && MuserId != null) {
	        return "accessoryqnauserdetail";
	    } else {
	        return "accessoryqnadetail";
	    }
	}
	
	@RequestMapping(value="/accessoryqnaupdate", method = {RequestMethod.GET, RequestMethod.POST})
	public String accessoryqnaupdate(Model model, HttpServletRequest request,
			@RequestParam(value = "qna_title", required = false) String qna_title
			, @RequestParam(value = "file_img", required = false) MultipartFile file_img
			, @RequestParam(value = "qna_detail", required = false) String qna_detail
			, @RequestParam(value = "qna_like_yn", required = false) String qna_like_yn
			, @RequestParam(value = "seq_id", required = false) Integer seq_id
			, @RequestParam(value = "code", defaultValue="fashion") String code) throws IOException {
		
		
		QnaVo qnavo = new QnaVo();
		qnavo.setQna_title(qna_title);
		qnavo.setFile_img(file_img, uploadPath, qnavo.getFile_img());
		qnavo.setQna_detail(qna_detail);
		qnavo.setQna_like_yn(qna_like_yn);
		qnavo.setSeq_id(seq_id);
		
		qnaservice.accessoryqnaupdate(qnavo);
		
		return "/accessoryqnalist";
	}
	
	@RequestMapping(value="/makeupqnalist" , method = {RequestMethod.GET, RequestMethod.POST})
	public String makeupqnalist (Model model, HttpSession session, HttpServletRequest request
			, QnaVo qnavo
			, @RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo
			, @RequestParam(name = "listSize", defaultValue = "10") int listSize
    		, @RequestParam(name = "naviSize", defaultValue = "10") int naviSize
			, @RequestParam(value = "search", defaultValue = "") String search
			, @RequestParam(value = "code", defaultValue="makeup") String code) {
	    
	 	String returnUrl = "/makeupqnalist";

	    Map<String, Object> keyword = new HashMap<String, Object>();
    	keyword.put("search", search);
    	keyword.put("code", code);
    	
    	// 총 갯수
    	int totalCount = qnaservice.QnaTotalCount(keyword);
    	
    	model.addAttribute("totalCount", totalCount);

    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("pageNo", pageNo);
    	map.put("totalCount", totalCount);
    	map.put("listSize", listSize);
    	map.put("naviSize", naviSize);
    	map.put("search", search);
    	map.put("code", code);
    	
    	// 해당 pageNavigation에서 html code생성
    	PageNavigation pageNavigation = new PageNavigation(map);
    	map.put("startRow", pageNavigation.getStartRow());
    	map.put("endRow", pageNavigation.getEndRow());
    	
    	// 페이지 네비게이션 객체 생성
    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
		// 각 상품 리스트 
    	List<QnaVo> qnaList = qnaservice.selectQnaMakeUpList(map);
    	
    	model.addAttribute("pageAttribute", map);
    	model.addAttribute("qnaList", qnaList);
    	model.addAttribute("navigation", navigation);
    	
    	return returnUrl;
	}
	
	@RequestMapping(value="/makeupqnadetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String makeupqnadetail(QnaVo qnavo, Model model, HttpServletRequest request,
	        @RequestParam(value = "seq_id", required = false) Integer seq_id,
	        @RequestParam(value = "file_img", required = false) MultipartFile file_img,
	        @RequestParam(value = "user_id", required = false) MultipartFile user_id) throws IOException {

	    qnavo = qnaservice.detailQnaMakeUp(seq_id);
	    
	    model.addAttribute("qnavo", qnavo);
	    
	    MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
	    
	    String uploadUrl = qnavo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
	    qnavo.setFile_img(uploadUrl);
	    String userId = qnavo.getUser_id();

	    if (membervo == null) {
	        return "makeupqnadetail";
	    }

	    String MuserId = membervo.getUser_id();

	    if (userId.equals(MuserId) && MuserId != null) {
	        return "makeupqnauserdetail";
	    } else {
	        return "makeupqnadetail";
	    }
	}
	
	@RequestMapping(value="/makeupqnaenroll" , method = {RequestMethod.GET, RequestMethod.POST})
	public String makeupqnainsert (HttpSession session, Model model,HttpServletRequest request
		, @RequestParam(value = "user_id", required=false) String user_id
		, @RequestParam(value = "qna_title", required=false) String qna_title
		, @RequestParam(value = "file_img", required=false) MultipartFile file_img
		, @RequestParam(value = "qna_detail", required=false) String qna_detail
		, @RequestParam(value = "qna_pw", required=false) String qna_pw
		, @RequestParam(value = "code", required=false) String code
		) throws IOException {
		
		String returnUrl = "/makeupqnainsert";
		
		// 로그인 세션 가져오기
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		QnaVo qnavo = new QnaVo();
		qnavo.setUser_id(membervo.getUser_id());
		qnavo.setQna_title(qna_title);
		qnavo.setFile_img(file_img, uploadPath, qnavo.getFile_img());
		qnavo.setQna_detail(qna_detail);
		qnavo.setQna_pw(qna_pw);
		qnavo.setCode(code);
		
		System.out.println(qna_pw);
		
		qnaservice.insertQnaMakeUp(qnavo);
		
		return returnUrl;
	}
	
	@RequestMapping(value="/makeupqnaupdate", method = {RequestMethod.GET, RequestMethod.POST})
	public String makeupqnaupdate(Model model, HttpServletRequest request,
			@RequestParam(value = "qna_title", required = false) String qna_title
			, @RequestParam(value = "file_img", required = false) MultipartFile file_img
			, @RequestParam(value = "qna_detail", required = false) String qna_detail
			, @RequestParam(value = "qna_like_yn", required = false) String qna_like_yn
			, @RequestParam(value = "seq_id", required = false) Integer seq_id
			, @RequestParam(value = "code", defaultValue="fashion") String code) throws IOException {
		
		
		QnaVo qnavo = new QnaVo();
		qnavo.setQna_title(qna_title);
		qnavo.setFile_img(file_img, uploadPath, qnavo.getFile_img());
		qnavo.setQna_detail(qna_detail);
		qnavo.setQna_like_yn(qna_like_yn);
		qnavo.setSeq_id(seq_id);
		
		qnaservice.makeupqnaupdate(qnavo);
		
		return "/makeupqnauplist";
	}
	
}
