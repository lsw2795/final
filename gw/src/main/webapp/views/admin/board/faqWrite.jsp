<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>"> 
  <div class="offcanvas offcanvas-center admindefault" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
    <div class="offcanvas-header">
      <h5 class="offcanvas-title admindefault" id="offcanvasRightLabel">FAQ 등록</h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      <div class="card-body">
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
							<textarea class="admindefault" rows="20" cols="50"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
      
      </div>
      <div style="text-align: center;">
        <input type="submit" value="등록" class="btn btn-primary">
        <input type="button" value="취소" class="btn btn-primary">
      </div>
    </div>
  </div>
