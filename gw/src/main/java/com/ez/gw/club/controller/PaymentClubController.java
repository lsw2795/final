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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.gw.employee.model.EmployeeVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentClubController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentClubController.class);
	
	private IamportClient api;
	
	// REST API 키와 REST API secret
	public PaymentClubController() {
		this.api = new IamportClient("7871557686804568", "fMREUiqxkt0zCAGipySwDeaAjk4dH5Dgm9hBC2NnoYpqS7GZhpMKOa34b1wPzISRZhOJUAfFpBUS3DLU");
	}
	
	//검증에 필요 imp_uid(거래 고유번호)
	@ResponseBody
	@RequestMapping(value="/verifyiamport/{imp_uid}", method=RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	
		
			return api.paymentByImpUid(imp_uid);
	}
	
	
	//결제 완료시
	
	@RequestMapping("/paymentSuccess")
	public String paymentSuccess(@ModelAttribute EmployeeVO empVo,
			String amount) {
		logger.info("결제완료시 empVo={},amount={}",empVo,amount);
		int amt=Integer.parseInt(amount);
		
		
		return "";
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
