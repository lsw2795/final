<!-- 결재 문서 출력 폼 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${confirmMap['FORM_NAME'] } ${confirmMap['CONFIRM_DOCUMENT_NO'] }</title>
<!-- CSS only -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value='/css/document.css'/>" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>

<script type="text/javascript">
	$(function(){
		const no=document.getElementById("confirmDocumentNo").value;
		const name=document.getElementById("formName").value;
		const element=document.getElementById("pdf");
		const options = {
			margin: 0, // 여백 설정
			filename: no+' '+name+'.pdf', // 저장될 파일 이름
			html2canvas: { scale: 5 }, // html2canvas 옵션
			jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' } // jsPDF 옵션
		};
	
		html2pdf().from(element).set(options).save();
		
		setTimeout(function() {
			alert("이전 페이지로 돌아갑니다.");
			history.back();
			}, 3000);
		
	});
</script>
</head>
<body>
	<div class="container p-0 m-auto" style="width: 750px; height:750px;" id="pdf">
		<div class="row g-0 m-0 mb-4 mt-5" id="header" >
			<div class="col-7 pt-4" id="mainTitle">
				<h2>${confirmMap['FORM_NAME'] }</h2>
				<input type="hidden" id="formName" value="${confirmMap['FORM_NAME'] }">
			</div>
			<div class="col-5 pt-2 pr-4" id="check-div">
				<table id="check" width="280" class="table-bordered" align="right" style="text-align: center;">
					<tbody>
						<tr>
					    	<td width="70">기안</td>
						    <td width="70">검토</td>
						    <td width="70">확인</td>
						    <td width="70">승인</td>
						</tr>
						<tr>
						    <td height="60">${confirmMap['NAME'] }</td>
						    <td height="60">${confirmMap['CONFIRM1NAME'] }</td>
						    <td height="60">${confirmMap['CONFIRM2NAME'] }</td>
						    <td height="60">${confirmMap['CONFIRM3NAME'] }</td>
						</tr>
						<tr>
						    <td height="10">
						    	<fmt:formatDate value="${confirmMap['CREATE_DATE'] }" pattern="yy-MM-dd" />
						    </td>
						    <td height="10">
						    	<fmt:formatDate value="${confirmMap['REVIEW_DATE'] }" pattern="yy-MM-dd" />
						    </td>
						    <td height="10">
						    	<fmt:formatDate value="${confirmMap['CONFIRM_DATE'] }" pattern="yy-MM-dd" />
						    </td>
						    <td height="10">
						    	<fmt:formatDate value="${confirmMap['COMPLETE_DATE'] }" pattern="yy-MM-dd" />
						    </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row g-0 m-0" style="width: 100%">
			<table class="table-bordered" id="document" align="center" width="95%" >
				<tbody>
					<tr>
						<td width="25%" height="50">문서번호</td>
						<td width="25%"align="center">
							${confirmMap['CONFIRM_DOCUMENT_NO'] }
							<input type="hidden" id="confirmDocumentNo" name="confirmDocumentNo" value="${confirmMap['CONFIRM_DOCUMENT_NO'] }">
						</td>
						<td width="25%">작성일자</td>
						<td width="25%" align="center">
							<fmt:formatDate value="${confirmMap['CREATE_DATE'] }" pattern="yyyy-MM-dd" />
						</td>
				    </tr>
					<tr>
						<td height="50">기안자</td>
						<td align="center">
							${confirmMap['NAME'] }
						</td>
						<td>검토일자</td>
						<td align="center">
							<fmt:formatDate value="${confirmMap['REVIEW_DATE'] }" pattern="yyyy-MM-dd" />
						</td>
				  	</tr>
					<tr>
						<td height="50">부서(팀)</td>
						<td align="center">
							${empMap['DEPT_NAME'] }
						</td>
						<td>확인일자</td>
						<td align="center">
							<fmt:formatDate value="${confirmMap['CONFIRM_DATE'] }" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<tr>
						<td height="50">직 위</td>
						<td align="center">
							${empMap['POSITION_NAME'] }
						</td>
						<td>승인일자</td>
						<td align="center">
							<fmt:formatDate value="${confirmMap['COMPLETE_DATE'] }" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<tr>
						<td height="50">제 목</td>
						<td class="pl-2" colspan="3" align="left" style="padding:3px;">
							${confirmMap['CONFIRM_TITLE'] }
						</td>
					</tr>
				  	<tr>
				    	<td height="200">
				    	<br>
				      	내
				      	<br>
				      	<br>
				      	용
				      	<br>
				      	</td>
						<td colspan="3">
							${confirmMap['CONFIRM_CONTENT'] }
						</td>
				  	</tr>
				 	<tr>
						<td height="50">합의부서</td>
						<td align="center">
	                        <c:if test="${!empty deptAgreeMap['DEPTNAME'] }">
	                        	${deptAgreeMap['DEPTNAME']} 
	                        </c:if>
						</td>
				      	<td>합의일자</td>
						<td align="center">
							<c:if test="${!empty deptAgreeMap['DEPTNAME'] }">
							${deptAgreeMap['DEPTAGREE_DATE']}
	                        </c:if>
						</td>
				  	</tr>
				 	<tr>
						<td height="50">참조자</td>
						<td class="pl-2" colspan="3" align="left" >
	                    	<c:if test="${!empty referEmpList }">
								<c:forEach var="empVo" items="${referEmpList }" varStatus="loop">
									${empVo.name }
								<c:if test="${!loop.last}">, </c:if>
								</c:forEach>	                    		
	                    	</c:if>
						</td>
				  	</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>