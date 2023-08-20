package com.ez.gw.common;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class MailVO {
	private String emailAddress;
	private String emailTitle;
	private String message;
}
