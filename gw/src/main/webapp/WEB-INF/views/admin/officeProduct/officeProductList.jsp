<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript">
	$(document).ready(function () {
        // Function to update the hidden input field with the active tab value

        $("#meetingRoom-tab").click(function () {
            setActiveTab("meetingRoom");
            redirectToCategory("meetingRoom");
        });  

        $("#noteBook-tab").click(function () {
            setActiveTab("noteBook");
            redirectToCategory("noteBook");
        });

        $("#rentCar-tab").click(function () {
            setActiveTab("rentCar");
            redirectToCategory("rentCar");
        });
        
		 let key = "${param.category}";
		console.log(key);
		
		
		if(key === "meetingRoom"){
			$("#noteBook-tab").removeClass("active");
			$("#rentCar-tab").removeClass("active");
			$("#meetingRoom-tab").addClass("active");
			
			$("#noteBook").removeClass("show active");
			$("#rentCar").removeClass("show active");
			$("#meetingRoom").addClass("show active");
			
		}else if(key === "noteBook"){
			$("#rentCar-tab").removeClass("active");
			$("#meetingRoom-tab").removeClass("active");
			$("#noteBook-tab").addClass("active");
			
			$("#meetingRoom").removeClass("show active");
			$("#rentCar").removeClass("show active");
			$("#noteBook").addClass("show active");
			
		}else if(key === "rentCar"){
			$("#meetingRoom-tab").removeClass("active");
			$("#noteBook-tab").removeClass("active");
			$("#rentCar-tab").addClass("active");
			
			$("#noteBook").removeClass("show active");
			$("#meetingRoom").removeClass("show active");
			$("#rentCar").addClass("show active");
			
		}
		
		$('#category').val(key); 
		
    });
	
	function redirectToCategory(category) {
	        var url = "<c:url value='/admin/officeProduct/officeProductList?category="+category+"'/>";
	        window.location.href = url;
	        $('#noteBook-tab').attr('aria-selected', true);
	    }
	
	function setActiveTab(tabId) {
           $("#category").val(tabId);
           
       }
	
	function delFunc(){
		var count = $('tbody input[type=checkbox]:checked').length;
		if(count<1){
			alert("삭제하고 싶은 자원을 먼저 체크하세요");
		}
		
		if(count > 0){
			if(confirm('선택한 자원을 삭제하시겠습니까?')){
				$('form[name=frmList]').prop('action', "<c:url value='/admin/officeProduct/delOfficeProduct'/>");
				$('form[name=frmList]').submit();
			} // if
		} 
		
	}
	
	function editFunc(remanNo){
		var editUrl = "<c:url value='/admin/officeProduct/editOfficeProduct?remanNo="+remanNo+"'/>";
		
		// 새 탭 또는 새 창을 중앙에 띄우고 크기를 조정합니다.
        var width = 550;
        var height = 600;
        var left = (window.innerWidth - width) / 2;
        var top = (window.innerHeight - height) / 2;
        
     	// 새 창을 엽니다.
        var newWindow = window.open(editUrl, '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
     
		}
</script>
<style type="text/css">
   .gap-2 {
       padding-left: 52px;
   }
   
   .table-sm > :not(caption) > * > * {
         text-align: center;
   }
   
   #possible{
   	    color: #2c7be5;
	    font-size: 0.8rem;
	    font-weight: bold;
   }
   
   #disable{
	   	color : #e52c2c;
	   	font-size: 0.8rem;
		font-weight: bold;
   }
   
   #otherwise{
	   	color : #1f9565;
	   	font-size: 0.8rem;
		font-weight: bold;
   }
</style>	
<h2>사내 자원관리</h2>
<div class="col-lg-12 pe-lg-2 mb-3">
	<div class="card" id="allContactTable">
		<div class="card-header border-bottom border-200 px-0 admindefault">
			<div class="d-lg-flex justify-content-between">
				<div class="row flex-between-center gy-2 px-x1">
					<form name="frmList" method="post" action='<c:url value='/admin/officeProduct/officeProductList'/>' >
						<input type="hidden" id="category" name="category" value="${param.category}"/>
						<div class="row flex-between-center gy-2 px-x1">
						<div class="col-auto pe-0">
								 <select name="searchCondition" class="form-select admindefault">
		                            <option value="name"
		                            	<c:if test="${param.searchCondition=='name'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >제목</option>
		                            <option value="manager"
	                       		        <c:if test="${param.searchCondition=='manager'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >담당자</option>
		                            <option value="discription"
		                            	<c:if test="${param.searchCondition=='discription'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >내용</option>
		                            <option value="state"
		                            	<c:if test="${param.searchCondition=='state'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >상태</option>
	                          </select>
						</div>
						<div class="col-auto">
							<div class="input-group input-search-width">
								<input name="searchKeyword"
									class="form-control shadow-none search admindefault"
									value='${param.searchKeyword}' type="search"
									placeholder="검색어 입력" aria-label="search" />
								<button
									class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
									<span class="fa fa-search fs--1"></span>
								</button>
							</div>
						</div>
						</div>
						
					</div>
				<div class="border-bottom border-200 my-3"></div>
				<div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                      <div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
                      <div class="d-flex align-items-center">
						<input type="button" value="삭제" id="btnDel" class="btn btn-primary" onclick = "delFunc()"/>
                      </div>
                    </div>
			</div>
		</div>
		
		<div class="card-body p-0 admindefault">
		
		<!-- 탭 메뉴 -->
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="meetingRoom-tab" data-bs-toggle="tab"
						data-bs-target="#meetingRoom" type="button" role="tab" aria-controls="meetingRoom"
						aria-selected="true">회의실</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="noteBook-tab" data-bs-toggle="tab"
						data-bs-target="#noteBook" type="button" role="tab"
						aria-controls="noteBook" aria-selected="false">노트북</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="rentCar-tab" data-bs-toggle="tab"
						data-bs-target="#rentCar" type="button" role="tab"
						aria-controls="rentCar" aria-selected="false">차량</button>
				</li>
			</ul>
			
			<!-- 내용 -->
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="meetingRoom" role="tabpanel"
					aria-labelledby="meetingRoom-tab">
					<table class="table table-sm table-hover">
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: 20%;" />
						<col style="width: 15%;" />
						<col style="width: 30%;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
					</colgroup>
					<thead class="adminempthead">
						<tr style="text-align: center;">
							<th class="py-2 fs-0 pe-2" style="width: 28px;">
								<div class="form-check d-flex align-items-center">
									<input class="form-check-input"
										id="checkbox-bulk-tickets-select" type="checkbox"
										data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
								</div>
							</th>
							<th class="sort align-middle" scope="col" data-sort="name">자원명[회의실]</th>
							<th class="sort align-middle" scope="col" data-sort="dept">설명</th>
							<th class="sort align-middle" scope="col" data-sort="title">등록일</th>
							<th class="sort align-middle" scope="col" data-sort="regdate">담당자</th>
							<th class="sort align-middle" scope="col" data-sort="readcount">상태</th>
						</tr>
					</thead>
					<tbody class="list" id="table-contact-body">
						<!-- 반복 시작  -->
						<c:set var="idx" value="0"/>
						<c:forEach var="pd" items="${list}">
						<c:if test="${pd.category =='meetingRoom' }">
						
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox"
											id="all-contact-0" name="remanList[${idx}].remanNo"
											data-bulk-select-row="data-bulk-select-row"
											value="${pd.remanNo}"/>
									</div>
								</td>
								<td class="align-middle">
									<a href="#" onclick="editFunc(${pd.remanNo})">
									${pd.name}
									</a>
								</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										${pd.discription}
									</div>
								</td>
								<td class="align-middle">
									<fmt:formatDate value="${pd.regdate}" pattern="yyyy-MM-dd" />
								</td>
								<td class="align-middle">${pd.manager}</td>
								<td class="align-middle">
									<c:choose>
								        <c:when test="${pd.state == 1}">
								            <span id="possible">사용가능</span>
								        </c:when>
								        <c:when test="${pd.state == 2}">
								            <span id = "disable">사용불가</span>
								        </c:when>
								        <c:otherwise>
								            <span id = "otherwise">관리자 문의</span>
								        </c:otherwise>
								    </c:choose>
								</td>
							</tr>
						  </c:if>
						<c:set var = "idx" value="${idx+1 }"/>
						</c:forEach>
						<!-- 반복 끝 -->
					</tbody>
						
				</table>	
				</div>
				<div class="tab-pane fade" id="noteBook" role="tabpanel"
					aria-labelledby="noteBook-tab">
					
					<table class="table table-sm table-hover">
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 35%;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
					</colgroup>
					<thead class="adminempthead">
						<tr style="text-align: center;">
							<th class="py-2 fs-0 pe-2" style="width: 28px;">
								<div class="form-check d-flex align-items-center">
									<input class="form-check-input"
										id="checkbox-bulk-tickets-select" type="checkbox"
										data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
								</div>
							</th>
							<th class="sort align-middle" scope="col" data-sort="name">자원명[노트북]</th>
							<th class="sort align-middle" scope="col" data-sort="dept">설명</th>
							<th class="sort align-middle" scope="col" data-sort="title">등록일</th>
							<th class="sort align-middle" scope="col" data-sort="regdate">담당자</th>
							<th class="sort align-middle" scope="col" data-sort="readcount">상태</th>
						</tr>
					</thead>
					<tbody class="list" id="table-contact-body">
						<!-- 반복 시작  -->
						<c:set var="idx" value="0"/>
						<c:forEach var="pd" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox"
											id="all-contact-0" name = "remanList[${idx }].remanNo"
											data-bulk-select-row="data-bulk-select-row"
											value="${pd.remanNo }"/>
									</div>
								</td>
								<td class="align-middle">
									<a href="#" onclick="editFunc(${pd.remanNo})">
									${pd.name}
									</a>
								</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										${pd.discription}
									</div>
								</td>
								<td class="align-middle">
									<fmt:formatDate value="${pd.regdate}" pattern="yyyy-MM-dd" />
								</td>
								<td class="align-middle">${pd.manager}</td>
								<td class="align-middle">
									 <c:choose>
								        <c:when test="${pd.state == 1}">
								            <span id="possible">사용가능</span>
								        </c:when>
								        <c:when test="${pd.state == 2}">
								            <span id = "disable">사용불가</span>
								        </c:when>
								        <c:otherwise>
								            <span id = "otherwise">관리자 문의</span>
								        </c:otherwise>
								    </c:choose>
								</td>
							</tr>
							<c:set var="idx" value="${idx +1 }"/>
						</c:forEach>
						<!-- 반복 끝 -->
					</tbody>
				</table>	
					
				</div>
				<div class="tab-pane fade" id="rentCar" role="tabpanel"
					aria-labelledby="rentCar-tab">
					
					<table class="table table-sm table-hover">
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 35%;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
					</colgroup>
					<thead class="adminempthead">
						<tr style="text-align: center;">
							<th class="py-2 fs-0 pe-2" style="width: 28px;">
								<div class="form-check d-flex align-items-center">
									<input class="form-check-input"
										id="checkbox-bulk-tickets-select" type="checkbox"
										data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
								</div>
							</th>
							<th class="sort align-middle" scope="col" data-sort="name">자원명[차량]</th>
							<th class="sort align-middle" scope="col" data-sort="dept">설명</th>
							<th class="sort align-middle" scope="col" data-sort="title">등록일</th>
							<th class="sort align-middle" scope="col" data-sort="regdate">담당자</th>
							<th class="sort align-middle" scope="col" data-sort="readcount">상태</th>
						</tr>
					</thead>
					<tbody class="list" id="table-contact-body">
						<!-- 반복 시작  -->
						<c:set var = "idx" value="0"/>
						<c:forEach var="pd" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox"
											id="all-contact-0" name = "remanList[${idx }].remanNo"
											data-bulk-select-row="data-bulk-select-row"
											value="${pd.remanNo }"/>
									</div>
								</td>
								<td class="align-middle">
									<a href="#" onclick="editFunc(${pd.remanNo})">
									${pd.name}
									</a>
								</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										${pd.discription}
									</div>
								</td>
								<td class="align-middle">
									<fmt:formatDate value="${pd.regdate}" pattern="yyyy-MM-dd" />
								</td>
								<td class="align-middle">${pd.manager}</td>
								<td class="align-middle">
									<c:choose>
								        <c:when test="${pd.state == 1}">
								            <span id="possible">사용가능</span>
								        </c:when>
								        <c:when test="${pd.state == 2}">
								            <span id = "disable">사용불가</span>
								        </c:when>
								        <c:otherwise>
								            <span id = "otherwise">관리자 문의</span>
								        </c:otherwise>
								    </c:choose>
								</td>
							</tr>
							<c:set var = "idx" value="${idx + 1 }"/>
						</c:forEach>
						<!-- 반복 끝 -->
					</tbody>
				</table>	
				</div>
				<div class="tab-pane fade" id="noteBook" role="tabpanel"
					aria-labelledby="noteBook-tab">
					
					<table class="table table-sm table-hover">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: 20%;" />
						<col style="width: 15%;" />
						<col style="width: 40%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead class="adminempthead">
						<tr style="text-align: center;">
							<th class="py-2 fs-0 pe-2" style="width: 28px;">
								<div class="form-check d-flex align-items-center">
									<input class="form-check-input"
										id="checkbox-bulk-tickets-select" type="checkbox"
										data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}' />
								</div>
							</th>
							<th class="sort align-middle" scope="col" data-sort="name">자원명[회의실]</th>
							<th class="sort align-middle" scope="col" data-sort="dept">설명</th>
							<th class="sort align-middle" scope="col" data-sort="title">등록일</th>
							<th class="sort align-middle" scope="col" data-sort="regdate">담당자</th>
							<th class="sort align-middle" scope="col" data-sort="readcount">상태</th>
						</tr>
					</thead>
					<tbody class="list" id="table-contact-body">
						<!-- 반복 시작  -->
						<c:forEach var="pd" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox"
											id="all-contact-0"
											data-bulk-select-row="data-bulk-select-row"
											value=""/>
									</div>
								</td>
								<td class="align-middle">${pd.name}</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										<div class="avatar avatar-xl">
											<div class="avatar-name rounded-circle">
												<span></span>
											</div>
										</div>
										<h6 class="mb-0" style="color: black;">${pd.discription}</h6>
									</div>
								</td>
								
								<td class="align-middle">
									<fmt:formatDate value="${pd.regdate}" pattern="yyyy-MM-dd" />
								</td>
								<td class="align-middle">${pd.manager}</td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</tbody>
				</table>	
					
				</div>
			</div>
			<div class="table-responsive scrollbar admindefault">
				
				
				
				<div class="text-center d-none" id="contact-table-fallback">
					<p class="fw-bold fs-1 mt-3">검색결과가 없습니다.</p>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
<%@ include file='../../inc/adminBottom.jsp'%>