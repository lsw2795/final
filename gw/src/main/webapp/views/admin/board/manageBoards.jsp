<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script type="text/javascript">
	$(function(){
		$('#AddBoardList').click(function(){
			//alert($.param($('#insertBoardList').serializeArray()));
			$.ajax({
	            url: "<c:url value='/admin/board/ajaxInsertBoardList'/>",
	            type:'post',
				data: $('#insertBoardList').serializeArray(),
				dataType:'json',
	            success: function (res) {
	            	if(res>0){
                   		alert($('#boardName').val()+" 게시판이 생성되었습니다.");
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		});
		
		$('#selboardName').change(function(){
		  	var selectedValue = $('#selboardName').val();
		  	//alert(selectedValue);
			$.ajax({
	            url: "<c:url value='/admin/board/ajaxSelectBoardList'/>",
	            type:'get',
				data: "boardlistNo="+$('#selboardName').val(),
				dataType:'json',
	            success: function (res) {
	            	$('#boardTypeDiv').empty();
	            	$('#boardLikeDiv').empty();
	            	$('#commentFlagDiv').empty();
	            	$('#uploadFlagDiv').empty();
	            	$('#secflagDiv').empty();
	            	
	            	var receivedData = res;
	            	var boardType=receivedData.boardType;
	            	var boardlistNo=receivedData.boardlistNo;
	            	var boardName=receivedData.boardName;
	            	var result0="<input type='text' id='ajaxboardType' name='boardType' value='"+boardType+"' class='form-control admindefault'/>"
	            	+"<input type='hidden' id='ajaxboardlistNo' name='boardlistNo' value='"+boardlistNo+"'/>"
	            	+"<input type='hidden' id='ajaxboardName' name='boardName' value='"+boardName+"'/>";
	            	
	            	$('#boardTypeDiv').append(result0);	            	
	            	
	            	var result1="<div class='form-check'>"
                    +"<label class='form-check-label mb-0' for='boardLikeYY'>Y</label>"
                    +"<input type='radio' class='form-check-input' id='boardLikeYY' value='Y' name='boardLike'/></div>"
              		+"<span class='adminhyphen'></span><div class='form-check'>"	
             		+"<label class='form-check-label mb-0' for='boardLikeNN'>N</label>"
               		+"<input type='radio' class='form-check-input' id='boardLikeNN' value='N' name='boardLike'/></div>"
			  		 
               		$('#boardLikeDiv').append(result1);
			  		
	            	var result2="<div class='form-check'>"
	                    +"<label class='form-check-label mb-0' for='commentFlagYY'>Y</label>"
	                    +"<input type='radio' class='form-check-input' id='commentFlagYY' value='Y' name='commentFlag'/></div>"
	              		+"<span class='adminhyphen'></span><div class='form-check'>"	
	             		+"<label class='form-check-label mb-0' for='commentFlagNN'>N</label>"
	               		+"<input type='radio' class='form-check-input' id='commentFlagNN' value='N' name='commentFlag'/></div>"
				  		
			  		$('#commentFlagDiv').append(result2);
				  		
	            	var result3="<div class='form-check'>"
	                    +"<label class='form-check-label mb-0' for='uploadFlagYY'>Y</label>"
	                    +"<input type='radio' class='form-check-input' id='uploadFlagYY' value='Y' name='uploadFlag'/></div>"
	              		+"<span class='adminhyphen'></span><div class='form-check'>"	
	             		+"<label class='form-check-label mb-0' for='uploadFlagNN'>N</label>"
	               		+"<input type='radio' class='form-check-input' id='uploadFlagNN' value='N' name='uploadFlag'/></div>"
				  			
			  		$('#uploadFlagDiv').append(result3);	
				  		
	               	var result4="<div class='form-check'>"
	                    +"<label class='form-check-label mb-0' for='secflagYY'>Y</label>"
	                    +"<input type='radio' class='form-check-input' id='secflagYY' value='Y' name='secflag'/></div>"
	              		+"<span class='adminhyphen'></span><div class='form-check'>"	
	             		+"<label class='form-check-label mb-0' for='secflagNN'>N</label>"
	               		+"<input type='radio' class='form-check-input' id='secflagNN' value='N' name='secflag'/></div>"

               		$('#secflagDiv').append(result4);		
	               		

	                // 받은 데이터를 기반으로 라디오 버튼 값 확인 및 설정
	                $('#boardLikeYY').prop('checked', receivedData.boardLike === 'Y');
	                $('#boardLikeNN').prop('checked', receivedData.boardLike === 'N');

	                $('#commentFlagYY').prop('checked', receivedData.commentFlag === 'Y');
	                $('#commentFlagNN').prop('checked', receivedData.commentFlag === 'N');

	                $('#uploadFlagYY').prop('checked', receivedData.uploadFlag === 'Y');
	                $('#uploadFlagNN').prop('checked', receivedData.uploadFlag === 'N');

	                $('#secflagYY').prop('checked', receivedData.secflag === 'Y');
	                $('#secflagNN').prop('checked', receivedData.secflag === 'N');		
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		});
		
		
		$('#editBoardList').click(function(){
		    var boardlistNo=$('#ajaxboardlistNo').val();
		    var boardName=$('#ajaxboardName').val();
			var boardType=$('#ajaxboardType').val();
			var boardLike=$('input[name=boardLike]:checked').val();
			var commentFlag=$('input[name=commentFlag]:checked').val();
			var uploadFlag=$('input[name=uploadFlag]:checked').val();
			var secflag= $('input[name=secflag]:checked').val();
			//alert(boardlistNo +" : "+boardName +" : "+boardType);
			//alert(boardLike +" : "+ commentFlag +" : "+uploadFlag+" : "+secflag);
			
		    $.ajax({
		        url: "<c:url value='/admin/board/ajaxUpdateBoardList'/>",
		        type: 'get',
		        data:{
					boardlistNo: boardlistNo,
					boardName: boardName,
					boardType: boardType,
					boardLike: boardLike,
					commentFlag: commentFlag,
					uploadFlag: uploadFlag,
					secflag: secflag
				},
		        dataType: 'json',
		        success: function (res) {
	            	if(res>0){
                   		alert($('#boardName').val()+" 게시판의 수정이 완료되었습니다.");
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		});
		
	});
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	
	function submitForm() {
	    document.getElementById('frmSearch').submit();
	}
</script>
<div class="row g-3 mb-3">
	<div class="col-xxl-4">
		<div class="card h-100 admindefault">
			<div class="card-header d-flex flex-between-center admindefault">
				<h5 class="mb-0 admindefault">게시판 목록</h5>
			</div>
			<!-- 페이징 처리 관련 form -->
			<form action="<c:url value='/admin/board/manageBoards'/>" 
				name="frmPage" method="post">
				<input type="hidden" name="currentPage">
				<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
			</form>
			<div class="d-lg-flex justify-content-between">
              <form name="frmSearch" method="post" action="<c:url value='/admin/board/manageBoards'/>">
                <div class="row flex-between-center gy-2 px-x1">
                  <div class="col-auto">
                     <div class="input-group">
                       <input name="searchKeyword" value="${param.searchKeyword }" class="form-control shadow-none search admindefault" type="search" placeholder="게시판 이름을 입력하세요" aria-label="search" />
                       <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary"><span class="fa fa-search fs--1"></span></button>
                     </div>
                  </div>
                </div>
              </form>
             </div>	
			<div class="card-body pt-3 admindefault">
						<div class="table-responsive scrollbar admindefault">
							<table class="table table-hover">
								<colgroup>
									<col style="width: 40%;" />
									<col style="width: 40%;" />
									<col style="width: 20%;" />
								</colgroup>
								<thead class="adminempthead">
									<tr style="text-align: center;">
										<th class="sort align-middle" scope="col">게시판 이름</th>
										<th class="sort align-middle" scope="col">게시판 종류</th>
										<th class="sort align-middle" scope="col">삭제</th>
									</tr>
								</thead>
								<tbody id="table-contact-body">
									<c:if test="${empty boardList }">
									<tr>
										<td colspan="3">게시판이 없습니다.</td>
									</tr>
									</c:if>
									<c:if test="${!empty boardList }">
										<c:forEach var="boardListVo" items="${boardList}">
										<tr class="adminemptr">
											<td class="align-middle"><a href="#">${boardListVo.boardName }</a></td>
											<td class="align-middle"><a href="#">${boardListVo.boardType }</a></td>
											<td class="align-middle">
											<button type="button" class="btn btn-danger"><span class="fas fa-trash"></span></button>
											</td>
										</tr>
									</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
			<div class="card-footer d-flex justify-content-center admindefault">
				<div class="divPage" id="divPage">
				<!-- 페이지 번호 추가 -->		
				<!-- 이전 블럭으로 이동 -->
				<c:if test="${pagingInfo.firstPage>1 }">
					<a href="#" id="prevPage" onclick="pageFunc(${pagingInfo.firstPage-1})">
						<img src="<c:url value='/images/first.JPG'/>">
					</a>
				</c:if>	
								
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">		
					<c:if test="${i == pagingInfo.currentPage }">		
						<span id="curPage">${i}</span>
			        	</c:if>
					<c:if test="${i != pagingInfo.currentPage }">		
				         <a href="#" id="otherPage" onclick="pageFunc(${i})">${i}</a>
				    </c:if>   		
				</c:forEach>
				
				<!-- 다음 블럭으로 이동 -->
				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
			         <a href="#" id="nextPage" onclick="pageFunc(${pagingInfo.lastPage+1})">
						<img src="<c:url value='/images/last.JPG'/>">
					</a>
				</c:if>
				<!--  페이지 번호 끝 -->
			</div>
			</div>
		</div>
	</div>
	<div class="col-xxl-8">
		<div class="row g-3 h-100">
			<div class="col-md-6">
				<div class="card font-sans-serif h-100 admindefault">
					<div class="card-header pb-0 admindefault">
						<h5 class="mb-0 admindefault">게시판 추가</h5>
					</div>
					<div class="card-body pt-3 admindefault">
						<div class="table-responsive scrollbar admindefault">
							<table class="table table-bordered">
								<colgroup>
									<col style="width: 35%;" />
									<col style="width: 65%;" />
								</colgroup>
								<tbody id="table-contact-body">
								<form id="insertBoardList">
									<tr class="adminemptr">
										<td class="align-middle">게시판 이름</td>
										<td class="align-middle">
											<input type="text" id="boardName" name="boardName" class="form-control admindefault"/>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">게시판 종류</td>
										<td class="align-middle">
											<input type="text" name="boardType" class="form-control admindefault"/>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">좋아요<br>허용여부</td>
										<td class="align-middle">
	   										<div class="col-md-12 adminspan">
												<div class="form-check">
							                        <label class="form-check-label mb-0" for="boardLikeY">Y</label>
							                        <input type="radio" class="form-check-input" id="boardLikeY" value="Y" name="boardLike" />
						                       </div>
						                       <span class="adminhyphen"></span>
						                       <div class="form-check">
							                        <label class="form-check-label mb-0" for="boardLikeN">N</label>
							                        <input type="radio" class="form-check-input" id="boardLikeN" value="N" name="boardLike" checked="checked"/>
											  <span class="adminhyphen"><small>기본설정 : 비허용</small></span>
						                      </div>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">댓글<br>허용여부</td>
										<td class="align-middle">
											<div class="col-md-12 adminspan">
												<div class="form-check">
							                        <label class="form-check-label mb-0" for="commentFlagY">Y</label>
							                        <input type="radio" class="form-check-input" id="commentFlagY" value="Y" name="commentFlag" />
						                       </div>
						                       <span class="adminhyphen"></span>
						                       <div class="form-check">
							                        <label class="form-check-label mb-0" for="commentFlagN">N</label>
							                        <input type="radio" class="form-check-input" id="commentFlagN" value="N" name="commentFlag" checked="checked"/>
											  <span class="adminhyphen"><small>기본설정 : 비허용</small></span>
						                      </div>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">업로드<br>허용여부</td>
										<td class="align-middle">
											<div class="col-md-12 adminspan">
												<div class="form-check">
							                        <label class="form-check-label mb-0" for="uploadFlagY">Y</label>
							                        <input type="radio" class="form-check-input" id="uploadFlagY" value="Y" name="uploadFlag" checked="checked"/>
						                       </div>
						                       <span class="adminhyphen"></span>
						                       <div class="form-check">
							                        <label class="form-check-label mb-0" for="uploadFlagN">N</label>
							                        <input type="radio" class="form-check-input" id="uploadFlagN" value="N" name="uploadFlag"/>
											  <span class="adminhyphen"><small>기본설정 : 허용</small></span>
						                      </div>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">사원<br>공개여부</td>
										<td class="align-middle">
										   <div class="col-md-12 adminspan">
											<div class="form-check">
						                        <label class="form-check-label mb-0" for="secflagY">Y</label>
						                        <input type="radio" class="form-check-input" id="secflagY" value="Y" name="secflag" checked="checked"/>
					                       </div>
					                       <span class="adminhyphen"></span>
					                       <div class="form-check">
						                        <label class="form-check-label mb-0" for="secflagN">N</label>
						                        <input type="radio" class="form-check-input" id="secflagN" value="N" name="secflag"/>
										  <span class="adminhyphen"><small>기본설정 : 허용</small></span>
					                      </div>
										</div>
										</td>
									</tr>
									</form>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer d-flex justify-content-center admindefault">
						<input type="submit" id="AddBoardList" value="등록" class="btn btn-primary"/>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card font-sans-serif h-100 admindefault">
					<div class="card-header pb-0 admindefault">
						<h5 class="mb-0 admindefault">게시판 권한 수정</h5>
					</div>
					<div class="card-body pt-3 admindefault">
						<div class="table-responsive scrollbar admindefault">
							<table class="table table-bordered">
								<colgroup>
									<col style="width: 35%;" />
									<col style="width: 65%;" />
								</colgroup>
								<tbody id="table-contact-body">
									<tr class="adminemptr">
										<td class="align-middle">게시판 이름</td>
										<td class="align-middle">
											<div class="adminempdiv11"> 
											<select id="selboardName" name="boardName" class="admindefault adminempborder adminempsel form-select">
												<option value="">선택하세요</option>
												<c:forEach var="boardListVo" items="${boardList}">
													<option value="${boardListVo.boardlistNo}"
														<c:if test="${param.boardlistNo==boardListVo.boardlistNo}">
															selected="selected"
														</c:if>
													>${boardListVo.boardName}</option>
												</c:forEach>
											</select>
											</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">게시판 종류</td>
										<td class="align-middle">
										<div id="boardTypeDiv"></div>	
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">좋아요 허용여부</td>
										<td class="align-middle">
										<div class="col-md-12 adminspan" id="boardLikeDiv"></div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">댓글 허용여부</td>
										<td class="align-middle">
										<div class="col-md-12 adminspan" id="commentFlagDiv"></div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">업로드 허용여부</td>
										<td class="align-middle">
										<div class="col-md-12 adminspan" id="uploadFlagDiv"></div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">사원 공개여부</td>
										<td class="align-middle">
										 <div class="col-md-12 adminspan" id="secflagDiv"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer d-flex justify-content-center admindefault">
					<input type="submit" id="editBoardList" value="수정" class="btn btn-primary"/>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="card h-100 admindefault">
					<div class="card-header py-2 admindefault">
						<div class="row flex-between-center g-0 admindefault">
							<div class="card-header pb-0 admindefault">
								<h5 class="mb-0 admindefault">게시판별 이용 통계</h5>
							</div>
						</div>
					</div>
						<div class="card-body pb-0 admindefault">
						<div class="table-responsive scrollbar admindefault">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>