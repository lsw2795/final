package com.ez.gw.controller;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class LoginInterceptor implements HandlerInterceptor{
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//컨트롤러 수행이전에 먼저 수행되는 메서드
		//클라이언트의 요청을 컨트롤러에 전달하기 전에 호출됨
		
		Integer empNo=(Integer)request.getSession().getAttribute("empNo");
		//logger.info("preHandle() 호출!, empNo={}", empNo);

		//로그인되지 않은 경우 처리
		if(empNo==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('먼저 로그인하세요!');");
			out.print("location.href='"+ request.getContextPath() +"/';");			
			out.print("</script>");
			
			return false;
		}else {
			return true; //=> 다음 컨트롤러가 수행됨
		}
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//logger.info("postHandle() 호출!");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//logger.info("afterCompletion() 호출!");
	}

}
