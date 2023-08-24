<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript">
	/* $(function(){
		$('#btnDel').click(function(){
			if(confirm('정말 삭제하시겠습니까?'){
				location.href="<c:url value=''/>";
			}
		});
			
			
	}); */
	
	function changeTab(tabName) {
	    // 매개변수 없이 현재 URL을 가져옵니다.
	    let currentUrl = window.location.href.split('?')[0];
	    
	    // 선택한 탭 이름을 매개변수로 사용하여 새 URL을 생성합니다.
	    let newUrl = `${currentUrl}?key=${tabName}`;
	    
	    // 새 URL로 리디렉션합니다.
	    window.location.href = newUrl;
	}
	
	let key = "${param.key}";
	console.log(key);
	if(key === "meetingRoom"){//userinfo
		
		$("#myreview-tab").removeClass("active");
		$("#notebook-tab").removeClass("active");
		$("#meetingRoom-tab").addClass("active");
		
		$("#notebook").removeClass("show active");
		$("#wishlist").removeClass("show active");
		$("#meetingroom").addClass("show active");
		
	}else if(key === "notebook"){ //myreview
		
		$("#wishlist-tab").removeClass("active");
		$("#meetingroom-tab").removeClass("active");
		$("#myreview-tab").addClass("active");
		
		$("#meetingroom").removeClass("show active");
		$("#wishlist").removeClass("show active");
		$("#notebook").addClass("show active");
		
	}else if(key === "wishlist"){
		
		$("#meetingroom-tab").removeClass("active");
		$("#myreview-tab").removeClass("active");
		$("#wishlist-tab").addClass("active");
		
		$("#myreview").removeClass("show active");
		$("#meetingroom").removeClass("show active");
		$("#notebook").addClass("show active");
		
	}
	
</script>	
<h2><a id="admina" class="admina" href="<c:url value='/admin/board/noticeList'/>">공지사항</a></h2>
<div class="col-lg-12 pe-lg-2 mb-3">
	<div class="card" id="allContactTable">
		<div class="card-header border-bottom border-200 px-0 admindefault">
			<div class="d-lg-flex justify-content-between">
				<div class="row flex-between-center gy-2 px-x1">
					<form name="frmSearch" action='<c:url value='/admin/board/noticeList'/>'>
						<div class="row flex-between-center gy-2 px-x1">
						<div class="col-auto pe-0">
								 <select name="searchCondition" class="form-select admindefault">
		                            <option value="title"
		                            	<c:if test="${param.searchCondition=='title'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >제목</option>
		                            <option value="name"
	                       		        <c:if test="${param.searchCondition=='name'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >작성자</option>
		                            <option value="content"
		                            	<c:if test="${param.searchCondition=='content'}">
		                            		selected = "selected"
		                            	</c:if>
		                            >내용</option>
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
						</form>
					</div>
				<div class="border-bottom border-200 my-3"></div>
				<div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                      <button class="btn btn-sm btn-falcon-default d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#allContactOffcanvas" aria-controls="allContactOffcanvas"><span class="fas fa-filter" data-fa-transform="shrink-4"></span><span class="ms-1 d-none d-sm-inline-block">Filter</span></button>
                      <div class="bg-300 mx-3 d-none d-lg-block d-xl-none" style="width:1px; height:29px"></div>
                      <div class="d-flex align-items-center">
                     
                      	<a href="<c:url value='/admin/officeProduct/addOfficeProduct'/>" class="btn btn-primary">등록</a>
						<span class="adminhyphen"></span>
						<a href="<c:url value='/admin/officeProduct/noticeEdit'/>" class="btn btn-primary">수정</a>
						<span class="adminhyphen"></span>
						<input type="button" value="삭제" id="btnDel" class="btn btn-primary"/>
                      </div>
                    </div>
			</div>
		</div>
		
		<div class="card-body p-0 admindefault">
		<!-- 탭 메뉴 -->
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
				 <input type="text" name="category" id="category" value="${param.category} "/>
					<button class="nav-link active" id="meetingRoom-tab" data-bs-toggle="tab"
						data-bs-target="#meetingRoom" type="button" role="tab" aria-controls="userinfo"
						aria-selected="true" value="meetingRoom" onclick = "changeTab('meetingRoom')">회의실</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="notebook-tab" data-bs-toggle="tab"
						data-bs-target="notebook" type="button" role="tab"
						aria-controls="notebook" aria-selected="false" onclick = "changeTab('notebook')">노트북</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="rentcar-tab" data-bs-toggle="tab"
						data-bs-target="#rentcar" type="button" role="tab"
						aria-controls="rentcar" aria-selected="false" onclick="changeTab('rentcar')">차량</button>
				</li>
			</ul>
			
			<!-- 내용 -->
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="userinfo" role="tabpanel"
					aria-labelledby="userinfo-tab">
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
						<c:forEach var="map" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox"
											id="all-contact-0"
											data-bulk-select-row="data-bulk-select-row"
											value="${map['boardNo']}"/>
									</div>
								</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										<div class="avatar avatar-xl">
											<div class="avatar-name rounded-circle">
												<span>${map['NAME']}</span>
											</div>
										</div>
										<h6 class="mb-0">${map['NAME']}</h6>
									</div>
								</td>
								
								<td class="align-middle">개발팀</td>
								<td class="align-middle">
									<a href="<c:url value='/admin/board/noticeDetail?boardNo=${map.BOARD_NO}'/>">${map['TITLE']}</a>
								</td>
								<td class="align-middle">
									<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
								</td>
								<td class="align-middle">${map['READCOUNT']}</td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</tbody>
				</table>	
				</div>
				<div class="tab-pane fade" id="myreview" role="tabpanel"
					aria-labelledby="myreview-tab">
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
							<th class="sort align-middle" scope="col" data-sort="name">자원명[노트북]</th>
							<th class="sort align-middle" scope="col" data-sort="dept">설명</th>
							<th class="sort align-middle" scope="col" data-sort="title">등록일</th>
							<th class="sort align-middle" scope="col" data-sort="regdate">담당자</th>
							<th class="sort align-middle" scope="col" data-sort="readcount">상태</th>
						</tr>
					</thead>
					<tbody class="list" id="table-contact-body">
						<!-- 반복 시작  -->
						<c:forEach var="map" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox"
											id="all-contact-0"
											data-bulk-select-row="data-bulk-select-row"
											value="${map['boardNo']}"/>
									</div>
								</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										<div class="avatar avatar-xl">
											<div class="avatar-name rounded-circle">
												<span>${map['NAME']}</span>
											</div>
										</div>
										<h6 class="mb-0">${map['NAME']}</h6>
									</div>
								</td>
								
								<td class="align-middle">개발팀</td>
								<td class="align-middle">
									<a href="<c:url value='/admin/board/noticeDetail?boardNo=${map.BOARD_NO}'/>">${map['TITLE']}</a>
								</td>
								<td class="align-middle">
									<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
								</td>
								<td class="align-middle">${map['READCOUNT']}</td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</tbody>
				</table>
				</div>
				<div class="tab-pane fade" id="wishlist" role="tabpanel"
					aria-labelledby="wishlist-tab">
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
							<th class="sort align-middle" scope="col" data-sort="name">자원명[차량]</th>
							<th class="sort align-middle" scope="col" data-sort="dept">설명</th>
							<th class="sort align-middle" scope="col" data-sort="title">등록일</th>
							<th class="sort align-middle" scope="col" data-sort="regdate">담당자</th>
							<th class="sort align-middle" scope="col" data-sort="readcount">상태</th>
						</tr>
					</thead>
					<tbody class="list" id="table-contact-body">
						<!-- 반복 시작  -->
						<c:forEach var="map" items="${list}">
							<tr>
								<td class="align-middle fs-0 py-3">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox"
											id="all-contact-0"
											data-bulk-select-row="data-bulk-select-row"
											value="${map['boardNo']}"/>
									</div>
								</td>
								<td class="align-middle name white-space-nowrap pe-5 ps-2">
									<div class="d-flex align-items-center gap-2 position-relative">
										<div class="avatar avatar-xl">
											<div class="avatar-name rounded-circle">
												<span>${map['NAME']}</span>
											</div>
										</div>
										<h6 class="mb-0">${map['NAME']}</h6>
									</div>
								</td>
								
								<td class="align-middle">개발팀</td>
								<td class="align-middle">
									<a href="<c:url value='/admin/board/noticeDetail?boardNo=${map.BOARD_NO}'/>">${map['TITLE']}</a>
								</td>
								<td class="align-middle">
									<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
								</td>
								<td class="align-middle">${map['READCOUNT']}</td>
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
<%@ include file='../../inc/adminBottom.jsp'%>