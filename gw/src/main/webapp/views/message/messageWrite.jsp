<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<form class="card">
	<div class="card-header bg-light">
		<h5 class="mb-0">쪽지 보내기</h5>
	</div>
	<div class="card-body p-0">
		<div class="border border-top-0 border-200">
			<input class="form-control border-0 rounded-0 outline-none px-x1" id="email-to" type="text" placeholder="받는사람" />
		</div>
        <textarea rows="15" cols="20" class="form-control" name="content"></textarea>
		<div class="bg-light px-x1 py-1">
            <div class="d-inline-flex flex-column">
                <div class="px-2 rounded-3 d-flex flex-between-center my-1 fs--1">
                	<input class="form-control" type="file">
                  	<a class="text-300 p-1" href="#!" title="Delete">
                  		<span class="fas fa-times"></span>
                  	</a>
            	</div>
            	<div class="px-2 rounded-3 d-flex flex-between-center my-1 fs--1">
                	<input class="form-control" type="file">
                  	<a class="text-300 p-1" href="#!" title="Delete">
                  		<span class="fas fa-times"></span>
                  	</a>
            	</div>
                <div class="px-2 rounded-3 d-flex flex-between-center my-1 fs--1">
                <a href="#!" title="첨부파일 추가">
		           	<span class="fas fa-paperclip fs-1"></span>
                </a>
            	</div>
			</div>
		</div>
	</div>
    <div class="card-footer border-top border-200 ">
		<div class="align-items-center" align="right">
			<button class="btn btn-primary btn-sm px-5 me-2" type="submit">보내기</button>
		</div>
	</div>
</form>
<%@ include file = "../inc/bottom.jsp" %>