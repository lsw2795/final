package com.ez.gw.api.model;

import java.util.List;

import lombok.Data;

@Data
public class NewsResultVO {
	private String lastBuildDate;
	private int total;
	private int start;
	private int display;
	private List<NewsVO> items;
}
