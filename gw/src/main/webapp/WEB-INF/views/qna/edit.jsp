<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<script>
	$(function() {
		$('#btEdit').click(function() {
			if($('#title').val().length < 1){
				alert('제목을 입력하세요.');
				$('#title').focus();
				return false;
			}
			
			if($('#content').val().length < 1){
				alert('내용을 입력하세요.');
				$('#content').focus();
				return false;
			}
				
				
		});
		
		
		
	});

</script>

                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end py-0" aria-labelledby="navbarDropdownUser">
                  <div class="bg-white dark__bg-1000 rounded-2 py-2">
                    <a class="dropdown-item fw-bold text-warning" href="#!"><span class="fas fa-crown me-1"></span><span>Go Pro</span></a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#!">Set status</a>
                    <a class="dropdown-item" href="../../pages/user/profile.jsp">Profile &amp; account</a>
                    <a class="dropdown-item" href="#!">Feedback</a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="../../pages/user/settings.jsp">Settings</a>
                    <a class="dropdown-item" href="../../pages/authentication/card/logout.jsp">Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </nav>
          <form id="qnaEditForm" method="post" action='<c:url value='/qna/edit'/>'>
           	<h2 class="mb-0">Q&A 수정</h5>
            <div class="card-body p-0">
              <div class="border border-top-0 border-200">
              	<input type="hidden" name="boardNo" value="${map['BOARD_NO']}">
                <input class="form-control border-1 rounded-1 outline-none px-x1" name="title" id="title" placeholder="제목" value="${map['TITLE']}" />
              </div>
			  <div class="mb-3">
				  <textarea class="form-control" id="content" name="content" cols="50" rows="20" placeholder="내용" form="qnaEditForm"/>${map['CONTENT']}</textarea>
			  </div>
            </div>
            <div class="card-footer border-top border-200 d-flex flex-between-center">
              <div class="d-flex align-items-center">
                <button class="btn btn-primary btn-sm px-5 me-2" id="btEdit" type="submit">수정</button>
              </div>
              <div class="d-flex align-items-center">
                <button class="btn btn-light btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete"><span class="fas fa-trash"></span></button>
              </div>
            </div>
          </form>
        
<%@ include file = "../inc/bottom.jsp" %>