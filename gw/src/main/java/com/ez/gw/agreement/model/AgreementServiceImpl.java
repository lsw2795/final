package com.ez.gw.agreement.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AgreementServiceImpl implements AgreementService {
	private final AgreementDAO agreementDao;

}
