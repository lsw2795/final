<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.util.List" %>
<%@ include file="../inc/top.jsp"%>
<style type="text/css">
	.col-xl-8 {
	    -webkit-box-flex: 0;
	    -ms-flex: 0 0 auto;
	    flex: 0 0 auto;
	    width: 100%;
	}
	
	div#title {
	    padding: 21px;
	}
	
	#newsTitle a{
		text-decoration: none;
		color : black;
	}
</style>


<body>
<div class="content">
	<div class="row g-3">
    <div class="col-xl-8">
      <div class="card overflow-hidden">
         <div class="card-body p-0 active show" id="notes" >
          	<div class = "row g-3" id = "title">
          		<h2><strong>최신 뉴스</strong></h2>
          	</div>
            <div class="bg-light d-flex flex-column gap-3 p-x1">
             <c:forEach var="newItem" items="${news }">
              <div class="bg-white dark__bg-1100 p-x1 rounded-3 shadow-sm">
                <div class="row flex-between-center">
                  <div class="col-12 col-md-7 col-xl-12 col-xxl-8 order-1 order-md-0 order-xl-1 order-xxl-0">
                    <h4 class="mb-0 border-top border-top-md-0 border-top-xl border-top-xxl-0 mt-x1 mt-md-0 mt-xl-x1 mt-xxl-0 pt-x1 pt-md-0 pt-xl-x1 pt-xxl-0 border-200 border-xl-200" id="newsTitle"><a href="${newItem.originallink }">${newItem.title }</a></h4>
                  </div>
                </div>
                <h6 class="mb-0 mt-2">
                	<span class="fas fa-clock text-primary me-2"></span>
                	<span class="text-600">  
                		${newItem.newsDate }
                	</span>
                <p class="w-lg-75 w-xl-100 w-xxl-75 mb-0 border-top border-top-md-0 border-top-xl border-top-xxl-0 
                	mt-x1 mt-md-4 mt-xl-x1 mt-xxl-4 pt-x1 pt-md-0 pt-xl-x1 pt-xxl-0 border-200 border-xl-200">
                	${newItem.description}
               	</p>
              </div>
              </c:forEach>
            </div>
          </div>
      </div>
    </div>
  </div>
</div>
</body>
<%@ include file="../inc/bottom.jsp"%>