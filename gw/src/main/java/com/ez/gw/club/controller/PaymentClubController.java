package com.ez.gw.club.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class PaymentClubController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentClubController.class);
	
	@Value("${imp_key}")
	private String imp_key;

	@Value("${imp_secret}")
	private String imp_secret;
	
	
	
	
	
	
	
	
	public String getToken() throws IOException {

	    HttpsURLConnection conn = null;

	    URL url = new URL("https://api.iamport.kr/users/getToken");

	    conn = (HttpsURLConnection) url.openConnection();

	    conn.setRequestMethod("POST");
	    conn.setRequestProperty("Content-type", "application/json");
	    conn.setRequestProperty("Accept", "application/json");
	    conn.setDoOutput(true);
	    JsonObject json = new JsonObject();

	    json.addProperty("imp_key", imp_key);
	    json.addProperty("imp_secret", imp_secret);

	    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

	    bw.write(json.toString());
	    bw.flush();
	    bw.close();

	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

	    Gson gson = new Gson();

	    String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();

	    System.out.println("response : " + response);

	    String token = gson.fromJson(response, Map.class).get("access_token").toString();

	    br.close();
	    conn.disconnect();

	    return token;
	}
}
