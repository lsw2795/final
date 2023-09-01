<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../inc/adminTop.jsp" %>
<script type="text/javascript">
	$(function(){
		$('input[name=allCheck]').click(function(){
			$('td input[type=checkbox]').prop('checked',this.checked);
		});
		
		$('#deleteConfirm').click(function(){
			$('td input[type=checkbox]:checked').each(function(){
				$(this).trigger('change');
			});
			
			var cnt=$('td input[type=checkbox]:checked').length;
			if(cnt==0){
				alert("삭제 할 문서를 선택하세요");
				return false;
			}
			
			$('form[name=frmList]').submit();
		});
	});
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmSearch"]').submit();
	}
	
	function search(){
		$('input[name="currentPage"]').val('1');
		$('form[name="frmSearch"]').submit();
	}
	
	function delOk(chk,no,create,deadLine){
		var today = new Date();
		var create = new Date(create);
		var deadLine = parseInt(deadLine);
		
		today.setHours(0, 0, 0, 0);
		create.setHours(0, 0, 0, 0);
		create.setFullYear(create.getFullYear() + deadLine);
		
		if(today<create){
			alert(no+"문서는 보존기한이 남아있는 문서입니다.");
			$(chk).prop('checked',false);
		}	
		
	}
	
</script>
<div class="container p-0">
	<div class="col-12-lg pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-header bg-light">
				<div class="row g-3">
					<div class="col-md-10 listTitle">
						익명게시판 신고 목록 
					</div>
					<div class="col-md-2" align="right">
						<button class="form-control btn btn-primary" onclick="search()">검색</button>
					</div>
				</div>
			</div>
			<div class="card-body">
				<form class="row g-3" name="frmSearch" action="<c:url value='/report/anonymousReportList'/>" >
				<input type="hidden" name="currentPage" value="">
					<div class="col-md-4">
						<label class="form-label" for="confirmDocumentNo">신고유형</label>
						<select class="form-select" name="searchKeyword">
							<option value="0"
							<c:if test="${reportVO.searchKeyword==0}">
								selected="selected"
							</c:if>
							>선택하세요</option>
							<option value="1"
							<c:if test="${reportVO.searchKeyword==1}">
								selected="selected"
							</c:if>
							>게시글</option>
							<option value="2"
							<c:if test="${reportVO.searchKeyword==2}">
								selected="selected"
							</c:if>
							>댓글</option>
						</select>
					</div>
					<div class="col-md-4">
					    <label class="form-label" for="searchName">신고자</label>
						<input class="form-control" name="searchName" id="searchName" type="text" value="${param.searchName }" />
					</div>
					<div class="col-md-4">
					    <label class="form-label" for="reportDate">신고일</label>
					    <input class="form-control" name="reportDate" id="reportDate" type="date" value="${reportVO.reportDate}"/>
					</div>
					<div class="col-md-4">
						<label class="form-label" for="searchContent">게시글</label>
						<input class="form-control" name="searchContent" id="searchContent" type="text" value="${param.searchContent}"/>
					</div>
					<div class="col-md-4">
						<label class="form-label" for="searchComment">댓글</label>
						<input class="form-control" name="searchComment" id="searchComment" type="text" value="${param.searchComment}" />
					</div>
					<div class="col-md-4">
					    <label class="form-label" for="reportStatus">처리상태</label>
					    <select class="form-select" name="reportStatus" id="reportStatus">
							<option value="-1"
							<c:if test="${reportVO.reportStatus==-1}">
								selected="selected"
							</c:if>
							>선택하세요</option>
							<option value="0"
							<c:if test="${reportVO.reportStatus==0}">
								selected="selected"
							</c:if>
							>대기</option>
							<option value="1"
							<c:if test="${reportVO.reportStatus==1}">
								selected="selected"
							</c:if>
							>완료</option>
						</select>
					</div>
				</form>
			</div>
		</div>
	</div>
	<form name="frmList" method="post" action="<c:url value=''/>" >
	<div class="col-12-lg pe-lg-2 mb-3">
		<div class="card h-lg-100 overflow-hidden">
			<div class="card-body table-responsive scrollbar">
				<div class="table-responsive scrollbar">
					<table class="table table-hover table-striped overflow-hidden" style="width: 100%">
						<thead>
					    	<tr class="align-middle" align="center">
							    <th width="5%" scope="col">
							      	<input type="checkbox" name="allCheck">
							    </th>
						      	<th width="25%" scope="col">신고유형</th>
						      	<th width="15%" scope="col">신고자</th>
						      	<th width="15%" scope="col">게시글</th>
						        <th width="15%" scope="col">댓글</th>
						        <th width="15%" scope="col">신고일</th>
						        <th width="10%" scope="col">처리상태</th>
					      	</tr>
					    </thead>
					    <tbody>
					    	<c:if test="${!empty reportList }">
					    		<c:forEach var="map" items="${reportList }">
					    			<tr class="align-middle" align="center">
					    				<td>
											<input type="checkbox" onchange="delOk()" name="deleteNo" value="${map['REPORT_NO']}">
										</td>
					    				<td>
					    					<c:if test="${empty map['COMMENT_NO']}">
					    						게시글에 대한 신고
					    					</c:if>
					    					<c:if test="${!empty map['COMMENT_NO']}">
					    						댓글에 대한 신고
					    					</c:if>
					    				</td>
					    				<td>${map['NAME']}</td>
					    				<td>${map['CONTENT']}</td>
					    				<td>${map['COMMENT_CONTENT']}</td>
					    				<td>
					    					<fmt:formatDate value="${map['REPORT_DATE']}" pattern="yy-MM-dd"/>
					    				</td>
					    				<td>
						    				<c:if test="${map['REPORT_STATUS']==0}">
									        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-warning">
									        		<b class="state">대기</b><span class="ms-1 fas fa-ban" data-fa-transform="shrink-2"></span>
									        	</span>
									        </c:if> 
									        <c:if test="${map['REPORT_STATUS']==1}">
									        	<span class="badge badge rounded-pill d-block p-2 badge-subtle-success">
										        	<b class="state">완료</b><span class="ms-1 fas fa-check" data-fa-transform="shrink-2"></span>
											    </span>
									        </c:if>
					    				</td>
					    			</tr>
					    		</c:forEach>
					    	</c:if>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card-footer border-top d-flex justify-content-center">
			<c:if test="${pagingInfo.firstPage>1 }">
     			<button class="btn btn-falcon-default btn-sm me-2" onclick="pageFunc(${pagingInfo.firstPage-1})" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Prev">
     				<span class="fas fa-chevron-left"></span>
     			</button>
     		</c:if>
     		
     		<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
     			<c:if test="${i == pagingInfo.currentPage }">
	     			<a class="btn btn-sm btn-falcon-default text-primary me-2" href="#!">${i }</a>
     			</c:if>
     			<c:if test="${i != pagingInfo.currentPage }">
	     			<a class="btn btn-sm btn-falcon-default me-2" onclick="pageFunc(${i})" href="#!">${i }</a>
     			</c:if>
     		</c:forEach>
     		
     		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
     			<button class="btn btn-falcon-default btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Next">
     				<span class="fas fa-chevron-right"></span>
     			</button>
     		</c:if>
   			</div>
	   		<button class="btn btn-sm btn-falcon-default text-primary" type="button" id="deleteConfirm">삭제</button>
		</div>
	</div>
	</form>
</div>
<%@ include file = "../../inc/adminBottom.jsp" %>