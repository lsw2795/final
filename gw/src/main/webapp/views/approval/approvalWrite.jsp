<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<script type="text/javascript">
	$(function(){
	});
	
	function selectReper(){
		window.open("<c:url value='/approval/selectEmp/selectEmp'/>","_blank","width=800, height=500")
	}
	
	function createLine(){
		window.open("<c:url value='/approval/selectEmp/createConfirmLine'/>","_blank","width=800, height=500")
	}
	
	function selectLine(){
		window.open("<c:url value='/approval/selectEmp/selectConfirmLine'/>","_blank","width=600, height=520")
	}
</script>
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
					                <option value="${documentFormVo.documentNo }">${documentFormVo.formName }</option>
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
			                <c:set var="now" value="<%=new java.util.Date()%>" />
			                <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
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
	                    	<input class="form-control" name="confirmTitle" id="confirmTitle" type="text" placeholder="제목을 입력하세요" />
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                    	<label class="form-label">
	                        	기안자
	                        </label><br>
	                        	${empVo.name }
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                        <label class="form-label" for="confirmDocumentNo">
	                        	문서번호
	                        </label><br>
	                        <div id="cdNoDiv">
	                        	<fmt:formatDate value="${now}" pattern="yyMMdd" />-${empVo.empNo }
	    					</div>
	    					<input name="confirmDocumentNo" id="confirmDocumentNo" type="hidden" value="<fmt:formatDate value='${now}' pattern='yyMMdd' />-${empVo.empNo }" />	                
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                        <label class="form-label" for="deptName">
	                        	부서
	                        </label><br>
	                       		${deptVo.name }
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                        <label class="form-label" for="positionName">
	                        	직책
	                        </label><br>
	                        	${positonVo.positionName }
	                    </div>
	                    <div class="col-sm-6">
	                    	<label class="form-label" for="deptNo">
	                        	합의부서
	                        </label>
	                        <select class="form-select" name="deptNo" id="deptNo">
					            <option value="0">부서 선택</option>
					            <c:if test="${!empty deptList }">
	                        	<c:forEach var="deptVo" items="${deptList }">
					                <option value="${deptVo.deptNo}">${deptVo.name }</option>
				                </c:forEach>
				                </c:if>
	                        </select>
	                    </div>
	                    <div class="col-sm-6" >
	                        <label class="form-label" for="reperEmpName">
	                        	참조자
	                        </label>
	                        <div id="reperEmpName" onclick="selectReper()">
	                       		<span id="reperEmpNameSpan">참조자를 선택하세요</span>
	                       		<div id="reperEmpNo"></div>
	                        </div>
	                    </div>
	                    <div class="col-12">
			                <div class="row gx-2 mt-3 mb-3">
		                       	<div class="col-sm-6" >
		                       		<input class="form-control" onclick="createLine()" type="button" value="결재라인 생성">
		                       	</div>
		                       	<div class="col-sm-6" >
		                       		<input class="form-control" onclick="selectLine()" type="button" value="결재라인 선택">
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
	                        <textarea class="form-control" name="confirmContent" 
	                        	id="confirmContent" rows="6" placeholder="내용을 입력하세요" >
	                        </textarea>
	                    </div>
	                    <div class="col-12 mt-1">
	                        <label class="form-label mb-0" for="confirmFile">첨부파일</label>
	                        <input class="form-control" name="confirmFile" id="confirmFile" type="file"/>
	                    </div>
	                    <div class="col-12 mt-1">
	                        <label class="form-label mb-0"  for="confirmFile2">첨부파일</label>
	                        <input class="form-control" name="confirmFile2" id="confirmFile2" type="file"/>
	                    </div>
	                    <div class="col-12 mt-1">
	                        <label class="form-label mb-0" for="confirmFile3">첨부파일</label>
	                        <input class="form-control" name="confirmFile3" id="confirmFile3" type="file"/>
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
<%@ include file = "../inc/bottom.jsp" %>