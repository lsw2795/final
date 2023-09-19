<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/top.jsp" %>
<script>
    $(function() {
        $('#btWrite').click(function() {
            if ($('#title').val().length < 1) {
                alert('제목을 입력하세요.');
                $('#title').focus();
                return false;
            }

            if ($('#content').val().length < 1) {
                alert('내용을 입력하세요.');
                $('#content').focus();
                return false;
            }
        });
    });
</script>

<form id="qnaForm" method="post" action='<c:url value='/qna/write'/>'>
    <h2 class="mb-0">Q&A 등록</h2>
    <div class="card-body p-0">
        <div class="border border-top-0 border-200">
            <input class="form-control border-1 rounded-1 outline-none px-x1" name="title" id="title"
                aria-describedby="email-to" placeholder="제목" />
        </div>
        <div class="mb-3">
            <textarea class="form-control" id="content" name="content" cols="50" rows="20" placeholder="내용"
                form="qnaForm"></textarea>
        </div>
    </div>
    <div class="card-footer border-top border-200 d-flex flex-between-center">
        <div class="d-flex align-items-center">
            <button class="btn btn-primary btn-sm px-5 me-2" id="btWrite" type="submit">등록</button>
        </div>
    </div>
</form>

<%@ include file="../inc/bottom.jsp" %>
