<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$("#english2").click(function(){
	    var ko = $("#korean").val();
	    $.ajax({
	        url:"<c:url value='/english'/>",
	        type:"GET",
	        dataType:"json", // JSON 형식으로 응답을 기대
	        data:{korean:ko},
	        success:function(data){
	        	 var translatedText = data.enlgish;
	        	 alert(translatedText);
                $("#english").text(translatedText); // 영어 결과를 화면에 출력
	        },
	        error:function(e){
	            console.log(e);
	        }
	    });
	});
});
</script>
<title>항상테스트부터</title>
</head>
<body>
	<h1>성공이다!!!!</h1>
		<table border="1">
			<thead>
				<tr>
					<th>한국어</th>
					<th>영어</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" id="korean" name="korean"></td>
					<td width="200" height="30" id="english"></td>
				</tr>
			</tbody>
		</table>
		<input type="button" id="english2" value="영어">
</body>
</html>