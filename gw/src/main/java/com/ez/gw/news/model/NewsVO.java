package com.ez.gw.news.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class NewsVO {
	private String title;
	private String originallink;
	private String link;
	private String description;
	private String pubDate;
}
