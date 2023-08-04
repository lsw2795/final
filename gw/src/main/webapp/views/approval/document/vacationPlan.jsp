<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가신청서</title>
<!-- CSS only -->
<link href="<c:url value='/css/document.css'/>" rel="stylesheet">
</head>
<body>
		<div class="container p-0">
			<div class="row g-0" id="header">
				<div class="col-6" id="mainTitle">
					<h2>휴 가 신 청 서</h2>
				</div>
				<div class="col-6" id="check-div">
					<table id="check" width="270" class="table-bordered" align="right">
						<tbody>
							<tr>
						    	<td>기안</td>
						    	<td>검토</td>
						    	<td>확인</td>
						    	<td>승인</td>
						  	</tr>
							<tr>
						    	<td height="50">&nbsp;</td>
						    	<td height="50">&nbsp;</td>
						    	<td height="50">&nbsp;</td>
						    	<td height="50">&nbsp;</td>
						  	</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row g-0">
				<table class="table-bordered" id="document" width="645" align="center" >
					<tbody>
						<tr>
						    <td width="170" height="40" colspan="3" >문서번호</td>
						    <td align="center">
						    </td>
						    <td width="130">작성일자</td>
						    <td align="center">
						    </td>
				  		</tr>
					  	<tr>
						    <td height="40" colspan="3">이 름</td>
						    <td align="center" name="userName">
						    </td>
						    <td>수정일자</td>
						    <td align="center">
						    	<div id="updateDateDiv" style="padding:3px;">
						    		<input type="text" id="updateDate" name="updateDate" value="">
						    	</div>
						    </td>
				  		</tr>
					  	<tr>
						    <td height="40" colspan="3">부서(팀)</td>
						    <td align="center">
						    </td>
						    <td>검토일자</td>
						    <td align="center">
						    	<div id="reviewDateDiv">
						    		<input type="text" id="reviewDate" name="reviewDate" value="">
						    	</div>
						    </td>
					  	</tr>
					  	<tr>
						    <td height="40" colspan="3">직 책</td>
						    <td align="center">
						    </td>
						    <td>확인일자</td>
						    <td align="center">
						    	<div id="confirmDateDiv">
						    		<input type="text" id="confirmDate" name="confirmDate" value="">
						    	</div>
						    </td>
					  	</tr>
						<tr>
						    <td height="40" colspan="3">제 목</td>
						    <td colspan="3" align="left" style="padding:3px;">
						    	<div id="titleDiv">
						    		<input type="text" id="title" name="title" value="">
						    	</div>
						    </td>
						</tr>
				  		<tr>
				    		<td width="38" rowspan="4">
				    		신<br>
				      		청<br>
				      		내<br>
				      		용
				      		</td>
						    <td width="40" rowspan="2">
						      휴<br>
						      가<br>
						      신<br>
						      청<br>
						      서
						    </td>
				    		<td width="103" height="40">
				    			종류
				    		</td>
				    		<td align="center">
						    	<div name="categoryDiv">
						    		<select id="category" name="category">
						    			<option>연차</option>
						    			<option>오전반차</option>
						    			<option>오후반차</option>
						    			<option>대휴</option>
						    			<option>기타</option>
						    		</select>
								</div>
				    		</td>
							<td>주요행선지</td>
							<td align="center" >
						    	<div id="destinationDiv">
						    		<input type="text" id="destination" name="destination" value="">
						    	</div>
						    </td>
				  		</tr>
				  		<tr>
						    <td height="40">일정</td>
						    <td colspan="3" align="center">
						    	<div class="row g-0">
							        <div class="col-5" id="vacStartDateDiv">
						    			<input type="text" id="vacStartDate" name="vacStartDate" value="">
									</div>
							        <div class="col-2">~</div>
							        <div class="col-5" id="vacEndDateDiv">
						    			<input type="text" id="vacEndDate" name="vacEndDate" value="">
							        </div>        
								</div>
							</td>
					   	</tr>
				  		<tr>
						    <td height="200" colspan="2">
						    	신청사유<br>(자세히)
						    </td>
						    <td colspan="3" align="left" valign="top">
						    	<textarea name="content" id="content" rows="8" cols="78"></textarea>
						    </td>
				  		</tr>
						<tr>
						    <td height="40" colspan="2" >
						    	긴급연락처
						    </td>
						    <td colspan="3" align="center">
						    	<div class="row g-0" id="emergencyTelDiv">
						    		<div class="col">
							    		<input type="text" id="tel1" name="tel1" value="">
						    		</div>-
						    		<div class="col">
							    		<input type="text" id="tel2" name="tel2" value="">
						    		</div>-
						    		<div class="col">
							    		<input type="text" id="tel3" name="tel3" value="">
						    		</div>
						    	</div>
						    </td>
						</tr>
				 		<tr>
						    <td height="40" colspan="3">합의부서</td>
						    <td align="center">
							    <div id="deptAgreeNameDiv">
						    		<input type="text" id="deptAgreeName" name="deptAgreeName" value="">
					      		</div>
				      		</td>
				      		<td>합의일자</td>
						    <td align="center">
						    	<div id="deptAgreeDateDiv">
						    		<input type="text" id="deptAgreeDate" name="deptAgreeDate" value="">
						    	</div>
						    </td>
				  		</tr>
				 		<tr>
						    <td height="40" colspan="3">참조자</td>
						    <td colspan="3" align="left">
							    <div id="referNameDiv" style="padding:3px;">
						    		<input type="text" id="referName" name="referName" value="">
					      		</div>
				      		</td>
				  		</tr>
				  		<tr>
						    <td height="40" colspan="3">첨부파일</td>
						    <td colspan="3" align="left">
							    <div id="file" style="padding:3px;">
						    		<input type="file" id="confirmFile" name="confirmFile" value="">
					      		</div>
					      		<div id="file2" style="padding:3px;">
						    		<input type="file" id="confirmFile2" name="confirmFile2" value="">
								</div>						    		
						    	<div id="file3" style="padding:3px;">
						    		<input type="file" id="confirmFile3" name="confirmFile3" value="">
				      			</div>
				      		</td>
				  		</tr>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>