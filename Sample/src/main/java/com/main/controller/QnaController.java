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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.main.service.CommentService;
import com.main.service.HeartService;
import com.main.service.PageNavigigationService;
import com.main.service.QnaService;
import com.main.vo.CommentVo;
import com.main.vo.MemberVo;
import com.main.vo.QnaVo;

@Controller
public class QnaController {
	
	//게시판
	@Autowired
	QnaService qnaservice;
	//댓글
	@Autowired
	CommentService commentservice;
	
	@Autowired
	HeartService heartservice;
	//페이징
	@Autowired
	PageNavigigationService pagenavigigationservice;
	//파일
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/fashionqnalist" , method = {RequestMethod.GET, RequestMethod.POST})
	public String qnalist (Model model, HttpSession session, HttpServletRequest request
			, QnaVo qnavo
			, @RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo
			, @RequestParam(name = "listSize", defaultValue = "10") int listSize
    		, @RequestParam(name = "naviSize", defaultValue = "10") int naviSize
			, @RequestParam(value = "search", defaultValue = "") String search
			, @RequestParam(value = "seq_id", required=false) Integer seq_id
			, @RequestParam(value = "code", defaultValue="fashion") String code
			) {
	    
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		
	    // 세션이 없을 경우 빈 MemberVo 객체 생성
	    if (membervo == null) {
	        membervo = new MemberVo();
	    }
		
	 	String returnUrl = "/fashionqnalist";

	    Map<String, Object> keyword = new HashMap<String, Object>();
    	keyword.put("search", search);
    	keyword.put("code", code);
    	
    	// 총 갯수
    	int totalCount = qnaservice.QnaTotalCount(keyword);
    	
    	model.addAttribute("totalCount", totalCount);
    	
    	Map<String, Object> heartqnacnt = new HashMap<String, Object>();
	    heartqnacnt.put("seq_id", seq_id);
	    heartqnacnt.put("user_id", membervo.getUser_id());
    	
    	// 찜하기 갯수
    	int heartCount = heartservice.selectqnaheartCount(heartqnacnt);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("pageNo", pageNo);
    	map.put("totalCount", totalCount);
    	map.put("listSize", listSize);
    	map.put("naviSize", naviSize);
    	map.put("search", search);
    	map.put("code", code);
    	map.put("heartCount", heartCount);
    	
    	// 해당 pageNavigation에서 html code생성
    	PageNavigation pageNavigation = new PageNavigation(map);
    	map.put("startRow", pageNavigation.getStartRow());
    	map.put("endRow", pageNavigation.getEndRow());
    	
    	// 페이지 네비게이션 객체 생성
    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
		// 각 상품 리스트 
    	List<QnaVo> qnaList = qnaservice.selectQnaFashionList(map);
    	
    	System.out.println("qnaList" + qnaList);
    	
    	model.addAttribute("pageAttribute", map);
    	model.addAttribute("qnaList", qnaList);
    	model.addAttribute("navigation", navigation);
    	
    	return returnUrl;
	}

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
	        @RequestParam(value = "code", defaultValue="fashion") String code,
	        @RequestParam(value = "user_id", required = false) MultipartFile user_id) throws IOException {
		
	    Map<String, Object> Cmt = new HashMap<String, Object>();
	    Cmt.put("code", code);
	    Cmt.put("seq_id", seq_id);
    	
    	// 총 갯수
    	int totalCount = commentservice.CmtTotalCount(Cmt);
    	
    	model.addAttribute("totalCount",totalCount);

	    qnavo = qnaservice.detailQnaFashion(seq_id);
	    
	    
	    model.addAttribute("qnavo", qnavo);
	    
	    MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
	    
	    String uploadUrl = qnavo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
	    qnavo.setFile_img(uploadUrl);
	    
	    Map<String, Object> heartqnacnt = new HashMap<String, Object>();
	    heartqnacnt.put("seq_id", seq_id);
	    heartqnacnt.put("user_id", membervo.getUser_id());
    	
    	// 찜하기 갯수
    	int heartCount = heartservice.selectqnaheartCount(heartqnacnt);
    	
      	model.addAttribute("heartCount" , heartCount);
    	
	    String userId = qnavo.getUser_id();

	    String MuserId = membervo.getUser_id();


	    return "fashionqnadetail";

	}
	
	@RequestMapping(value="/fashionupdateqna", method = {RequestMethod.GET, RequestMethod.POST})
	public String fashionupdateqna(QnaVo qnavo, Model model, HttpServletRequest request,
			@RequestParam(value = "seq_id", required = false) Integer seq_id,
			@RequestParam(value = "file_img", required = false) MultipartFile file_img,
			@RequestParam(value = "user_id", required = false) MultipartFile user_id) throws IOException {
		
		qnavo = qnaservice.detailQnaFashion(seq_id);
		
		model.addAttribute("qnavo", qnavo);
		
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		
		String uploadUrl = qnavo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
		qnavo.setFile_img(uploadUrl);
		String userId = qnavo.getUser_id();
		
		String MuserId = membervo.getUser_id();
		
		
		return "fashionupdateqna";
		
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
			, @RequestParam(value = "seq_id", required=false) Integer seq_id
			, @RequestParam(value = "code", defaultValue="accessory") String code
			) {
		
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		
	    // 세션이 없을 경우 빈 MemberVo 객체 생성
	    if (membervo == null) {
	        membervo = new MemberVo();
	    }
		
		
	 	String returnUrl = "/accessoryqnalist";

	    Map<String, Object> keyword = new HashMap<String, Object>();
    	keyword.put("search", search);
    	keyword.put("code", code);
    	
    	// 총 갯수
    	int totalCount = qnaservice.QnaTotalCount(keyword);
    	
    	model.addAttribute("totalCount", totalCount);
    	
    	Map<String, Object> heartqnacnt = new HashMap<String, Object>();
	    heartqnacnt.put("seq_id", seq_id);
	    heartqnacnt.put("user_id", membervo.getUser_id());
    	
    	// 찜하기 갯수
    	int heartCount = heartservice.selectqnaheartCount(heartqnacnt);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("pageNo", pageNo);
    	map.put("totalCount", totalCount);
    	map.put("listSize", listSize);
    	map.put("naviSize", naviSize);
    	map.put("search", search);
    	map.put("code", code);
    	map.put("heartCount", heartCount);
    	
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
	        @RequestParam(value = "code", defaultValue="accessory") String code,
	        @RequestParam(value = "user_id", required = false) MultipartFile user_id) throws IOException {
		
	    Map<String, Object> Cmt = new HashMap<String, Object>();
	    Cmt.put("code", code);
	    Cmt.put("seq_id", seq_id);
    	
	    
	    System.out.println("codecode" + code);
    	// 총 갯수
    	int totalCount = commentservice.CmtTotalCount(Cmt);
    	
    	model.addAttribute("totalCount", totalCount);
	    
	    qnavo = qnaservice.detailQnaAccessory(seq_id);
	    
	    model.addAttribute("qnavo", qnavo);
	    
	    System.out.println(qnavo);
	    
	    MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
	    
	    String uploadUrl = qnavo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
	    qnavo.setFile_img(uploadUrl);

	    return "accessoryqnadetail";
	    
	}
	
	@RequestMapping(value="/accessoryupdateqna", method = {RequestMethod.GET, RequestMethod.POST})
	public String accessoryupdateqna(QnaVo qnavo, Model model, HttpServletRequest request,
			@RequestParam(value = "seq_id", required = false) Integer seq_id,
			@RequestParam(value = "file_img", required = false) MultipartFile file_img,
			@RequestParam(value = "user_id", required = false) MultipartFile user_id) throws IOException {
		
		qnavo = qnaservice.detailQnaFashion(seq_id);
		
		model.addAttribute("qnavo", qnavo);
		
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		
		String uploadUrl = qnavo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
		qnavo.setFile_img(uploadUrl);
		String userId = qnavo.getUser_id();
		
		String MuserId = membervo.getUser_id();
		
		
		return "accessoryupdateqna";
		
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
		
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		
	    // 세션이 없을 경우 빈 MemberVo 객체 생성
	    if (membervo == null) {
	        membervo = new MemberVo();
	    }
	    
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
	        @RequestParam(value = "code", defaultValue="makeup") String code,
	        @RequestParam(value = "user_id", required = false) String user_id) throws IOException {

		 Map<String, Object> Cmt = new HashMap<String, Object>();
		    Cmt.put("code", code);
		    Cmt.put("seq_id", seq_id);
	    	
		    
		    System.out.println("codecode" + code);
	    	// 총 갯수
	    	int totalCount = commentservice.CmtTotalCount(Cmt);
	    	
	    	model.addAttribute("totalCount", totalCount);
		    
		    qnavo = qnaservice.detailQnaAccessory(seq_id);
		    
		    model.addAttribute("qnavo", qnavo);
		    
		    System.out.println(qnavo);
		    
		    MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		    
		    String uploadUrl = qnavo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
		    qnavo.setFile_img(uploadUrl);

		    return "makeupqnadetail";
	}
	
	@RequestMapping(value="/makeupupdateqna", method = {RequestMethod.GET, RequestMethod.POST})
	public String makeupupdateqna(QnaVo qnavo, Model model, HttpServletRequest request,
			@RequestParam(value = "seq_id", required = false) Integer seq_id,
			@RequestParam(value = "file_img", required = false) MultipartFile file_img,
			@RequestParam(value = "user_id", required = false) MultipartFile user_id) throws IOException {
		
		qnavo = qnaservice.detailQnaFashion(seq_id);
		
		model.addAttribute("qnavo", qnavo);
		
		System.out.println(qnavo);
		
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		
		String uploadUrl = qnavo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
		qnavo.setFile_img(uploadUrl);
		String userId = qnavo.getUser_id();
		
		String MuserId = membervo.getUser_id();
		
		
		return "makeupupdateqna";
		
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
			, @RequestParam(value = "qna_pw", required = false) String qna_pw
			, @RequestParam(value = "code", defaultValue="makeup") String code) throws IOException {
		
		
		QnaVo qnavo = new QnaVo();
		qnavo.setQna_title(qna_title);
		qnavo.setFile_img(file_img, uploadPath, qnavo.getFile_img());
		qnavo.setQna_detail(qna_detail);
		qnavo.setQna_like_yn(qna_like_yn);
		qnavo.setSeq_id(seq_id);
		qnavo.setQna_pw(qna_pw);
		
		qnaservice.makeupqnaupdate(qnavo);
		
		System.out.println("수정" + qnavo);
		
		return "/makeupqnalist";
	}
	
	@RequestMapping(value="/commentpopup", method = {RequestMethod.GET, RequestMethod.POST})
	public String commentpopup(Model model, HttpServletRequest request,
			@RequestParam(value = "code", required = false) String code,
			@RequestParam(value = "comment_content", required = false) String comment_content,
			@RequestParam(value = "user_id", required = false) String user_id,
			@RequestParam(value = "comment_id", required = false) Integer comment_id,
			@RequestParam(value = "seq_id") Integer seq_id
			) {
		
		System.out.println(seq_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("comment_content", comment_content);
		map.put("user_id", user_id);
		map.put("comment_id", comment_id);
		map.put("seq_id", seq_id);
		List<CommentVo> commentvo = commentservice.selectComment(map);
		 
		model.addAttribute("commentvo", commentvo);
		
		System.out.println(commentvo);
		
		return "/commentpopup";
	}
	
	@RequestMapping(value="/commentinsert", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public CommentVo commentinsert(
	        @RequestParam(value = "user_id", required = false) String user_id,
	        @RequestParam(value = "seq_id", required = false) String seq_idStr,
	        @RequestParam(value = "comment_content", required = false) String comment_content,
	        @RequestParam(value = "code", required = false) String code,
	        Model model, HttpServletRequest request) {

	    MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");

	    Integer seq_id = null;
	    try {
	        seq_id = Integer.parseInt(seq_idStr);
	    } catch (NumberFormatException e) {
	        // 변환 실패 시 기본값 설정 또는 에러 처리
	        System.out.println("실패");
	    }

	    CommentVo commentvo = new CommentVo();
	    commentvo.setUser_id(membervo.getUser_id());
	    commentvo.setSeq_id(seq_id);
	    commentvo.setComment_content(comment_content);
	    commentvo.setCode(code);
	    

	    commentservice.insertComment(commentvo);

	    return commentvo;
	}
}
