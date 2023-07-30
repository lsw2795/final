package com.ez.gw.messagecontent.model;

import lombok.Data;

@Data
public class MessageContentVO {
	private int messageNo; /* 쪽지번호 */
	private String messageContent; /* 쪽지내용 */
	private String sendDate; /* 전송일자 */
	private String delflag; /* 삭제여부 */
	private int empNo; /* 발신자(사원번호) */
}
