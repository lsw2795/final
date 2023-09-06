package com.ez.gw.club.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Locale;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.club.model.ClubService;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.employee.model.EmployeeVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PaymentClubController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentClubController.class);
	private final ClubService clubService;
	
	//결제 완료시 ajax
	@ResponseBody
	@GetMapping("/club/ajaxPaymentClub")
	public void ajaxPaymentClub(@RequestParam Map<String, Object> payment, HttpSession session) {
		logger.info("ajax 이용 - payment={}",payment); 
		
		String uid = String.valueOf(payment.get("merchant_uid"));
		String clubNo = String.valueOf(payment.get("custom_data[club_no]"));
		String empNo = String.valueOf(payment.get("custom_data[buyer_emp_no]"));
		logger.info("클럽 가입 결과, uid = {}, clubNo = {}, empNo = {}",uid, clubNo, empNo); 
		int cnt = clubService.joinClub(uid, clubNo, empNo);
		logger.info("클럽 가입 결과, cnt = {}",cnt); 
		
		if(cnt>0) {
			session.removeAttribute("clubNo");
			session.setAttribute("clubNo",clubNo);
		}
		
	}
	
	/*
	 * public String getToken() throws IOException {
	 * 
	 * HttpsURLConnection conn = null;
	 * 
	 * URL url = new URL("https://api.iamport.kr/users/getToken");
	 * 
	 * conn = (HttpsURLConnection) url.openConnection();
	 * 
	 * conn.setRequestMethod("POST"); conn.setRequestProperty("Content-type",
	 * "application/json"); conn.setRequestProperty("Accept", "application/json");
	 * conn.setDoOutput(true); JsonObject json = new JsonObject();
	 * 
	 * json.addProperty("imp_key", imp_key); json.addProperty("imp_secret",
	 * imp_secret);
	 * 
	 * BufferedWriter bw = new BufferedWriter(new
	 * OutputStreamWriter(conn.getOutputStream()));
	 * 
	 * bw.write(json.toString()); bw.flush(); bw.close();
	 * 
	 * BufferedReader br = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream(), "utf-8"));
	 * 
	 * Gson gson = new Gson();
	 * 
	 * String response = gson.fromJson(br.readLine(),
	 * Map.class).get("response").toString();
	 * 
	 * System.out.println("response : " + response);
	 * 
	 * String token = gson.fromJson(response,
	 * Map.class).get("access_token").toString();
	 * 
	 * br.close(); conn.disconnect();
	 * 
	 * return token; }
	 */
}
