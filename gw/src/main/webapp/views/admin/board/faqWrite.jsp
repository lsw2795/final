<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>"> 
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content admindefault">
      <div class="modal-header">
        <h1 class="modal-title fs-5 admindefault" id="exampleModalLabel">FAQ 등록</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<div class="table-responsive scrollbar admindefault">
			<table class="table table-bordered">
				<colgroup>
					<col style="width: 35%;" />
					<col style="width: 65%;" />
				</colgroup>
				<tbody id="table-contact-body">
					<tr class="adminemptr">
						<td class="align-middle">FAQ 제목</td>
						<td class="align-middle">
							<input type="text" class="form-control admindefault" id=""/>
						</td>
					</tr>
					<tr class="adminemptr">
						<td class="align-middle">FAQ 내용</td>
						<td class="align-middle">
							<textarea class="admindefault" rows="20" cols="35"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
      </div>
      <div class="modal-footer" style="text-align: center;">
        <input type="submit" value="등록" class="btn btn-primary">
        <input type="button" value="취소" class="btn btn-primary" data-bs-dismiss="modal">
      </div>
    </div>
  </div>
</div> 
