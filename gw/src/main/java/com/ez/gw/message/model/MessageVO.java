package com.ez.gw.message.model;

import lombok.Data;

@Data
public class MessageVO {
	private int no; /* 쪽지(수신)번호 */
	private int reader; /* 수신자(사원번호) -컬럼만 따옴 */
	private String delflag; /* 삭제여부 */
	private String readDate; /* 읽음일자 */
	private int messageNo; /* 쪽지번호 */
}
