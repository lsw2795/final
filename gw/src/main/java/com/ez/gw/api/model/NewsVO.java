package com.ez.gw.api.model;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class NewsVO {
	private String title;
	private String originallink;
	private String link;
	private String description;
	private String pubDate;
	
	private String newsDate;
}
