<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="<c:url value='/css/document.css'/>" rel="stylesheet">
</head>
<body>
	<div class="container p-0">
		<form name="documentFrm" action="">
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
						    	<div id="confirmDocumentNoDiv">
						    		<input type="text" id="confirmDocumentNo" name="confirmDocumentNo" value="">
						    	</div>
						    </td>
						    <td width="130">작성일자</td>
						    <td align="center">
						    	<div id="credateDateDiv" style="padding:3px;">
						    		<input type="text" id="credateDate" name="credateDate" value="">
						    	</div>
						    </td>
				  		</tr>
					  	<tr>
						    <td height="40" colspan="3">이 름</td>
						    <td align="center">
						    	<div id="userNameDiv">
						    		<input type="text" id="userName" name="userName" value="">
						    	</div>
						    </td>
						    <td>수정일자</td>
						    <td align="center">
						    	<div id="credateDateDiv" style="padding:3px;">
						    		<input type="text" id="credateDate" name="credateDate" value="">
						    	</div>
						    </td>
				  		</tr>
					  	<tr>
						    <td height="40" colspan="3">부서(팀)</td>
						    <td align="center">
						    	<div id="username">
						    		<input type="text" id="credateDate" name="credateDate" value="">
						    	</div>
						    </td>
						    <td>검토일자</td>
						    <td align="center">
						    	<div id="username">
						    		<input type="text" id="credateDate" name="credateDate" value="">
						    	</div>
						    </td>
					  	</tr>
					  	<tr>
						    <td height="40" colspan="3">직 책</td>
						    <td align="center">
						    	<div id="positionNameDiv">
						    		<input type="text" id="positionName" name="positionName" value="">
						    	</div>
						    </td>
						    <td>확인일자</td>
						    <td align="center">
						    	<div id="username">
						    		<input type="text" id="credateDate" name="credateDate" value="">
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
				    		<td width="38" rowspan="5">
				    		신<br>
				      		청<br>
				      		내<br>
				      		용
				      		</td>
						    <td width="40" rowspan="3">
						      휴<br>
						      가<br>
						      신<br>
						      청<br>
						      서
						    </td>
				    		<td width="103" height="50">
				    			종류<br>(V체크)
				    		</td>
				    		<td colspan="3" align="center">
						    	<div class="row g-0">
							        <div class="col-2">연차(&nbsp;&nbsp;&nbsp;)</div>
							        <div class="col-3">오전반차(&nbsp;&nbsp;&nbsp;)</div>
							        <div class="col-3">오후반차(&nbsp;&nbsp;&nbsp;)</div>        
							        <div class="col-2">대휴(&nbsp;&nbsp;&nbsp;)</div>
							        <div class="col-2">기타(&nbsp;&nbsp;&nbsp;)</div>
								</div>
				    		</td>
				  		</tr>
				  		<tr>
						    <td height="40">일정</td>
						    <td colspan="3" align="center">
						    	<div class="row g-0">
							        <div class="col-5">
						    			<input type="text" id="credateDate" name="credateDate" value="">
									</div>
							        <div class="col-2">~</div>
							        <div class="col-5">
						    			<input type="text" id="credateDate" name="credateDate" value="">
							        </div>        
								</div>
							</td>
					   	</tr>
					   	<tr>
							<td height="40">주요행선지</td>
							<td colspan="3" align="left" style="padding:3px;">
						    	<div id="destinationDiv">
						    		<input type="text" id="destination" name="destination" value="">
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
						    	<div class="row g-0" id="jic5">
						    		<div class="col">
							    		<input type="text" id="credateDate" name="credateDate" value="">
						    		</div>-
						    		<div class="col">
							    		<input type="text" id="credateDate" name="credateDate" value="">
						    		</div>-
						    		<div class="col">
							    		<input type="text" id="credateDate" name="credateDate" value="">
						    		</div>
						    	</div>
						    </td>
						</tr>
				 		<tr>
						    <td height="40" colspan="3">합의부서</td>
						    <td align="center">
							    <div id="files">
						    		<input type="text" id="credateDate" name="credateDate" value="">
					      		</div>
				      		</td>
				      		<td>합의일자</td>
						    <td align="center">
						    	<div id="username">
						    		<input type="text" id="credateDate" name="credateDate" value="">
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
						    		<input type="file" id="credateDate" name="credateDate" value="">
					      		</div>
				      		</td>
				  		</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
</html>