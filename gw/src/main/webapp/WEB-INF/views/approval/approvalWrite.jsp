<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('form[name=documentFrm]').submit(function(){
			var bool=false;
			if($('#referEmpNo').find('input[name=referEmpNo]').length>0){
				$('input[name=referEmpNo]').each(function(){
					if($(this).val()==$('#user').val()){
						bool=true;
					}
				});
			}else{
				bool=false;
			}
			
			if($('#documentNo').val()==0){
				alert('결재 종류를 선택하세요');
				$('#documentNo').focus();
				return false;
			}
			
			if($('#confirmTitle').val().length==0){
				alert('제목을 입력하세요');
				$('#confirmTitle').focus();
				return false;
			}

			if($('#confirmLineNo').val().length==0){
				alert('결재선을 선택하세요');
				$('#select').focus();
				return false;
			}
			
			if($('#confirmContent').val().length==0){
				alert('내용을 입력하세요');
				$('#confirmContent').focus();
				return false;
			}
			
			if($('#startDate').val().length==0){
				alert('시작일을 선택하세요');
				$('#startDate').focus();
				return false;
			}
			
			if($('#endDate').val().length==0){
				alert('종료일을 선택하세요');
				$('#endDate').focus();
				return false;
			}
			
			if(bool){
				alert('참조자에 작성자가 포함되었습니다.');
				return false;
			}
		});
		
		$('#btFilePlus').click(function(){
			var num = $('input[type=file]').length+1;
			$('#btFilePlus').parent().before("<div class='col-12 mt-1 file'>"+
					"<label class='form-label mb-0'>첨부파일</label>"+
					"<input class='form-control' name='confirmFile"+num+"' type='file'/></div>");	
		});
		
		$('#btFileDel').click(function(){
			$('.file:last').remove();
		});
		
		
	});
	
	function startDateChange(){
		var today = new Date();
		today.setHours(0, 0, 0, 0);
		var start = new Date($('#startDate').val());
		if(start<today){
			alert('시작일 설정이 잘못되었습니다.');
			$('#startDate').val('');
			$('#startDate').focus();
		}
	}
	
	function endDateChange(){
		if($('#startDate').val().length==0){
			alert('시작일을 선택하세요.');
			$('#endDate').val('');
			$('#startDate').focus();
		}else{
			var start = new Date($('#startDate').val());
			start.setHours(0, 0, 0, 0);
			var end = new Date($('#endDate').val());
			if(end<start){
				alert('종료일 설정이 잘못되었습니다.');
				$('#endDate').val('');
				$('#endDate').focus();
			}
		}
	}
	
	function selectRefer(){
		var referEmpNo=[];
		$('input[name=referEmpNo]').each(function(){
			referEmpNo.push($(this).val());
		});
		window.open("<c:url value='/approval/selectEmp/selectEmp?referEmpNo="+referEmpNo+"'/>","_blank","width=800, height=580")
	}
	
	function createLine(){
		window.open("<c:url value='/approval/selectEmp/createConfirmLine'/>","_blank","width=800, height=600")
	}
	
	function selectLine(){
		window.open("<c:url value='/approval/selectEmp/selectConfirmLine'/>","_blank","width=600, height=580")
	}
</script>
<form name="documentFrm" method="post" enctype="multipart/form-data" action="<c:url value='/approval/approvalWrite'/>">
<input type="hidden" id="user" value="${sessionScope.empNo}">
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
	                        	직위
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
	                        <label class="form-label" for="referEmpName">
	                        	참조자
	                        </label>
	                        <a href="#" onclick="selectRefer()">
	                        	<span class="badge rounded-pill text-bg-primary" id="referSpan">
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
	                    		<input type="date" name="startDate" id="startDate" onchange="startDateChange()">
	                    	</div>
	                    </div>
	                    <div class="col-sm-6 mt-2">
	                        <label class="form-label" for="endDate">종료일</label>
	                        <div>
	                    		<input type="date" name="endDate" id="endDate" onchange="endDateChange()">
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
<%@ include file = "../inc/bottom.jsp" %>