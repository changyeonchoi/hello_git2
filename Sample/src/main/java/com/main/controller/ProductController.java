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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.main.service.ProductService;
import com.main.service.QnaService;
import com.main.service.BannerService;
import com.main.service.HeartService;
import com.main.service.PageNavigigationService;
import com.main.vo.BannerVo;
import com.main.vo.MemberVo;
import com.main.vo.ProductVo;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productservice;
	
	@Autowired
	PageNavigigationService pagenavigigationservice;
	
	@Autowired
	BannerService bannerservice;
	
	@Autowired
	HeartService heartservice;

	@Autowired
	QnaService qnaservice;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//type별 api 지정
	@RequestMapping(value = "/{type}", method = {RequestMethod.GET, RequestMethod.POST})
	public String product(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo,
			@RequestParam(name = "listSize", defaultValue = "10") int listSize,
    		@RequestParam(name = "naviSize", defaultValue = "20") int naviSize,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "file_img", required=false) MultipartFile file_img,
	        @RequestParam(value = "detail_img", required=false) MultipartFile detail_img,
	        @RequestParam(value = "banner_img", required=false) MultipartFile banner_img,
	        @RequestParam(value = "banner_title", required=false) String banner_title,
	        @RequestParam(value = "product_name", required=false) String product_name,
	        @RequestParam(value = "product_amount", required=false) String product_amount,
	        @RequestParam(value = "delivery_fee", required=false) String delivery_fee,
	        @RequestParam(value = "company_name", required=false) String company_name,
	        @RequestParam(value = "company_phone", required=false) String company_phone,
	        @RequestParam(value = "company_yn", required=false) String company_yn,
	        @RequestParam(value = "seq_id", required=false) Integer seq_id,
	        @RequestParam(value = "detail_url", required=false) String detail_url,
	        @RequestParam(value = "code", required=false) String code,
	        @RequestParam(value = "banner_area2", required=false) String banner_area2,
	        @RequestParam(value = "product_seq_id", required=false) Integer product_seq_id,
	        @RequestParam(value = "sale", required=false) String sale,
	        @RequestParam(value = "heart", required = false) Integer heart,
	        ProductVo productvo,
	        BannerVo bannervo,
	        @PathVariable(name = "type") String type
			) throws IOException {
			
		 	String returnUrl = null;
		 	

		 	// 로그인 세션 가져오기
			MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
			
			if (membervo != null) {
	            String user_id = membervo.getUser_id();
	            
		    	Map<String, Object> heartcnt = new HashMap<String, Object>();
		    	heartcnt.put("seq_id", seq_id);
		    	heartcnt.put("user_id", user_id);
		    	
		    	// 찜하기 갯수
		    	int heartCount = heartservice.selectheartCount(heartcnt);
	        }
			
			// 시작문자열로 인한 code 지정
		    if (type.startsWith("fashion")) {
		        code = "fashion";
		    } else if (type.startsWith("makeup")) {
		        code = "makeup";
		    } else if (type.startsWith("accessory")) {
		        code = "accessory";
		    } else {
		    	code = "main";
		    }
		    
		    
		    // 해당 코드가 같으면 배너변수에 해당 값 지정
		    if (code.equals("fashion")) {
		    	banner_area2 = "fashion";
		    } else if (code.equals("makeup")) {
		    	banner_area2 = "make Up";
		    } else if (code.equals("accessory")) {
		    	banner_area2 = "accessory";
		    } else {
		    	banner_area2 = "Home";
		    }
		    // 여기서 URL을 변경하고 싶은 부분에 대해 처리합니다.
//		    if (landUrl != null && landUrl.contains("localhost:")) {
//		        landUrl = landUrl.replace("localhost:", "http://");
//		    }
		    
		    Map<String, Object> keyword = new HashMap<String, Object>();
	    	keyword.put("search", search);
	    	keyword.put("code", code);
	    	keyword.put("banner_area2", banner_area2);

	    	// 총 갯수
	    	int totalCount = productservice.selectTotalCount(keyword);
	    	
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("pageNo", pageNo);
	    	map.put("totalCount", totalCount);
	    	map.put("listSize", listSize);
	    	map.put("naviSize", naviSize);
	    	map.put("search", search);
	    	map.put("code", code);
	    	map.put("banner_area2", banner_area2);
	    	
	    	// 해당 pageNavigation에서 html code생성
	    	PageNavigation pageNavigation = new PageNavigation(map);
	    	map.put("startRow", pageNavigation.getStartRow());
	    	map.put("endRow", pageNavigation.getEndRow());
	    	
	    	// 페이지 네비게이션 객체 생성
	    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
			// 각 상품 리스트 
	    	List<ProductVo> productList = productservice.selectProductList(map);
	    	// 각 배너 리스트
	    	List<BannerVo> bannerList = bannerservice.selectBannerList(map);
	    	// 각 쿠폰 리스트
	    	List<BannerVo> couponList = bannerservice.selectCouponList(map);
	    	
	    	// 리스트 이미지 노출 갯수 최대 8
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

	    	        // detail_img 처리(리스트로 뿌려줄때)
//	    	        String detailImg = product.getDetail_img();
//	    	        if (detailImg != null) {
//	    	            String detailUploadPath = detailImg.replaceAll("C:\\\\", "\\\\images\\\\");
//	    	            product.setDetail_img(detailUploadPath);
//	    	        }
	    	    }
	    	}    
	    	// 각 배너리스트 데이터 경로 c -> images
	    	for (int i = 0; i < bannerList.size(); i++) {
	    	    BannerVo banner = bannerList.get(i);

	    	    if (banner != null) {
	    	        // file_img 처리
	    	        String fileImg = banner.getBanner_img();
	    	        if (fileImg != null) {
	    	            String uploadPath = fileImg.replaceAll("C:\\\\", "\\\\images\\\\");
	    	            banner.setBanner_img(uploadPath);
	    	        }
	    	    }
	    	}  
	    	
	    	// 각 배너리스트 데이터 경로 c -> images
	    	for (int i = 0; i < couponList.size(); i++) {
	    		BannerVo coupon = couponList.get(i);
	    		
	    		if (coupon != null) {
	    			// file_img 처리
	    			String fileImg = coupon.getBanner_img();
	    			if (fileImg != null) {
	    				String uploadPath = fileImg.replaceAll("C:\\\\", "\\\\images\\\\");
	    				coupon.setBanner_img(uploadPath);
	    			}
	    		}
	    	}   
	    	
	    
	    if("fashion".equals(code)) {
			
			if("fashionlist".equals(type)) {
				
		    	model.addAttribute("pageAttribute", map);
		    	model.addAttribute("fashion", productList);
		    	model.addAttribute("navigation", navigation);
		    	model.addAttribute("banner", bannerList);
		    	
		    	
		    	returnUrl = "/fashionlist";
	
			} else if("fashiondetail".equals(type)) {
				
				productvo = productservice.selectfashiondetail(seq_id);
				
		    	String uploadPath = productvo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
		    	productvo.setFile_img(uploadPath);
		    	
		    	String detailPath = productvo.getDetail_img().replaceAll("C:\\\\", "\\\\images\\\\");
		    	productvo.setDetail_img(detailPath);
		    	
		    	Map<String, Object> heartcnt = new HashMap<String, Object>();
		    	heartcnt.put("seq_id", seq_id);
		    	heartcnt.put("user_id", productvo.getUser_id());
		    	
		    	// 찜하기 갯수
		    	int heartCount = heartservice.selectheartCount(heartcnt);
		    	
				
				model.addAttribute("fashion", productvo);
		    	model.addAttribute("heartCount" , heartCount);
		    	System.out.println("heartCount" + heartCount);
				model.addAttribute("banner", bannerList);
				
				returnUrl = "/fashiondetail";
			}
		} else if("makeup".equals(code)) {
			
			if("makeuplist".equals(type)) {
				    	
				model.addAttribute("pageAttribute", map);
				model.addAttribute("makeup", productList);
				model.addAttribute("navigation", navigation);
				model.addAttribute("banner", bannerList);
		    	
				returnUrl = "/makeuplist";
				
			} else if("makeupdetail".equals(type)) {
				
				productvo = productservice.selectfashiondetail(seq_id);
				
		    	String uploadPath = productvo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
		    	productvo.setFile_img(uploadPath);
		    	
		    	Map<String, Object> heartcnt = new HashMap<String, Object>();
		    	heartcnt.put("seq_id", seq_id);
		    	heartcnt.put("user_id", productvo.getUser_id());
		    	
		    	System.out.println(heartcnt);
		    	
		    	// 찜하기 갯수
		    	int heartCount = heartservice.selectheartCount(heartcnt);
				
		    	model.addAttribute("heartCount" , heartCount);
				
				model.addAttribute("makeup", productvo);
				model.addAttribute("banner", bannerList);
				
				returnUrl = "/makeupdetail";
			}
		} else if("accessory".equals(code)) {
			
			if("accessorylist".equals(type)) {
				    	
				model.addAttribute("pageAttribute", map);
				model.addAttribute("accessory", productList);
				model.addAttribute("navigation", navigation);
				model.addAttribute("banner", bannerList);
		    	
				returnUrl = "/accessorylist";
				
		    	
			} else if("accessorydetail".equals(type)) {
				productvo = productservice.selectfashiondetail(seq_id);
				
				String uploadPath = productvo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
				productvo.setFile_img(uploadPath);
				
				String detailPath = productvo.getDetail_img().replaceAll("C:\\\\", "\\\\images\\\\");
				productvo.setDetail_img(detailPath);
				
		    	Map<String, Object> heartcnt = new HashMap<String, Object>();
		    	heartcnt.put("seq_id", seq_id);
		    	heartcnt.put("user_id", productvo.getUser_id());
		    	
		    	System.out.println(heartcnt);
		    	
		    	// 찜하기 갯수
		    	int heartCount = heartservice.selectheartCount(heartcnt);
				
		    	model.addAttribute("heartCount" , heartCount);
				model.addAttribute("accessory", productvo);
				model.addAttribute("banner", bannerList);
				
				returnUrl = "/accessorydetail";
			}
		} else {
			
	    	List<ProductVo> fashionList = productservice.selectFashionList(map);
	    	
	    	List<ProductVo> makeupList = productservice.selectMakeupList(map);
	    	
	    	List<ProductVo> accessoryList = productservice.selectAccessoryList(map);
	    	
			model.addAttribute("fashion", fashionList);
			
			model.addAttribute("makeup", makeupList);
			
			model.addAttribute("accessory", accessoryList);
			
			model.addAttribute("banner", bannerList);

			model.addAttribute("coupon", couponList);
			
			int numberOfItemsToDisplaymain = 3;
			
			String mainFilePath = "C:\\temp_file\\상품준비중.jpg";
			
			String mainreadyPath = mainFilePath.replaceAll("C:\\\\", "\\\\images\\\\");

			// 데이터가 3개 미만인 경우 상품 준비중 메시지를 추가
			if (fashionList.size() < numberOfItemsToDisplaymain) {
			    int itemsToDisplay = fashionList.size();
			    for (int i = 0; i < numberOfItemsToDisplaymain - itemsToDisplay; i++) {
			        ProductVo dummyFashion = new ProductVo();
			        dummyFashion.setFile_img(mainreadyPath);
			        dummyFashion.setBanner_title("상품 준비중");
			        fashionList.add(dummyFashion);
			    }
			}
			// 데이터가 3개 미만인 경우 상품 준비중 메시지를 추가
			if (makeupList.size() < numberOfItemsToDisplaymain) {
				int itemsToDisplay = makeupList.size();
				for (int i = 0; i < numberOfItemsToDisplaymain - itemsToDisplay; i++) {
					ProductVo dummyFashion = new ProductVo();
					dummyFashion.setFile_img(mainreadyPath);
					dummyFashion.setBanner_title("상품 준비중");
					makeupList.add(dummyFashion);
				}
			}
			// 데이터가 3개 미만인 경우 상품 준비중 메시지를 추가
			if (accessoryList.size() < numberOfItemsToDisplaymain) {
				int itemsToDisplay = accessoryList.size();
				for (int i = 0; i < numberOfItemsToDisplaymain - itemsToDisplay; i++) {
					ProductVo dummyFashion = new ProductVo();
					dummyFashion.setFile_img(mainreadyPath);
					dummyFashion.setBanner_title("상품 준비중");
					accessoryList.add(dummyFashion);
				}
			}
			
			for (int i = 0; i < fashionList.size(); i++) {
	    	    ProductVo product = fashionList.get(i);

	    	    if (product != null) {
	    	        // file_img 처리
	    	        String fileImg = product.getFile_img();
	    	        if (fileImg != null) {
	    	            String uploadPath = fileImg.replaceAll("C:\\\\", "\\\\images\\\\");
	    	            product.setFile_img(uploadPath);
	    	        }
	    	    }
	    	}   
			
			for (int i = 0; i < makeupList.size(); i++) {
				ProductVo product = makeupList.get(i);
				
				if (product != null) {
					// file_img 처리
					String fileImg = product.getFile_img();
					if (fileImg != null) {
						String uploadPath = fileImg.replaceAll("C:\\\\", "\\\\images\\\\");
						product.setFile_img(uploadPath);
					}
				}
			}    
			
			for (int i = 0; i < accessoryList.size(); i++) {
				ProductVo product = accessoryList.get(i);
				
				if (product != null) {
					// file_img 처리
					String fileImg = product.getFile_img();
					if (fileImg != null) {
						String uploadPath = fileImg.replaceAll("C:\\\\", "\\\\images\\\\");
						product.setFile_img(uploadPath);
					}
				}
			}    

			returnUrl = "/main";
		}
		return returnUrl;
	}
}


