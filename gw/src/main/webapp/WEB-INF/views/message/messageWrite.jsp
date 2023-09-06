<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.authority!='Y' }">
<%@ include file = "../inc/top.jsp" %>
</c:if>
<c:if test="${sessionScope.authority=='Y' }">
<%@ include file = "../inc/adminTop.jsp" %>
</c:if>
<script type="text/javascript">
	$(function(){
		$('form[name=frmMessageWrite]').submit(function(){
			if($('#readerDiv').find('#reader').length==0){
				alert("쪽지를 보낼 사람을 선택하세요.");
				return false;
			}
			
			if($('#messageContent').val().length==0){
				alert("쪽지 보낼 내용을 입력하세요.");
				$('#messageContent').focus();
				return false;
			}
		});
	});
		function setReader(no, name){
			var bool=true;
			var str="";
			
			if(${sessionScope.empNo}==no){
				alert("선택 할 수 없습니다.")
				return false;
			}
			
			$('#readerName>#reader').each(function(){
				if($(this).val()==no){
					alert("이미 선택된 사람입니다.")
					bool=false;
				}
			});
			
			if(bool){
				str+="<span id='readerName'>";
				str+=name+"<a href='#' onclick='delReader(this)'>";
				str+="<span class='fas fa-minus' style='width: 8px'></span></a>";
				str+="<input id='reader' name='reader' type='hidden' value='"+no+"'/>";
				str+="&nbsp;&nbsp;</span>";
				
				if($('#readerDiv').find('#readerName').length==0){
					$('#readerDiv').html(str);
				}else{
					$('#readerDiv').append(str);
				}
			}
		}
		
		function delReader(a){
			$(a).parent().remove();
			if($('#readerDiv').find('#readerName').length==0){
				$('#readerDiv').html("<b>조직도에서 선택하세요</b>");
			}
		}
</script>
<div class="container p-0">
	<div class="row g-0">
		<div class="col-lg-4 pe-lg-2 mb-3">
			<div class="card h-lg-100 overflow-hidden">
				<div class="card-header bg-light">
					<div class="row align-items-center">
	                    <div class="col pl-2">
							<h5 class="mb-0">조직도</h5>
	                    </div>
	                </div>
				</div>
				<div class="card-body scrollbar" style="max-height: 556px; min-height: 556px;">
					<ul id="navbarVerticalNav">
		        	<c:forEach var="deptVo" items="${deptList }">
		        		<li class="nav-item">
		        			<a class="nav-link" href="#${deptVo.deptNo }" data-bs-toggle="collapse" >
			                    ${deptVo.name}
		                  	</a>
		                  	<ul class="nav collapse" id="${deptVo.deptNo }">
			                  	<c:forEach var="employeeMap" items="${empList }">
				                  	<c:if test="${deptVo.deptNo == employeeMap['DEPT_NO']}">
						            	<li class="nav-item" style="width: 100%"><!-- 사원 -->
							        		<a class="a-select nav-link" onclick="setReader('${employeeMap['EMP_NO'] }','${employeeMap['POSITION_NAME']} ${employeeMap['NAME']}')" href="#">
					                    		<span class="nav-link-icon"><span class="fas fa-user"></span></span>
							                	<div id="empNameDiv" style="display: inline;">${employeeMap['POSITION_NAME']} ${employeeMap['NAME']} </div>
							                	<input type="hidden" id="empNo" value="${employeeMap['EMP_NO'] }">
							                </a>
						                </li>
					                </c:if>
				                </c:forEach>
							</ul>
		        		</li>
		        	</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-8 pe-lg-2 mb-3">
			<div class="card h-lg-100 overflow-hidden">
				<form class="card" name="frmMessageWrite" method="post" action="<c:url value='/message/messageWrite'/>">
					<div class="card-header bg-light">
						<div class="row align-items-center">
		                    <div class="col pl-2">
								<h5 class="mb-0">쪽지 보내기</h5>
		                    </div>
	                	</div>
					</div>
					<div class="card-body p-0" style="min-height: 556px;">
						<div class="border border-top-0 border-200">
							<label class="form-label border-200">받는사람</label>
							<div id="readerDiv">
							<c:if test="${!empty empSet }">
								<span id="readerName">${empSet['POSITION_NAME']} ${empSet['NAME']}
								<a href="#" onclick="delReader(this)">
								<span class="fas fa-minus" style='width: 8px'></span></a>
								<input id="reader" name="reader" type="hidden" value="${empSet['EMP_NO']}"/>
								&nbsp;&nbsp;</span>
							</c:if>
							<c:if test="${empty empSet }">
								<b>조직도에서 선택하세요.</b>
							</c:if>
							</div>
						</div>
						<label class="form-label">내용</label>
				        <textarea rows="19" cols="20" class="form-control" id="messageContent" name="messageContent" placeholder="내용을 입력하세요."></textarea>
					</div>
				    <div class="card-footer border-top border-200 ">
						<div class="align-items-center" align="right">
							<button class="btn btn-primary btn-sm px-5 me-2" type="submit">보내기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<c:if test="${sessionScope.authority!='Y' }">
<%@ include file = "../inc/bottom.jsp" %>
</c:if>
<c:if test="${sessionScope.authority=='Y' }">
<%@ include file = "../inc/adminBottom.jsp" %>
</c:if>