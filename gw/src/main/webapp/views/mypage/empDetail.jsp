<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<c:url value='/css/mypageempform.css'/>">
<script type="text/javascript">
function setReader(empNo) {
	window.opener.messageWrite(empNo);
    window.close();
}
</script>
<style>
	body{
		background: #eff2f8;
	}
</style>
<div>
  <div>
    <div>
    	<div class="mypageempdiv13">
      	 <h2>사원정보</h2>
       </div>
    </div>
      <div class="card-body" style="text-align: center; font-size: 16px;">
      	<img src="<c:url value='/images/${map["IMAGE"]}'/>" alt="사원 이미지" style="width:200px; height:250px;">
      	<br><br>
        사원 번호 : ${map['EMP_NO']}<br>
		사원 이름 : ${map['NAME']}<br>
		내선 번호 : ${map['EXTENSION_NO']}<br>
		연락처 : ${map['TEL']}<br>
		이메일 : ${map['EMAIL']}<br>
      </div>
      <div class="card-footer" style="text-align: center;"><br>
        <input type="button" value="쪽지 보내기" class="mypageempbtncss2" 
        onclick="setReader('${map['EMP_NO']}')"/>
      </div>
    </div>
  </div>