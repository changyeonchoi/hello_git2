package com.main.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.main.service.ProductService;
import com.main.service.SearchService;
import com.main.vo.BannerVo;
import com.main.vo.HeartVo;
import com.main.vo.ProductVo;
import com.main.vo.SearchVo;

@Controller
public class SearchController {
	
	@Autowired
	SearchService searchservice;
	
	@Autowired
	ProductService productservice;
	
	@RequestMapping(value="/search" , method = {RequestMethod.GET, RequestMethod.POST})
	public String search (Model model, SearchVo searchvo
	) {
		
		List<SearchVo> RankingList = searchservice.selectRankingList(searchvo);
		
		model.addAttribute("RankingList" , RankingList);
		
		System.out.println(RankingList);
		
		return "search";
	}
	@Transactional
	@RequestMapping(value="/searchresult", method = {RequestMethod.GET, RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String searchresult(Model model,
	                            @RequestParam(value = "search", required = false) String search,
	                            @RequestParam(value = "cnt", required = false) String cnt
	                            ) {
	    Map<String, Object> keyword = new HashMap<>();
	    keyword.put("search", search);
	    keyword.put("cnt", cnt);
	  
	    // 총 갯수
	    int totalCount = searchservice.selectSearchCount(keyword);
	    // 검색어 
	    int keywordCount = searchservice.selectKeywordCount(keyword);
	    
	    System.out.println("keywordCount" +  keywordCount);
	    System.out.println(search);
	    System.out.println(search);
	    
	    if (keywordCount > 0) {
	    	searchservice.updateKeyword(keyword);
	    	 System.out.println("값 있음");
	    } else {
	    	 searchservice.insertKeyword(keyword);
	    	 System.out.println("값 없음");
	    }

	    Map<String, Object> map = new HashMap<>();
	    map.put("totalCount", totalCount);
	    map.put("search", search);
	    
	    List<ProductVo> productList = searchservice.selectSearchProductList(map);
	    
	    map.put("productList", productList);
	    
	    List<BannerVo> bannerList = searchservice.selectSearchBannerList(map);
	    
	    model.addAttribute("bannerList" + bannerList);
	    
//	  각 배너리스트 데이터 경로 c -> images
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
	  
	    int numberOfItemsToDisplay = 8;
		
    	// 리스트 이미지에 값이 8개 미만인 경우 해당 이미지 노출
		String dummyFilePath = "C:\\temp_file\\상품준비중.jpg";
		String readyPath = dummyFilePath.replaceAll("C:\\\\", "\\\\images\\\\");

		if (productList.size() < numberOfItemsToDisplay) {
		    int itemsToDisplay = productList.size();
		    for (int i = 0; i < numberOfItemsToDisplay - itemsToDisplay; i++) {
		        ProductVo dummyFashion = new ProductVo();
		        dummyFashion.setFile_img(readyPath);
		        dummyFashion.setProduct_name("상품 준비중");
		        productList.add(dummyFashion);
		    }
		}

	    // 각 상품리스트 데이터 경로 c -> images
	    for (ProductVo product : productList) {
	        if (product != null) {
	            // file_img 처리
	            String fileImg = product.getFile_img();
	            if (fileImg != null) {
	                String uploadPath = fileImg.replaceAll("C:\\\\", "\\\\images\\\\");
	                product.setFile_img(uploadPath);
	                
	            }
	        }
	    }
	    
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonString;
	    try {
	        Map<String, Object> result = new HashMap<>();
	        result.put("productList", productList);
	        result.put("bannerList", bannerList);
	        jsonString = objectMapper.writeValueAsString(result);
//	        System.out.println("json" + jsonString);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	        jsonString = "[]";
	    }

	    // 반환값으로 JSON 문자열 전송
	    return jsonString;
	}

}





