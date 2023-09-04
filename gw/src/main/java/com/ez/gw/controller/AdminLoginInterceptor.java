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
public class AdminLoginInterceptor implements HandlerInterceptor{
	private static final Logger logger
		=LoggerFactory.getLogger(AdminLoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Integer empNo=(Integer)request.getSession().getAttribute("empNo");
		
		//관리자가 로그인되지 않은 경우 에러 처리
		if(empNo==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('먼저 관리자 로그인을 하세요');");
			out.print("location.href='"+ request.getContextPath()+"/admin/login';");
			out.print("</script>");
			
			return false; //다음 컨트롤러로 못가게 막는다
		
		}else {
			return true;
		}
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
	
	
	
	
}
