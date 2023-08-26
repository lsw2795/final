package com.ez.gw.messagecontent.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MessageViewVO {
	private int messageNo;
	private String messageContent;
	private Timestamp sendDate;
	private String delflag;
	private	int empNo;
	private int reader;
	private String readerDelflag;
	private Timestamp readDate;
	private String sendName;
	private String readName;
	private String sendImage;
	private String readImage;
}
