package com.ez.gw.news.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class NewsResultVO {
	private String lastBuildDate;
	private int total;
	private int start;
	private int display;
	private List<NewsVO> item;
}
