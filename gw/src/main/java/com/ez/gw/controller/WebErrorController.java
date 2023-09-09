package com.ez.gw.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class WebErrorController implements ErrorController {

	 @GetMapping("/error")
	    public String handleError(HttpServletRequest request) {
	        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

	        if (status != null) {
	            int statusCode = Integer.parseInt(status.toString());

	            if (statusCode == HttpStatus.NOT_FOUND.value()) {
	                // 404 에러일 때만 커스텀 에러 페이지를 사용
	                return "errors/404";
	            }
	        }

	        // 다른 모든 에러 코드에 대해서는 스프링 부트의 내장 에러 페이지를 사용 (기본 동작)
	        throw new RuntimeException("에러가 발생했습니다."); // 예외를 던져서 예외 처리를 통해 에러 페이지를 보여줌
	    }


}