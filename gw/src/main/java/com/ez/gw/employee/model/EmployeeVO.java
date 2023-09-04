package com.ez.gw.employee.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class EmployeeVO {
    private int empNo;
    private String name;
    private String ename;
    private String jumin;
    private String email;
    private String pwd;
    private String extensionNo;
    private String tel;
    private String address;
    private String married;
    private String hiredate;
    private String retiredate;
    private String authority;
    private int annualSalary;
    private String image;
    private int positionNo;
    private int deptNo;
    private int clubNo;
    private int annualYear;
    private String addressdetail;

    private String combinedEmpNo;
    private int combinedEmpNoInt;
    
    private String merchantNo; //동호회비 

    public void generateCombinedEmpNo(int sequenceValue) {
        Date today = new Date();
        SimpleDateFormat yearFormat = new SimpleDateFormat("yy");
        String year = yearFormat.format(today);

        // sequenceValue를 4자리 숫자 형식으로 변환 (뒷자리 4자리만 사용, 시퀀스 1만이상 넘어갈 때 4자리 변환)
        String sequenceValueStr = String.valueOf(sequenceValue);
        String formattedSequence="";
        if(sequenceValue>=10000) {
        	formattedSequence = sequenceValueStr.substring(Math.max(sequenceValueStr.length() - 4, 0));
        }else{
        	formattedSequence = String.format("%04d", sequenceValue);
        }

        // 연도와 sequenceValue를 결합하여 combinedEmpNo 생성
        this.combinedEmpNo = year + formattedSequence;

        // 문자열로 된 combinedEmpNo를 int로 파싱하여 저장
        this.combinedEmpNoInt = Integer.parseInt(this.combinedEmpNo);
    }
}
