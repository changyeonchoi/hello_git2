package com.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.main.service.HeartService;
import com.main.service.PageNavigigationService;
import com.main.service.ProductService;
import com.main.service.QnaService;
import com.main.vo.CommentVo;
import com.main.vo.MemberVo;
import com.main.vo.OrderVo;
import com.main.vo.ProductVo;
import com.main.vo.QnaVo;



@Controller
public class MypageController {

	@Autowired
	HeartService heartservice;
	//게시판
	@Autowired
	QnaService qnaservice;
	//페이징
	@Autowired
	PageNavigigationService pagenavigigationservice;
	//상품
	@Autowired
	ProductService productservice;
	
	@RequestMapping(value = "mypage", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypage(Model model, HttpSession session, HttpServletRequest request
			, @RequestParam(value = "code", required=false) String code
			, @RequestParam(value = "file_img", required=false) MultipartFile file_img
			, @RequestParam(value = "detail_img", required=false) MultipartFile detail_img
			, @RequestParam(value = "product_name", required=false) String product_name
			, @RequestParam(value = "seq_id", required=false) Integer seq_id
			) {
		
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		
		if (membervo != null) {
            String user_id = membervo.getUser_id();
            
	    	Map<String, Object> heartcnt = new HashMap<String, Object>();
	    	heartcnt.put("seq_id", seq_id);
	    	heartcnt.put("user_id", user_id);
	    	
	    	// 찜하기 갯수
	    	int heartCount = heartservice.selectheartuserCount(heartcnt);
	    	
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("user_id", membervo.getUser_id());
	    	map.put("heartCount", heartCount);
	    	map.put("code", code);
	    	
	    	List<ProductVo> productList = heartservice.selectheartProductList(map);
	    	
	    	int numberOfItemsToDisplay = 8;
	    	
	    	// 리스트 이미지에 값이 8개 미만인 경우 해당 이미지 노출
			String dummyFilePath = "C:\\temp_file\\상품준비중.jpg";
			String readyPath = dummyFilePath.replaceAll("C:\\\\", "\\\\images\\\\");

			if (productList.size() < numberOfItemsToDisplay) {
			    int itemsToDisplay = productList.size();
			    for (int i = 0; i < numberOfItemsToDisplay - itemsToDisplay; i++) {
			        ProductVo dummyFashion = new ProductVo();
			        dummyFashion.setFile_img(readyPath);
			        dummyFashion.setBanner_title("상품 준비중");
			        productList.add(dummyFashion);
			    }
			}
	    	
			// 각 상품리스트 데이터 경로 c -> images
	    	for (int i = 0; i < productList.size(); i++) {
	    	    ProductVo product = productList.get(i);

	    	    if (product != null) {
	    	        // file_img 처리
	    	        String fileImg = product.getFile_img();
	    	        if (fileImg != null) {
	    	            String uploadPath = fileImg.replaceAll("C:\\\\", "\\\\images\\\\");
	    	            product.setFile_img(uploadPath);
	    	        }
	    	    }
	    	}
	    	
	    	model.addAttribute("productList", productList);
        }
		
		return "mypage";
	}
	
	@RequestMapping(value = "mypageqna", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypageqna(Model model, HttpSession session, HttpServletRequest request
			, QnaVo qnavo
			, @RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo
			, @RequestParam(name = "listSize", defaultValue = "10") int listSize
    		, @RequestParam(name = "naviSize", defaultValue = "10") int naviSize
			, @RequestParam(value = "search", defaultValue = "") String search
			, @RequestParam(value = "seq_id", required=false) Integer seq_id
			, @RequestParam(value = "code", required=false) String code) {
		
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		
		System.out.println(membervo);
		
		if (membervo != null) {
            String user_id = membervo.getUser_id();
            
	    	Map<String, Object> heartcnt = new HashMap<String, Object>();
	    	heartcnt.put("seq_id", seq_id);
	    	heartcnt.put("user_id", user_id);
	    	
	    	// 찜하기 갯수
	    	int totalCount = heartservice.selectheartqnaCount(heartcnt);
	    	
	    	System.out.println(totalCount);
	    	
	    	
		    Map<String, Object> keyword = new HashMap<String, Object>();
	    	keyword.put("search", search);
	    	keyword.put("code", code);
	    	
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("pageNo", pageNo);
	    	map.put("totalCount", totalCount);
	    	map.put("listSize", listSize);
	    	map.put("naviSize", naviSize);
	    	map.put("search", search);
	    	map.put("user_id", user_id);
//	    	map.put("heartCount", heartCount);
	    	map.put("code", code);
	    	
	    	// 해당 pageNavigation에서 html code생성
	    	PageNavigation pageNavigation = new PageNavigation(map);
	    	map.put("startRow", pageNavigation.getStartRow());
	    	map.put("endRow", pageNavigation.getEndRow());
	    	
	    	// 페이지 네비게이션 객체 생성
	    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
			// 각 상품 리스트 
	    	List<QnaVo> qnaList = qnaservice.selectQnaList(map);
	    	
	    	model.addAttribute("pageAttribute", map);
	    	model.addAttribute("qnaList", qnaList);
	    	model.addAttribute("navigation", navigation);
	    	
		}
		return "mypageqna";
	}
	
	
	@RequestMapping(value = "mypageqnainsert", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public OrderVo mypageinsert(Model model, HttpSession session, HttpServletRequest request,
			@RequestBody Map<String, String> data) {
		
		String user_id = data.get("user_id");
		String product_name = data.get("product_name");
		
		    OrderVo ordervo = new OrderVo();
		    ordervo.setUser_id(user_id);
		    ordervo.setProduct_name(product_name);
		    
		    productservice.insertOrder(ordervo);
		    
		    return ordervo;
	}
	
	
	@RequestMapping(value = "mypageproduct", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypageproduct(Model model, HttpSession session, HttpServletRequest request
			, @RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo
			, @RequestParam(name = "listSize", defaultValue = "4") int listSize
    		, @RequestParam(name = "naviSize", defaultValue = "4") int naviSize
			, @RequestParam(value = "search", defaultValue = "") String search) {
		
		MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
		
		Map<String, Object> keyword = new HashMap<String, Object>();
    	keyword.put("search", search);
    	keyword.put("user_id", membervo.getUser_id());
    	
    	// 총 갯수
    	int totalCount = productservice.ordercount(keyword);
    	
    	model.addAttribute("totalCount", totalCount);

    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("pageNo", pageNo);
    	map.put("totalCount", totalCount);
    	map.put("listSize", listSize);
    	map.put("naviSize", naviSize);
    	map.put("search", search);
    	
    	// 해당 pageNavigation에서 html code생성
    	PageNavigation pageNavigation = new PageNavigation(map);
    	map.put("startRow", pageNavigation.getStartRow());
    	map.put("endRow", pageNavigation.getEndRow());
    	
    	// 페이지 네비게이션 객체 생성
    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
    	
    	List<OrderVo> orderList = productservice.OrderList(map);
    	
       	model.addAttribute("pageAttribute", map);
    	model.addAttribute("navigation", navigation);
    	model.addAttribute("OrderList", orderList);
    	
		return "mypageproduct";
	}

}
