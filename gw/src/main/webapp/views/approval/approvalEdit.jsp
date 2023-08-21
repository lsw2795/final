<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문서 수정</title>
	<!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <!-- jquery  -->
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
<form name="documentFrm" method="post" enctype="multipart/form-data" action="<c:url value='/approval/approvalWrite'/>">
<div class="container p-0">
	<div class="row g-0">
		<div class="col-lg pe-lg-2 mb-3">
			<div class="card h-lg-100 overflow-hidden">
				<div class="card-header bg-light">
					<div class="row gx-2 mb-2">
						<div class="col-sm-2 pt-1">
							결재 문서 작성
						</div>
						<div class="col-sm-3" align="left" > 
							<label class="form-label" for="documentNo">
			               		종류
			                </label>
				            <select class="form-select" name="documentNo" id="documentNo" style="display: inline">
				                <option value="0">종류 선택</option>
				                <c:if test="${!empty formList}">
				                <c:forEach var="documentFormVo" items="${formList }">
					                <option value="${documentFormVo.documentNo }" 
						                <c:if test="${confirmMap['DOCUMENT_NO']==documentFormVo.documentNo}">
						                	selected="selected"
						                </c:if>
					                >${documentFormVo.formName }</option>
				                </c:forEach>
				                </c:if>
				            </select>
						</div>
					</div>
					<div class="row gx-2">
						<div class="col-sm">	
			                <label class="form-label">
			               		작성일
			                </label><br>
		                </div>
		                <div class="col-sm">
				        	<label class="form-label">
				               	수정일
				            </label><br>
		                </div>
		                <div class="col-sm">
				        	<label class="form-label">
				               	검토일
				            </label><br>
		                </div>
		                <div class="col-sm">
				            <label class="form-label">
				               	확인일
				            </label><br>
		                </div>
		                <div class="col-sm">
				            <label class="form-label">
				               	결재일
				            </label><br>
		                </div>
		            </div>
	            </div>
	            <div class="card-body">
	            	<div class="row gx-2">
	                    <div class="col-12 mb-3">
	                  		<label class="form-label" for="confirm_title">
	               				제목
	                    	</label>
	                    	<input class="form-control" name="confirmTitle" id="confirmTitle" type="text" value="${confirmMap['CONFIRM_TITLE'] }" />
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                    	<label class="form-label">
	                        	기안자
	                        </label><br>
	                        	${confirmMap['NAME'] }
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                        <label class="form-label" for="confirmDocumentNo">
	                        	문서번호
	                        </label><br>
	                        <div id="cdNoDiv">
	                        	${confirmMap['CONFIRM_DOCUMENT_NO'] }
	    					</div>
	    					<input name="confirmDocumentNo" id="confirmDocumentNo" type="hidden" value="${confirmMap['CONFIRM_DOCUMENT_NO'] }" />	                
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                        <label class="form-label" for="deptName">
	                        	부서
	                        </label><br>
	                       		${empMap['DEPT_NAME'] }
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                        <label class="form-label" for="positionName">
	                        	직위
	                        </label><br>
	                        	${empMap['POSITION_NAME'] }
	                    </div>
	                    <div class="col-sm-6">
	                    	<label class="form-label" for="deptNo">
	                        	합의부서
	                        </label>
	                        <select class="form-select" name="deptNo" id="deptNo">
					            <option value="0">부서 선택</option>
					            <c:if test="${!empty deptList }">
	                        	<c:forEach var="deptVo" items="${deptList }">
					                <option value="${deptVo.deptNo}" 
						                <c:if test="${deptAgreeMap['DEPT_NO']==deptVo.deptNo}">
						                	selected="selected"
						                </c:if>
					                >${deptVo.name }</option>
				                </c:forEach>
				                </c:if>
	                        </select>
	                    </div>
	                    <div class="col-sm-6" >
	                        <label class="form-label" for="referEmpName">
	                        	참조자
	                        </label>
	                        <a href="#" onclick="selectRefer()">
	                        	<span class="badge rounded-pill text-bg-primary" >
	                        		선택
	                        	</span>
	                        </a>
	                        <div id="referEmpName" >
	                       		<span id="referEmpNameSpan">참조자를 선택하세요</span>
	                       		<div id="referEmpNo"></div>
	                        </div>
	                    </div>
	                    <div class="col-sm-6 mt-2">
	                        <label class="form-label" for="startDate">시작일</label>
	                        <div>
	                    		<input type="date" name="startDate">
	                    	</div>
	                    </div>
	                    <div class="col-sm-6 mt-2">
	                        <label class="form-label" for="endDate">종료일</label>
	                        <div>
	                    		<input type="date" name="endDate">
	                    	</div>
	                    </div>
	                    <div class="col-12">
			                <div class="row gx-2 mt-3 mb-3">
		                       	<div class="col-sm-6" >
		                       		<input class="form-control" id="create" onclick="createLine()" type="button" value="결재라인 생성">
		                       	</div>
		                       	<div class="col-sm-6" >
		                       		<input class="form-control" id="select" onclick="selectLine()" type="button" value="결재라인 선택">
		                       	</div>
	                       	</div>
	                    </div>
	                    <div class="col-sm-4 mb-3">
	                        <label class="form-label" for="confirm1">검토자</label>
	                        <div id="confirm1_Name">
	                        	검토자를 선택하세요
	                        </div>
	                    </div>
	                    <div class="col-sm-4 mb-3">
	                        <label class="form-label" for="confirm2">확인자</label>
	                        <div id="confirm2_Name">
	                        	확인자를 선택하세요
	                        </div>
	                    </div>
	                    <div class="col-sm-4 mb-3">
	                        <label class="form-label" for="confirm3">승인자</label>
	                        <div id="confirm3_Name">
	                        	승인자를 선택하세요
	                        </div>
	                    </div>
	                    <div class="col-12">
	                        <label class="form-label" for="confirmContent">내용</label>
	                        <textarea class="form-control" name="confirmContent" id="confirmContent" rows="5" placeholder="내용을 입력하세요"></textarea>
	                    </div>
	                    <div class="col-12 mt-2">
	                        <label class="form-label mb-0">첨부파일 추가/삭제</label><br>
		                    <button type="button" class="btn btn-outline-secondary" id="btFilePlus" style="width: 50px">+</button>
		                    <button type="button" class="btn btn-outline-secondary" id="btFileDel" style="width: 50px">-</button>
	                    </div>
	                    <div class="col-sm-2 m-auto mt-3">
	                        <input class="form-control btn btn-primary" type="submit" value="작성"/>
	                    </div>
	                </div>
	        	</div>
			</div>
		</div>
	</div>
</div>
<input name="confirmLineNo" id="confirmLineNo" type="hidden"/>
</form>
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