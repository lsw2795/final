<!-- 결재 문서 상세보기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문서</title>
    <script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
    <link rel="apple-touch-icon" sizes="180x180" href="<c:url value='/assets/img/favicons/apple-touch-icon.png'/>">
    <link rel="icon" type="image/png" sizes="32x32" href="<c:url value='/assets/img/favicons/favicon-32x32.png'/>">
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value='/assets/img/favicons/favicon-16x16.png'/>">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/img/favicons/favicon.ico'/>">
    <link rel="manifest" href="<c:url value='/assets/img/favicons/manifest.json'/>">
 	<meta name="msapplication-TileImage" content="<c:url value='/assets/img/favicons/mstile-150x150.png'/>">
    <meta name="theme-color" content="#ffffff">
    <script src="<c:url value='/assets/js/config.js'/>"></script>
    <script src="<c:url value='/vendors/simplebar/simplebar.min.js'/>"></script>
	<script src="<c:url value='/js/approval.js'/>"></script>
	<!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="<c:url value='/vendors/simplebar/simplebar.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/theme-rtl.css'/>" rel="stylesheet" id="style-rtl">
    <link href="<c:url value='/assets/css/theme.css'/>" rel="stylesheet" id="style-default">
    <link href="<c:url value='/assets/css/user-rtl.css'/>" rel="stylesheet" id="user-style-rtl">
    <link href="<c:url value='/assets/css/user.css'/>" rel="stylesheet" id="user-style-default">
</head>
<body>
	<input type="hidden" name="confirmState" id="confirmState" value="${confirmMap['CONFIRM_STATE'] }">
	<input type="hidden" name="confirmDocumentNo" id="confirmDocumentNo" value="${confirmMap['CONFIRM_DOCUMENT_NO'] }">
	<input type="hidden" name="searchKeyword" id="searchKeyword" value="${deptAgreeMap['DEPTNAME']}">
	<div class="container p-0">
		<div class="row g-0">
			<div class="col-lg pe-lg-2 mb-3">
				<div class="card h-lg-100 overflow-hidden">
					<div class="card-header bg-light">
						<div class="row gx-2 mb-2">
							<div class="col-sm-2 pt-1">
								${confirmMap['FORM_NAME'] }
							</div>
							<div class="col-sm-10 pt-1" align="right">
								<c:if test="${confirmMap['CONFIRM1']==sessionScope.empNo and (confirmMap['CONFIRM_STATE']==1 or confirmMap['CONFIRM_STATE']==2) and param.title!=6}">
				                    <button class="form-control btn btn-primary" id="review" onclick="clickUpdate()" style="width: 100px">검토</button>
				                    <button class="form-control btn btn-primary" id="return" onclick="clickReturn()" style="width: 100px">반려</button>
			                    </c:if>
			                    <c:if test="${confirmMap['CONFIRM2']==sessionScope.empNo and (confirmMap['CONFIRM_STATE']==3 or confirmMap['CONFIRM_STATE']==4) and param.title!=6}">
				                    <button class="form-control btn btn-primary" id="confirm" onclick="clickUpdate()" style="width: 100px">확인</button>
				                    <button class="form-control btn btn-primary" id="return" onclick="clickReturn()" style="width: 100px">반려</button>
			                    </c:if>
			                    <c:if test="${confirmMap['CONFIRM3']==sessionScope.empNo and (confirmMap['CONFIRM_STATE']==5 or confirmMap['CONFIRM_STATE']==6) and param.title!=6}">
				                    <button class="form-control btn btn-primary" id="complete" onclick="clickUpdate()" style="width: 100px">승인</button>
				                    <button class="form-control btn btn-primary" id="return" onclick="clickReturn()" style="width: 100px">반려</button>
			                    </c:if>
			                    <c:if test="${deptAgreeMap['MANAGER']==sessionScope.empNo and (confirmMap['CONFIRM_STATE']==7 or confirmMap['CONFIRM_STATE']==8) and param.title!=6}">
				                    <button class="form-control btn btn-primary" id="complete" onclick="clickUpdate()" style="width: 100px">합의</button>
				                    <button class="form-control btn btn-primary" id="return" onclick="clickReturn()" style="width: 100px">반려</button>
			                    </c:if>
			                    <c:if test="${confirmMap['EMP_NO']==sessionScope.empNo and confirmMap['CONFIRM_STATE']==9 and param.title!=6}">
				                    <button class="form-control btn btn-primary" id="edit" onclick="edit('${confirmMap['CONFIRM_DOCUMENT_NO'] }')" style="width: 100px">수정</button>
			                    </c:if>
			                    <c:if test="${confirmMap['CONFIRM_STATE']==10 and param.title!=6}">
				                    <button class="form-control btn btn-primary" id="print" onclick="print('${confirmMap['CONFIRM_DOCUMENT_NO'] }')" style="width: 100px">출력</button>
			                    </c:if>
							</div>
						</div>
						<div class="row gx-2">
							<div class="col-sm">	
				                <label class="form-label mb-0">
				               		작성일
				                </label><br>
					            <fmt:formatDate value="${confirmMap['CREATE_DATE'] }" pattern="yyyy-MM-dd" />
			                </div>
			                <div class="col-sm">
					        	<label class="form-label mb-0">
					               	수정일
					            </label><br>
					            <fmt:formatDate value="${confirmMap['UPDATE_DATE'] }" pattern="yyyy-MM-dd" />
			                </div>
			                <div class="col-sm">
					        	<label class="form-label mb-0">
					               	검토일
					            </label><br>
					            <fmt:formatDate value="${confirmMap['REVIEW_DATE'] }" pattern="yyyy-MM-dd" />
			                </div>
			                <div class="col-sm">
					            <label class="form-label mb-0">
					               	확인일
					            </label><br>
					            <fmt:formatDate value="${confirmMap['CONFIRM_DATE'] }" pattern="yyyy-MM-dd" />
			                </div>
			                <div class="col-sm">
					            <label class="form-label mb-0">
					               	결재일
					            </label><br>
					            <fmt:formatDate value="${confirmMap['COMPLETE_DATE'] }" pattern="yyyy-MM-dd" />
			                </div>
			            </div>
		            </div>
		            <div class="card-body">
		            	<div class="row gx-2">
		            		<div class="col-sm-4 mb-3">
		                        <label class="form-label mb-0" for="confirm1">
		                        검토자
		                        </label>
		                        <div id="confirm1Name">
			                        ${confirmMap['CONFIRM1NAME'] }
			                    </div>
		                    </div>
		                    <div class="col-sm-4 mb-3">
		                        <label class="form-label mb-0" for="confirm2">
		                        확인자
		                        </label>
		                        <div id="confirm2Name">
			                        ${confirmMap['CONFIRM2NAME'] }
			                    </div>
		                    </div>
		                    <div class="col-sm-4 mb-3">
		                        <label class="form-label mb-0" for="confirm3">
		                        승인자
		                        </label>
		                        <div id="confirm3Name">
			                        ${confirmMap['CONFIRM3NAME'] }
			                    </div>
		                    </div>
		                    <div class="col-12 mb-3">
		                  		<label class="form-label mb-0" for="confirm_title">
		               				제목
		                    	</label>
		                    	<div id="confirmTitle">
			                    	${confirmMap['CONFIRM_TITLE'] }
		                    	</div>
		                    </div>
		                    <div class="col-sm-6 mb-3">
		                    	<label class="form-label mb-0">
		                        	기안자
		                        </label>
		                    	<div id="name">
			                        ${confirmMap['NAME'] }
			                    </div>
		                    </div>
		                    <div class="col-sm-6 mb-3">
		                        <label class="form-label mb-0" for="confirmDocumentNo">
		                        	문서번호
		                        </label>
		                    	<div>
			                        ${confirmMap['CONFIRM_DOCUMENT_NO'] }
			                    </div>
		                    </div>
		                    <div class="col-sm-6 mb-3">
		                        <label class="form-label mb-0" for="deptName">
		                        	부서
		                        </label><br>
		                    	<div id="deptName">
		                       		${empMap['DEPT_NAME'] }
			                    </div>
		                    </div>
		                    <div class="col-sm-6 mb-3">
		                        <label class="form-label mb-0" for="positionName">
		                        	직위
		                        </label><br>
		                    	<div id="positionName">
		                       		${empMap['POSITION_NAME'] }
			                    </div>
		                    </div>
		                    <div class="col-sm-6 mb-3">
		                    	<label class="form-label mb-0" for="deptNo">
		                        	합의부서
		                        </label>
		                        <div id="deptName">
			                        <c:if test="${empty deptAgreeMap['DEPTNAME'] }">
			                        	합의부서가 없습니다.
			                        </c:if>
			                        <c:if test="${!empty deptAgreeMap['DEPTNAME'] }">
			                        	${deptAgreeMap['DEPTNAME']} 
			                        </c:if>
		                        </div>
		                    </div>
		                    <div class="col-sm-6 mb-3" >
		                        <label class="form-label mb-0" for="referEmpName">
		                        	참조자
		                        </label>
		                    	<div id="referName">
			                    	<c:if test="${empty referEmpList }">
			                    		참조자가 없습니다.
			                    	</c:if>
			                    	<c:if test="${!empty referEmpList }">
										<c:forEach var="empVo" items="${referEmpList }" varStatus="loop">
											${empVo.name }
											<c:if test="${!loop.last}">, </c:if>
										</c:forEach>	                    		
			                    	</c:if>
			                    </div>
		                    </div>
		                    <div class="col-sm-6 mb-3">
		                        <label class="form-label mb-0" for="startDate">
		                        	시작일
		                        </label>
		                        <div id="startDate">
			                        <fmt:formatDate value="${confirmMap['START_DATE'] }" pattern="yyyy-MM-dd" />
			                    </div>
		                    </div>
		                    <div class="col-sm-6 mb-3">
		                        <label class="form-label mb-0" for="endDate">
		                        	종료일
		                        </label>
		                        <div id="endDate">
			                        <fmt:formatDate value="${confirmMap['END_DATE'] }" pattern="yyyy-MM-dd" />
			                    </div>
		                    </div>
		                    <div class="col-12 mb-3">
		                        <label class="form-label mb-0" for="confirmContent">
		                        	내용
		                        </label>
		                        <div id="confirmContent">
			                        ${confirmMap['CONFIRM_CONTENT'] }
			                    </div>
		                    </div>
		                    <div class="col-12 mb-3">
		                        <label class="form-label mb-0">첨부파일</label>
		                        <div>
			                        <c:if test="${!empty fileList}">
				                        <c:forEach var="fileVo" items="${fileList }" varStatus="loop">
											<span>
												<img src="<c:url value='/images/file.gif' />" alt="파일그림">
												<a href="<c:url value='/confirmFile/download?fileName=${fileVo.fileName }'/>">
													${fileInfoArr[loop.index]}
												</a>
											</span><br>
				                        </c:forEach>
									</c:if>
			                        <c:if test="${empty fileList}">
										첨부파일이 없습니다.
									</c:if>
								</div>
		                    </div>
			                <div class="col-sm-2 m-auto mt-3">
				            	<button class="form-control btn btn-primary" type="button" onclick='closeUpdate(${confirmMap["EMP_NO"]},${sessionScope.empNo},${confirmMap["CONFIRM_STATE"]})'  style="width: 100px">닫기</button>
			                </div>
		                </div>
		        	</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="<c:url value='/vendors/popper/popper.min.js'/>"></script>
    <script src="<c:url value='/vendors/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/vendors/anchorjs/anchor.min.js'/>"></script>
    <script src="<c:url value='/vendors/is/is.min.js'/>"></script>
    <script src="<c:url value='/vendors/echarts/echarts.min.js'/>"></script>
    <script src="<c:url value='/vendors/fontawesome/all.min.js'/>"></script>
    <script src="<c:url value='/vendors/lodash/lodash.min.js'/>"></script>
    <script src="<c:url value='https://polyfill.io/v3/polyfill.min.js?features=window.scroll'/>"></script>
    <script src="<c:url value='/vendors/list.js/list.min.js'/>"></script>
    <script src="<c:url value='/assets/js/theme.js'/>"></script>
</body>
</html>