<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src = "<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function () {
	
	    function convertTime() {
	        var now = new Date();
	
	
	        var month = now.getMonth() + 1;
	        var date = now.getDate();
	
	        return month + '월' + date + '일';
	    }
	
	    var currentTime = convertTime();
	    $('.nowtime').append(currentTime);
	});
	
	$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=5b15e4b3db8aeb8b68a8f3490f2abd2e',
		    function (WeatherResult) {
		
				var weather = Math.floor((WeatherResult.main.temp - 273.15)*10)/10;
		        //기온출력
		        $('.SeoulNowtemp').append(weather + " ℃");
		        $('.SeoulLowtemp').append(WeatherResult.main.temp_min);
		        $('.SeoulHightemp').append(WeatherResult.main.temp_max);

		        //날씨아이콘출력
		        //WeatherResult.weater[0].icon
		        var weathericonUrl =
		            '<img src= "http://openweathermap.org/img/wn/'
		            + WeatherResult.weather[0].icon +
		            '.png" alt="' + WeatherResult.weather[0].description + '"/>'

		        $('.SeoulIcon').html(weathericonUrl);
		    });

</script>
<body>
        
        <h4>서울</h4>
        <h2 class="SeoulIcon"></h2>
        <h4 class="SeoulNowtemp">현재기온 : </h4>
</body>
</html>