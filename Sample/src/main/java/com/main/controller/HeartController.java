package com.main.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.main.service.HeartService;

@RestController
public class HeartController {

    @Autowired
    private HeartService heartservice;
    
    @ResponseBody 
    @PostMapping("/upHeart")
    public Map<String, Object> upHeart(@RequestBody Map<String, Object> requestData) {
        String user_id = (String) requestData.get("user_id");
        String code = (String) requestData.get("code");
        String type = (String) requestData.get("type");
        Integer seq_id = (Integer) requestData.get("seq_id");
        Integer heart = (Integer) requestData.get("heart");
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("seq_id", seq_id);
        map.put("user_id", user_id);
        
        
        Map<String, Object> response = new HashMap<>();
        
        // 현재 하트의 상태를 확인
        int currentHeartCount = heartservice.selectheartCount(map);
        
            if (currentHeartCount > 0) {
                // 이미 등록되어 있으면 삭제
                heartservice.downHeart(map);
                response.put("action", "삭제");
            } else {
                // 등록
                map.put("heart", heart);
                map.put("code", code);
                map.put("type", type);
                heartservice.upHeart(map);
                response.put("action", "등록");
            }
        
        return response;
    }
    
    @ResponseBody 
    @PostMapping("/qnaupHeart")
    public Map<String, Object> qnaupHeart(@RequestBody Map<String, Object> requestData) {
    	String user_id = (String) requestData.get("user_id");
    	String code = (String) requestData.get("code");
    	Integer seq_id = (Integer) requestData.get("seq_id");
    	Integer heart = (Integer) requestData.get("heart");
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("seq_id", seq_id);
    	map.put("user_id", user_id);
    	
    	Map<String, Object> response = new HashMap<>();
    	
    	// 현재 하트의 상태를 확인
    	int currentQnaHeartCount = heartservice.selectqnaheartCount(map);
    	
    	if (currentQnaHeartCount > 0) {
    		// 이미 등록되어 있으면 삭제
    		heartservice.qnadownHeart(map);
    		response.put("action", "삭제");
    	} else {
    		// 등록
    		map.put("heart", heart);
    		map.put("code", code);
    		heartservice.qnaupHeart(map);
    		response.put("action", "등록");
    	}
    	
    	return response;
    }
		
}