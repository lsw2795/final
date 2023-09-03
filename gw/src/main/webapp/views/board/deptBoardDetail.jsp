<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">   
<script type="text/javascript">
	$(function(){
		$('#btnDelete').click(function(){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href="<c:url value='/board/deptBoardDelete?boardlistNo=${boardlistVo.boardlistNo}&boardNo=${param.boardNo }'/>";
			}
		});
		
		$('#btnInsertCM').click(function(){
			if($('#commentContent').val().length<10){
				alert('댓글 등록을 위해서는 최소 10글자 입력이 필요합니다.');
				$('#commentContent').focus();
				return false;
			}
			
			//alert($.param($('#frmComment').serializeArray())); 
			$.ajax({
	            url: "<c:url value='/board/ajaxInsertBoardCM'/>",
	            type:'post',
				data: $('#frmComment').serializeArray(),
				dataType:'json',
	            success: function (res) {
	            	if(res>0){
                   		alert("댓글 등록이 완료되었습니다.");
                   		location.reload();
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		});
		
	});

	function empDetail(empNo) {
	    window.open("<c:url value='/mypage/empDetail?empNo='/>"+empNo,'empDetail', 'width=320,height=550,top=300,left=700,location=yes,resizable=yes');
	}
	
	function btnCmEdit(index){
		var commentNo=$('#commentNo'+index).val();
		alert(commentNo);
		var cmContent=$('#cmContent'+index).text();
		$('#commentDiv'+index).empty();
		var result="<textarea class='form-control' id='editCM"+index+"' name='content' rows='3'>"+cmContent+"</textarea>";
		$('#commentDiv'+index).append(result);
		$('#editCM'+index).focus();
	
	}
</script>
<div class="card mb-3">
            <div class="card-body d-flex justify-content-between ">
               <div class="d-lg-flex">
              	 <a class=" btn btn-falcon-default btn-sm" 
        			href="<c:url value='/board/deptBoard?boardlistNo=${boardlistVo.boardlistNo}'/>">
              	 	<span class="fas fa-arrow-left"></span>
              	 </a>
              	 <span class="mypagehyphen"></span>
              	 <h5 class="mb-0 "><span class="fas fa-file" style="margin: 0 10px;"></span>${boardlistVo.boardName} 게시판</h5>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header ">
              <div class="row">
                <div class="col-md d-flex">
               	  <c:if test="${boardlistVo.secflag=='Y'}">
                  <div class="avatar avatar-2xl">
                    <img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>" alt="사원 이미지"/>
                  </div>
                  </c:if>
                  <div class="flex-1 ms-2">
                    <h5 class="mb-0 ">${map['TITLE']}</h5>
                    <c:if test="${boardlistVo.secflag=='Y'}">
                    <a class="text-800 fs--1" href="#" onclick="empDetail(${map['EMP_NO']});">
	                    <span class="bold" style="color: black;">${map['NAME']}</span>
	                    <span class="ms-1 text-500">&lt;${map['EMAIL']}&gt;</span>
                    </a>
                    </c:if>
                  </div>
                </div>
                <div class="col-md-auto ms-auto d-flex align-items-center ps-6 ps-md-3">
                	<c:if test="${boardlistVo.boardLike=='Y' && sessionScope.empNo!=map['EMP_NO']}">
                		<a href="#" id="heart" style="float: right;">
							<img id="heartimg" src="<c:url value='/images/heartoff.png'/>" width="50px" height="50px">
						</a>
						<span class="mypagehyphen"></span>
                	</c:if>
                		<c:if test="${sessionScope.empNo==map['EMP_NO']}">
	                	<a href="<c:url value='/board/deptBoardEdit?boardlistNo=${boardlistVo.boardlistNo}&boardNo=${param.boardNo }'/>" class="btn btn-outline-warning">수정</a>
	               		<span class="mypagehyphen"></span>
	               		<button type="button" id="btnDelete" class="btn btn-outline-danger">삭제</button>
	               		</c:if>
               		&nbsp;
                	조회수 : ${map['READCOUNT']}
                	<span class="mypagehyphen"></span>
                	등록일 : <fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd a hh:mm:ss"/>
               		<span class="mypagehyphen"></span>
                </div>
              </div>
            </div>
            <div class="card-body" style="background: #f9fafd;">
                <div class="col-lg-12">
                  <div class="card shadow-none mb-3 ">
                    <div class="card-body mypageempdiv15">
                      <p>${map['CONTENT']}</p>
                    </div>
                  </div>
                  <c:if test="${boardlistVo.uploadFlag=='Y'}">
                  <div class="shadow-none mb-3 " style="background: #f9fafd;">
                      <h6 style="color: black;">첨부 파일</h6>
                      <c:if test="${empty pdsList}">
                      첨부파일이 없습니다.
                      </c:if>
                       <c:if test="${!empty pdsList }">
	                      <c:forEach var="pdsVo" items="${pdsList }" varStatus="status">
		                       <span><a href="<c:url value='/notice/download?boardNo=${pdsVo.boardNo}&fileName=${pdsVo.fileName}'/>" style="color: black;">
			                       <img alt="첨부파일 이미지" src="<c:url value='/images/file.gif'/>">
			                     	${fileInfoArr[status.index]}</a>
		                     	</span><br>
	                      </c:forEach>
                     </c:if>
                  </div>
                  </c:if>
                  <div style="font-size: 18px;">
                	<c:if test="${empty prevMap['MAX(BOARD_NO)']}">
	                 이전 글이 없습니다.
	                </c:if>
                	<c:if test="${!empty prevMap['MAX(BOARD_NO)']}">
	                 <a style="color: black;" href="<c:url value='/board/deptBoardDetail?boardlistNo=${prevMap["BOARDLIST_NO"]}&boardNo=${prevMap["MAX(BOARD_NO)"]}'/>">이전 글&nbsp;&nbsp;|&nbsp;&nbsp;${prevMap['TITLE']}</a>
	                </c:if>
	                <br>
	                <c:if test="${empty nextMap['MIN(BOARD_NO)']}">
	                 다음 글이 없습니다.
	                </c:if>
	                <c:if test="${!empty nextMap['MIN(BOARD_NO)']}">
                 	  <a style="color: black;" href="<c:url value='/board/deptBoardDetail?boardlistNo=${nextMap["BOARDLIST_NO"]}&boardNo=${nextMap["MIN(BOARD_NO)"]}'/>">다음 글&nbsp;&nbsp;|&nbsp;&nbsp;${nextMap['TITLE']}</a>
               		</c:if>
                </div>
                  <div class="text-center">
                     <a class="btn btn-falcon-default" href="<c:url value='/board/deptBoard?boardlistNo=${boardlistVo.boardlistNo}'/>">
              	 	목록 가기
              	 	</a>
                  </div>
                </div>
            </div>
            	<c:if test="${boardlistVo.commentFlag=='Y'}">
                <div class="card-header">
                  <h5 class="mb-0">댓글</h5>
                </div>
                <div class="card-body bg-light">
                  <div class="position-relative rounded-1 border bg-white dark__bg-1100 p-3">
                    <div class="position-absolute end-0 top-0 mt-2 me-3 z-1">
                    </div>
                    <div class="row">
                    <form id="frmComment">
                    <input type="hidden" value="${empVo.empNo}" name="empNo"/>
                    <input type="hidden" value="${param.boardlistNo}" name="boardlistNo"/>
                    <input type="hidden" value="${param.boardNo}" name="boardNo"/>
                      <div class="mb-3">
                		<div class="col-auto">
		                  <a href="#" onclick="empDetail(${empVo.empNo});">
		                    <span class="bold" style="color: black;">${empVo.name}</span>
		                    <span class="text-500">&lt;${empVo.email}&gt;</span>
                    	  </a>
                   	   </div>
                      </div>
                      <div class="row mb-3 d-flex align-items-center">
                      	<div class="col-md-11 mypageempdiv1">
                        <textarea class="form-control" id="commentContent" name="content" rows="3"></textarea>
                      	</div>
	                      <div class="col-auto mypageempdiv16">
	            			<input type="submit" id="btnInsertCM" value="등록" class="btn btn-outline-primary" style="height:82px;"/>
	                      </div>
                      </div>
                      </form>
                      </div>
                    <br>
                   <c:if test="${!empty comList}">
                   <c:set var="i" value="0"></c:set>
                   <c:forEach var="comMap" items="${comList }">
					  <div class="row">
					    <div class="flex-1 position-relative ps-3">
					      <a href="#" onclick="empDetail(${comMap['EMP_NO']});">
					        <h6 class="fs-0 mb-0">${comMap['NAME']}
					          <span>[${comMap['DEPT_NAME']}]${comMap['POSITION_NAME']}</span>
					        </h6>
					      </a>
					      <span class="mb-1">${comMap['EMAIL']}</span>
					    </div>
					    <div class="col-md-6">
					     <input type="text" id="commentNo${i }" name="commentNo" value="${comMap['COMMENT_NO']}"/>
					      <c:if test="${comMap['EMP_NO']==sessionScope.empNo}">
					      <button type="button" class="btn btn-primary" onclick="btnCmEdit(${i })">수정</button>
					      </c:if>
					      등록일자 : <fmt:formatDate value="${comMap['REGDATE']}" pattern="yyyy-MM-dd a hh:mm:ss"/>
					      <button class="btn btn-link" onclick="btnCmDel(${i })" type="button"><span class="fas fa-times-circle text-danger" data-fa-transform="shrink-1"></span></button>
					    </div>
					    <div class="mb-3 mt-3" id="commentDiv${i }">
					      <p class="text-1000 mb-0" id="cmContent${i }">${comMap['CONTENT']}</p>
					    </div>
					  </div>
					  <div class="border-bottom border-dashed my-3"></div>
					  <c:set var="i" value="${i+1 }"/>
					</c:forEach>
                  </c:if>
                  </div>
                </div>
                </c:if>
            </div>
                  
         
<%@ include file="../inc/bottom.jsp"%>