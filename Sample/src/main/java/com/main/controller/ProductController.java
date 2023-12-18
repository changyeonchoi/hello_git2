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
import com.main.service.PageNavigigationService;
import com.main.vo.MemberVo;
import com.main.vo.ProductVo;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productservice;
	
	@Autowired
	PageNavigigationService pagenavigigationservice;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	

	@RequestMapping(value = "/{type}", method = {RequestMethod.GET, RequestMethod.POST})
	public String product(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(value="pageNo"		, defaultValue="1" , required=true) int pageNo,
			@RequestParam(name = "listSize", defaultValue = "10") int listSize,
    		@RequestParam(name = "naviSize", defaultValue = "20") int naviSize,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "file_img", required=false) MultipartFile file_img,
	        @RequestParam(value = "detail_img", required=false) MultipartFile detail_img,
	        @RequestParam(value = "banner_title", required=false) String banner_title,
	        @RequestParam(value = "product_name", required=false) String product_name,
	        @RequestParam(value = "product_amount", required=false) String product_amount,
	        @RequestParam(value = "delivery_fee", required=false) String delivery_fee,
	        @RequestParam(value = "company_name", required=false) String company_name,
	        @RequestParam(value = "company_phone", required=false) String company_phone,
	        @RequestParam(value = "company_yn", required=false) String company_yn,
	        @RequestParam(value = "seq_id", required=false) String seq_id,
	        @RequestParam(value = "detail_url", required=false) String detail_url,
	        @RequestParam(value = "code", required=false) String code,
	        ProductVo productvo,
	        @PathVariable(name = "type") String type
			) throws IOException {
		
		 	String returnUrl = null;

			MemberVo membervo = (MemberVo) request.getSession().getAttribute("membervo");
			
//		    productvo.setUser_id(membervo.getUser_id());
		    
		    if (type.startsWith("fashion")) {
		        code = "fashion";
		    } else if (type.startsWith("makeup")) {
		        code = "makeup";
		    } else if (type.startsWith("accessory")) {
		        code = "accessory";
		    } else {
		    	code = "main";
		    }
		    
			
		    Map<String, Object> keyword = new HashMap<String, Object>();
	    	keyword.put("search", search);
	    	keyword.put("code", code);
	    	
	    	int totalCount = productservice.selectTotalCount(keyword);
	    	
	    	
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("pageNo", pageNo);
	    	map.put("totalCount", totalCount);
	    	map.put("listSize", listSize);
	    	map.put("naviSize", naviSize);
	    	map.put("search", search);
	    	map.put("code", code);
	    	
	    	PageNavigation pageNavigation = new PageNavigation(map);
	    	map.put("startRow", pageNavigation.getStartRow());
	    	map.put("endRow", pageNavigation.getEndRow());
	    	
	    	PageNavigation navigation = pagenavigigationservice.makePageNavigation(map);
			
	    	List<ProductVo> productList = productservice.selectProductList(map);
	    	
	    	int numberOfItemsToDisplay = 8;
			
			String dummyFilePath = "C:\\temp_file\\상품준비중.jpg";
			String readyPath = dummyFilePath.replaceAll("C:\\\\", "\\\\images\\\\");

			// 데이터가 3개 미만인 경우 상품 준비중 메시지를 추가
			if (productList.size() < numberOfItemsToDisplay) {
			    int itemsToDisplay = productList.size();
			    for (int i = 0; i < numberOfItemsToDisplay - itemsToDisplay; i++) {
			        ProductVo dummyFashion = new ProductVo();
			        dummyFashion.setFile_img(readyPath);
			        dummyFashion.setBanner_title("상품 준비중");
			        productList.add(dummyFashion);
			    }
			}
	    	
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

	    if("fashion".equals(code)) {
			
			if("fashionlist".equals(type)) {
				
		    	model.addAttribute("pageAttribute", map);
		    	model.addAttribute("fashion", productList);
		    	model.addAttribute("navigation", navigation);
		    	
		    	returnUrl = "/fashionlist";
	
			} else if("fashiondetail".equals(type)) {
				
				productvo = productservice.selectfashiondetail(seq_id);
				
		    	String uploadPath = productvo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
		    	productvo.setFile_img(uploadPath);
		    	
		    	String detailPath = productvo.getDetail_img().replaceAll("C:\\\\", "\\\\images\\\\");
		    	productvo.setDetail_img(detailPath);
				
				model.addAttribute("fashion", productvo);
				
				returnUrl = "/fashiondetail";
				
			} 
		} else if("makeup".equals(code)) {
			
			if("makeuplist".equals(type)) {
				    	
				model.addAttribute("pageAttribute", map);
				model.addAttribute("makeup", productList);
				model.addAttribute("navigation", navigation);
		    	
				returnUrl = "/makeuplist";
				
			} else if("makeupdetail".equals(type)) {
				
				productvo = productservice.selectfashiondetail(seq_id);
				
		    	String uploadPath = productvo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
		    	productvo.setFile_img(uploadPath);
				
				model.addAttribute("makeup", productvo);
				
				returnUrl = "/makeupdetail";
			}
		} else if("accessory".equals(code)) {
			
			if("accessorylist".equals(type)) {
				    	
				model.addAttribute("pageAttribute", map);
				model.addAttribute("accessory", productList);
				model.addAttribute("navigation", navigation);
		    	
				returnUrl = "/accessorylist";
				
		    	
			} else if("accessorydetail".equals(type)) {
				productvo = productservice.selectfashiondetail(seq_id);
				
				String uploadPath = productvo.getFile_img().replaceAll("C:\\\\", "\\\\images\\\\");
				productvo.setFile_img(uploadPath);
				
				String detailPath = productvo.getDetail_img().replaceAll("C:\\\\", "\\\\images\\\\");
				productvo.setDetail_img(detailPath);
				
				System.out.println("productvo" + productvo);
				
				model.addAttribute("accessory", productvo);
				
				returnUrl = "/accessorydetail";
			}
		} else {
			
	    	List<ProductVo> fashionList = productservice.selectFashionList(map);
	    	
	    	List<ProductVo> makeupList = productservice.selectMakeupList(map);
	    	
	    	List<ProductVo> accessoryList = productservice.selectAccessoryList(map);
	    	
			model.addAttribute("fashion", fashionList);
			
			model.addAttribute("makeup", makeupList);
			
			model.addAttribute("accessory", accessoryList);
			
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


