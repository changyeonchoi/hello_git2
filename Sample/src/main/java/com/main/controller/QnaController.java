//package com.main.controller;
//
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.main.service.PageNavigigationService;
//import com.main.service.QnaService;
//import com.main.vo.MemberVo;
//import com.main.vo.ProductVo;
//import com.main.vo.QnaVo;
//
//@Controller
//public class QnaController {
//	
//	@Autowired
//	QnaService qnaservice;
//	
//	@Autowired
//	PageNavigigationService pagenavigigationservice;
//	
//	@Resource(name="uploadPath")
//	private String uploadPath;
//	
//	@RequestMapping(value = "/{type}", method = {RequestMethod.GET, RequestMethod.POST})
//	public String product(Model model, HttpSession session, HttpServletRequest request,
//		@RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo,
//		@RequestParam(name = "listSize", defaultValue = "10") int listSize,
//    	@RequestParam(name = "naviSize", defaultValue = "20") int naviSize,
//		@RequestParam(value = "search", defaultValue = "") String search,
//	    @RequestParam(value = "seq_id", required=false) String seq_id,
//	    @RequestParam(value = "code", required=false) String code,
//	    @PathVariable(name = "type") String type,
//	    QnaVo qnavo
//		) throws IOException {
//		
//		String returnUrl = null;
//		
//		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
//
//	    if (type.startsWith("fashion")) {
//	        code = "fashion";
//	    } else if (type.startsWith("makeup")) {
//	        code = "makeup";
//	    } else if (type.startsWith("accessory")) {
//	        code = "accessory";
//	    } else {
//	    	code = "main";
//	    }
//	    
//	    Map<String, Object> keyword = new HashMap<String, Object>();
//    	keyword.put("search", search);
//    	keyword.put("code", code);
//    	
//    	int totalCount = qnaservice.selectTotalCount(keyword);
//    	
//    	Map<String, Object> map = new HashMap<String, Object>();
//    	map.put("pageNo", pageNo);
//    	map.put("totalCount", totalCount);
//    	map.put("listSize", listSize);
//    	map.put("naviSize", naviSize);
//    	map.put("search", search);
//    	map.put("code", code);
//    	
//    	PageNavigation pageNavigation = new PageNavigation(map);
//    	map.put("startRow", pageNavigation.getStartRow());
//    	map.put("endRow", pageNavigation.getEndRow());
//    	
//    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
//    	
//    	
//    	List<QnaVo> qnaList = qnaservice.selectQnaList(map);
//
//    	
//    	
//	    return returnUrl;
//	}
//}
