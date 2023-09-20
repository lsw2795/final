<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
관리자뷰 - 게시판관리 뷰
내용 : 게시판 삭제, 페이징처리, 게시판검색, 부서게시판(동적게시판) 생성, 
	  동적게시판 플래그 수정(파일등록,익명,댓글,추천 등), 게시판별 게시글 날짜별 등록 통계(그래프이용)
컨트롤러 : com.ez.gw.boardlist.controller.BoardListController	  
작성자 : 송영은
작성일 : 2023.09
 -->  	
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<script type="text/javascript">
	$(function(){
		//통계
		  function setDates(startMonth) {
		        var startDate = new Date();
		        var lastDate = new Date(); // 오늘 날짜
		        var startDateValue = startDate.toISOString().split('T')[0];
		        var lastDateValue = lastDate.toISOString().split('T')[0];
		        $('#startDate').val(startDateValue);
		        $('#lastDate').val(lastDateValue);
		    }
		    //첫 페이지 로딩 시, startDate와 lastDate에 값이 있는 경우에는 해당 값을 유지
		    var startDateValue = $('#startDate').val();
		    var lastDateValue = $('#lastDate').val();
		    if (!startDateValue || !lastDateValue) {
		        setDates(1);
		    }
		//유효성검사 후 게시판 생성
		$('#AddBoardList').click(function(){
			if($('#boardName').val().length<1){
				alert('게시판 이름을 입력해주세요.');
				$('#boardName').focus();
				return false;
			}
			
			if($('#boardType').val().length<1){
				alert('게시판 종류를 입력해주세요.');
				$('#boardType').focus();
				return false;
			}
			
			//alert($.param($('#insertBoardList').serializeArray()));
			$.ajax({
	            url: "<c:url value='/admin/board/ajaxInsertBoardList'/>",
	            type:'post',
				data: $('#insertBoardList').serializeArray(),
				dataType:'json',
	            success: function (res) {
	            	if(res>0){
                   		alert($('#boardName').val()+" 게시판이 생성되었습니다.");
                   		location.href="<c:url value='/admin/board/manageBoards'/>";
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		});
		$('#selboardName').change(function(){
		  	var selectedValue = $('#selboardName').val();
			
		  	//수정할 게시판 조회 - 값 공백 선택시 새로고침
		  	if(selectedValue==""){
		  		location.href="<c:url value='/admin/board/manageBoards'/>";
		  		//location.reload();
		  		return false;
		  	}
		  	
		  	//alert(selectedValue);
		  	//해당 게시판 데이터 조회 ajax
			$.ajax({
	            url: "<c:url value='/admin/board/ajaxSelectBoardList'/>",
	            type:'get',
				data: "boardlistNo="+$('#selboardName').val(),
				dataType:'json',
	            success: function (res) {
	            	$('#boardNameDiv').empty();
	            	$('#boardTypeDiv').empty();
	            	$('#boardLikeDiv').empty();
	            	$('#commentFlagDiv').empty();
	            	$('#uploadFlagDiv').empty();
	            	$('#secflagDiv').empty();
	            	
	            	var receivedData = res;
	            	var boardType=receivedData.boardType;
	            	var boardlistNo=receivedData.boardlistNo;
	            	var boardName=receivedData.boardName;
	            	
	            	var result="<input type='text' id='ajaxboardName' name='boardName' value='"+boardName+"' class='form-control admindefault'/>";
	            	$('#boardNameDiv').append(result);
	            	
	            	var result0="<input type='text' id='ajaxboardType' name='boardType' value='"+boardType+"' class='form-control admindefault'/>"
	            	+"<input type='hidden' id='ajaxboardlistNo' name='boardlistNo' value='"+boardlistNo+"'/>";
	            	
	            	$('#boardTypeDiv').append(result0);	            	
	            	
	            	var result1="<div class='form-check'>"
                    +"<label class='form-check-label mb-0' for='boardLikeYY'>Y</label>"
                    +"<input type='radio' class='form-check-input' id='boardLikeYY' value='Y' name='newBoardLike'/></div>"
              		+"<span class='adminhyphen'></span><div class='form-check'>"	
             		+"<label class='form-check-label mb-0' for='boardLikeNN'>N</label>"
               		+"<input type='radio' class='form-check-input' id='boardLikeNN' value='N' name='newBoardLike'/></div>"
			  		 
               		$('#boardLikeDiv').append(result1);
			  		
	            	var result2="<div class='form-check'>"
	                    +"<label class='form-check-label mb-0' for='commentFlagYY'>Y</label>"
	                    +"<input type='radio' class='form-check-input' id='commentFlagYY' value='Y' name='newCommentFlag'/></div>"
	              		+"<span class='adminhyphen'></span><div class='form-check'>"	
	             		+"<label class='form-check-label mb-0' for='commentFlagNN'>N</label>"
	               		+"<input type='radio' class='form-check-input' id='commentFlagNN' value='N' name='newCommentFlag'/></div>"
				  		
			  		$('#commentFlagDiv').append(result2);
				  		
	            	var result3="<div class='form-check'>"
	                    +"<label class='form-check-label mb-0' for='uploadFlagYY'>Y</label>"
	                    +"<input type='radio' class='form-check-input' id='uploadFlagYY' value='Y' name='newUploadFlag'/></div>"
	              		+"<span class='adminhyphen'></span><div class='form-check'>"	
	             		+"<label class='form-check-label mb-0' for='uploadFlagNN'>N</label>"
	               		+"<input type='radio' class='form-check-input' id='uploadFlagNN' value='N' name='newUploadFlag'/></div>"
				  			
			  		$('#uploadFlagDiv').append(result3);	
				  		
	               	var result4="<div class='form-check'>"
	                    +"<label class='form-check-label mb-0' for='secflagYY'>Y</label>"
	                    +"<input type='radio' class='form-check-input' id='secflagYY' value='Y' name='newSecflag'/></div>"
	              		+"<span class='adminhyphen'></span><div class='form-check'>"	
	             		+"<label class='form-check-label mb-0' for='secflagNN'>N</label>"
	               		+"<input type='radio' class='form-check-input' id='secflagNN' value='N' name='newSecflag'/></div>"

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
		
		//유효성 검사 후 수정처리
		$('#editBoardList').click(function(){
			if($('#selboardName').val().length<1){
				alert('수정할 게시판을 선택해주세요.');
				$('#selboardName').focus();
				return false;
			}
			
			if($('#ajaxboardName').val().length<1){
				alert('게시판 이름을 입력해주세요.');
				$('#ajaxboardName').focus();
				return false;
			}
			
			if($('#ajaxboardType').val().length<1){
				alert('게시판 종류를 입력해주세요.');
				$('#ajaxboardType').focus();
				return false;
			}
		    var boardlistNo=$('#ajaxboardlistNo').val();
		    var boardName=$('#ajaxboardName').val();
			var boardType=$('#ajaxboardType').val();
			var boardLike=$('input[name=newBoardLike]:checked').val();
			var commentFlag=$('input[name=newCommentFlag]:checked').val();
			var uploadFlag=$('input[name=newUploadFlag]:checked').val();
			var secflag= $('input[name=newSecflag]:checked').val();
			
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
                   		location.href="<c:url value='/admin/board/manageBoards'/>";
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		});
		
		//통계 유효성 검사
		$('#boardlistWriteCount').click(function(){			
			if($('#startDate').val().length!=10 || $('#lastDate').val().length!=10) {
				alert("시작일자 또는 종료일자의 형식이 올바르지 않습니다. 형식 예시)2023-05-20");
				if($('#startDate').val().length!=10){
					$('#startDate').focus();
				}else if($('#lastDate').val().length!=10){
					$('#lastDate').focus();
				}
				return false;
			}
		}); 
		
		
	});
	//게시판 목록 페이징처리
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	//게시판 검색
	function submitForm() {
	    document.getElementById('frmSearch').submit();
	}
	//게시판 삭제 - 해당 게시판에 게시글 존재시 삭제 불가능 하도록 ajax 처리
	function deleteBoard(boardlistNo){
	    if(confirm('해당 게시판을 삭제하시겠습니까?')){
		    $.ajax({
	            url: "<c:url value='/admin/board/ajaxBoardListDelete'/>",
	            type: "get",
	            data:"boardlistNo="+boardlistNo,
	            success: function (res) {
	            	if(res>0){
	                	alert('게시판 삭제 처리를 완료했습니다.');
	                	location.href="<c:url value='/admin/board/manageBoards'/>";
	            	}else{
	            		alert('게시판의 게시글이 존재하여 삭제처리가 불가능합니다.');
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
	    }
	}
	
</script>
  <!-- 페이징 처리 관련 form -->
		<form action="<c:url value='/admin/board/manageBoards'/>" 
			name="frmPage" method="post">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		</form>
<div class="row g-3 mb-3">
	<div class="col-xxl-4">
		<div class="card h-100 admindefault">
	<div class="card-header">
       <div class="row flex-between-end">
         <div class="col-auto align-self-center">
           <h5 class="mb-0" style="color: black;">
           <span class="fas fa-file" style="margin: 0 10px;"></span>
           게시판 목록</h5>
         </div>
       </div>
     </div>
	<div class="d-lg-flex justify-content-between mt-3">
            <form name="frmSearch" method="post" action="<c:url value='/admin/board/manageBoards'/>">
              <div class="row flex-between-center gy-2 px-x1">
                <div class="col-auto">
                   <div class="input-group">
                     <input name="searchKeyword" value="${param.searchKeyword }" class="form-control shadow-none search admindefault" type="search" placeholder="게시판 이름을 입력하세요" aria-label="search" />
                     <button onclick="submitForm()" 
                      	class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
                      	<span class="fa fa-search fs--1"></span>
                     	</button>
                   </div>
                </div>
              </div>
            </form>
           </div>	
			<div class="card-body pt-3 admindefault">
			<c:if test="${!empty param.searchKeyword }">
				   <p>검색어 :${param.searchKeyword} , <span style="font-weight: bold; color: red;">${pagingInfo.totalRecord}</span> 건 검색되었습니다.</p>
				</c:if> 
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
											<button type="button" class="btn btn-danger" onclick="deleteBoard(${boardListVo.boardlistNo})">
											<span class="fas fa-trash"></span>
											</button>
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
				        <a href="<c:url value='/admin/board/manageBoards?currentPage=${i}&searchKeyword=${param.searchKeyword }'/>" id="otherPage">${i}</a>
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
					<div class="card-header">
				       <div class="row flex-between-end">
				         <div class="col-auto align-self-center">
				           <h5 class="mb-0" style="color: black;">
				          <span class="fas fa-file" style="margin: 0 10px;"></span>
							게시판 추가</h5>
				         </div>
				       </div>
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
											<input type="text" id="boardType" name="boardType" class="form-control admindefault"/>
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
					<div class="card-header">
				       <div class="row flex-between-end">
				         <div class="col-auto align-self-center">
				           <h5 class="mb-0" style="color: black;">
				          <span class="fas fa-file" style="margin: 0 10px;"></span>
						게시판 권한 수정</h5>
				         </div>
				       </div>
				     </div>
					<div class="ms-2" style="width:200px;"> 
					<select id="selboardName" name="boardName" class="admindefault adminempborder adminempsel form-select">
						<option value="">선택하세요</option>
						<c:forEach var="boardListVo2" items="${boardList2}">
							<option value="${boardListVo2.boardlistNo}"
								<c:if test="${param.boardlistNo==boardListVo2.boardlistNo}">
									selected="selected"
								</c:if>
							>${boardListVo2.boardName}</option>
						</c:forEach>
					</select>
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
										<div id="boardNameDiv">게시판을 선택하세요.</div>	
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">게시판 종류</td>
										<td class="align-middle">
										<div id="boardTypeDiv">게시판을 선택하세요.</div>	
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">좋아요<br>허용여부</td>
										<td class="align-middle">
										<div class="col-md-12 adminspan" id="boardLikeDiv">게시판을 선택하세요.</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">댓글<br>허용여부</td>
										<td class="align-middle">
										<div class="col-md-12 adminspan" id="commentFlagDiv">게시판을 선택하세요.</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">업로드<br>허용여부</td>
										<td class="align-middle">
										<div class="col-md-12 adminspan" id="uploadFlagDiv">게시판을 선택하세요.</div>
										</td>
									</tr>
									<tr class="adminemptr">
										<td class="align-middle">사원<br>공개여부</td>
										<td class="align-middle">
										 <div class="col-md-12 adminspan" id="secflagDiv">게시판을 선택하세요.</div>
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
				<div class="card-header">
				       <div class="row flex-between-end">
				         <div class="col-auto align-self-center">
				           <h5 class="mb-0" style="color:black;">
				          <span class="fas fa-file" style="margin: 0 10px;"></span>
							게시판별 이용 통계</h5>
							</div>
							 <div class="col-auto d-flex">
							<form name="frmDateSearch" method="post" action="<c:url value='/admin/board/manageBoards'/>">
							 	<input type="date" id="startDate" name="startDate" value="${param.startDate }" class="form-control-sm admindefault"/>
							 	<span class="adminhyphen">~</span>
								<input type="date" id="lastDate" name="lastDate" value="${param.lastDate }" class="form-control-sm admindefault"/>
								<span class="adminhyphen"></span>
								<button type="submit" class="btn btn-primary" id="boardlistWriteCount">조회</button>
                    		</form>
                    		</div>
				  		 </div>
					</div>
	                <div class="card-body h-100 pe-0">
	                 <canvas id="myBarChart" width="400" height="150"></canvas>
			         	<script type="text/javascript">
			               var barChartData = {
						        labels: [
						        	<c:forEach var="map" items="${boardListCount}">
				            		"${map['BOARD_NAME']}",
				            		</c:forEach>
						        ],
						        datasets: [{
					            label: '기간별 게시판 게시글 등록 횟수',
					            data: [ 
					            	<c:forEach var="map" items="${boardListCount}">
					            		${map['CNT']},
					            	</c:forEach>
			            			],
						            backgroundColor: 'rgba(0, 0, 255, 0.2)',
						            borderColor: 'blue',
						            borderWidth: 1
						        }]
						    };
			                
			                
			            // 막대 그래프 생성
						    var ctx = document.getElementById('myBarChart').getContext('2d');
						    var myBarChart = new Chart(ctx, {
						        type: 'bar',  // 막대 그래프
						        data: barChartData,
						        options: {
						            scales: {
						                y: {
						                    beginAtZero: true
						                }
						            }
						        }
						    });
						</script>
	                </div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file='../../inc/adminBottom.jsp'%>