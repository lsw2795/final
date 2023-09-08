package com.ez.gw.api;

import java.net.URI;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.ez.gw.api.model.NewsResultVO;
import com.ez.gw.api.model.NewsVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class NewsController {
	private Logger logger = LoggerFactory.getLogger(NewsController.class);
	private String clientId = "VvgfyIV_bSjmsS0Y0nvX"; 		
	private String clientSecret = "oBQSkhP6cz";
	
	@GetMapping("/news")
	public String list(@RequestParam String searchWord, Model model) {
		logger.info("news mapping test");
		 // curl  "https://openapi.naver.com/v1/search/news.json?query=%EC%A3%BC%EC%8B%9D&display=10&start=1&sort=sim"
		  URI uri = UriComponentsBuilder 
				  .fromUriString("https://openapi.naver.com")
				  .path("/v1/search/news.json") 
				  .queryParam("query", searchWord)
				  .queryParam("display", 10) 
				  .queryParam("start", 1) 
				  .queryParam("sort", "sim")
				  .encode() 
				  .build() 
				  .toUri();
		  
		  // Spring 요청 제공 클래스 
		  RequestEntity<Void> req = RequestEntity .get(uri)
				.header("X-Naver-Client-Id", clientId) 
				.header("X-Naver-Client-Secret", clientSecret) 
				.build(); 
		  
		  // Spring 제공 restTemplate 
		  RestTemplate restTemplate = new RestTemplate(); 
		  ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
		  
		  // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화) 
		  ObjectMapper om = new ObjectMapper();
		  NewsResultVO resultVO = null;
		  
		  try { 
			  
			  resultVO = om.readValue(resp.getBody(), NewsResultVO.class); 
			  logger.info("resultVO={}", resultVO);
		  	} catch(JsonMappingException e) { 
		  		e.printStackTrace(); 
	  		} catch(JsonProcessingException e) { 
	  			e.printStackTrace(); 
	  		}
		  
		  if(resultVO !=null && resultVO.getItem() !=null) {
			  List<NewsVO> news =resultVO.getItem(); // books를 list.html에 출력 -> model 선언
			  logger.info("news={}", news);
			  model.addAttribute("news", news);
			  
		  }
		  
		  return "inc/news";
		 
		
		/*
		 * final String uri = "https://openapi.naver.com/v1/search/news.json?query=" +
		 * searchWord.trim() +"&display=100&sort=sim"; HttpHeaders headers = new
		 * HttpHeaders(); headers.add("X-Naver-Client-Id", clientId);
		 * headers.add("X-Naver-Client-Secret", clientSecret);
		 * 
		 * HttpEntity<String> entity = new HttpEntity<>(headers);
		 * 
		 * RestTemplate restTemplate = new RestTemplate();
		 * 
		 * return restTemplate.exchange(uri, HttpMethod.GET, entity,
		 * String.class).getBody();
		 */
		
		 
	}
}
