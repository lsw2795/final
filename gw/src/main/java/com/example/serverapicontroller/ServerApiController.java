package com.example.serverapicontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ServerApiController {
	public final Logger logger = LoggerFactory.getLogger(ServerApiController.class);
	@Value("${naver.api.id}")
    private String naverApiId;

    @Value("${naver.api.secret}")
    private String naverApiSecret;
    
    @GetMapping("/news")
    public String getNews(@RequestParam String searchKeyWord) {
    	logger.info("네이버 뉴스 API, 파라미터 searchKeyWord={}", searchKeyWord);
    	final String uri = "https://openapi.naver.com/v1/search/news.json?query=" + searchKeyWord.trim() + "&display=100&sort=sim";
    	
    	 HttpHeaders headers = new HttpHeaders();
         headers.add("X-Naver-Client-Id", naverApiId);
         headers.add("X-Naver-Client-Secret", naverApiSecret);

         HttpEntity<String> entity = new HttpEntity<>(headers);

         RestTemplate restTemplate = new RestTemplate();
         
         return restTemplate.exchange(uri, HttpMethod.GET, entity, String.class).getBody();
    }
	
}
