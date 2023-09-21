	var contextPath = "/gw";
	
	/* confirmLine.jsp */
	
	$(function() {
		$('.a-select').click(function() {
		    // 해당 a 태그에 active 클래스 추가
		    $(this).addClass('active');
		    
		    // 클릭한 a 태그를 제외한 다른 a 태그들의 active 클래스 제거
		    $('.a-select').not(this).removeClass('active');
		});
    	
    	//결재자 추가 버튼 클릭시	
		$('.btnSel').click(function(){
			var selNo=$('.active>#empNo').val();
    		var selName=$('.active>#empNameDiv').html();
    		var span="confirm1_Name";
    		var input="confirm1";
    		var msg="검토자";
    		
    		//버튼 아이디로 구분하기
    		if($(this).attr('id')=='btConfirm2'){
    			span="confirm2_Name";
    			input="confirm2";
    			msg="확인자";
    		}else if($(this).attr('id')=='btConfirm3'){
    			span="confirm3_Name";
    			input="confirm3";
    			msg="승인자";
    		}
    		
    		//유효성 검사 
    		if(selNo==null){
    			alert(msg+"를 선택하세요");
    			return;
    		}
    		
    		var str="<span class='"+span+"' style='display: block;'>"+selName+"</span>"+
    			"<input type='hidden' class='"+input+"' name='"+input+"' value=\""+selNo+"\">";
			
			$('#'+input+'Sel').html(str);
			$('.a-select').removeClass('active');
		});
		
		//결재자 빼기 버튼 클릭시
		$('.btnDel').click(function(){
			var className="confirm1_Name";
    		var divId="confirm1";
    		
    		//버튼 아이디로 구분하기
    		if($(this).attr('id')=='btDelConfirm2'){
    			className="confirm2_Name";
    			divId="confirm2";
    		}else if($(this).attr('id')=='btDelConfirm3'){
    			className="confirm3_Name";
    			divId="confirm3";
    		}
    		
			var lastSelectName = $('#'+divId+'Sel>.'+className);
    		var lastSelectNo = $('#'+divId+'Sel>.'+divId);
    		
    	    if (lastSelectName.length > 0) {
    	        lastSelectName.remove();
    	        lastSelectNo.remove();
    	    }
		});
		
		//생성버튼 클릭시  
		$('#insert').click(function(){
			//유효성 검사
			if($('#confirm1Sel').find('.confirm1').length<1){
	   			alert("검토자를 선택하세요");
	   			return false;
			}
			if($('#confirm2Sel').find('.confirm2').length<1){
	   			alert("확인자를 선택하세요");
	   			return false;
			}
			if($('#confirm3Sel').find('.confirm3').length<1){
	   			alert("승인자를 선택하세요");
	   			return false;
			}
			
			var confirm1=$('.confirm1').val();
			var confirm2=$('.confirm2').val();
			var confirm3=$('.confirm3').val();
			
			//중복 유효성 검사
			if(confirm1==confirm2){
				alert("검토자와 확인자가 동일합니다");
	   			return false;
			}
			if(confirm1==confirm3){
				alert("검토자와 승인자가 동일합니다");
	   			return false;
			}
			if(confirm2==confirm3){
				alert("확인자와 승인자가 동일합니다");
	   			return false;
			}
			
			//결재라인 생성 
    		$.ajax({
		    	url:contextPath+"/confirm/createLineAjax",
		   		type:"post",
		   		dataType:"text",
		   		data:$('form[name=frmConfirmLine]').serializeArray(),
		   		success:function(res){
		   			alert(res);
		   			window.close();
		    	},error:function(xhr, status, error){
		    		alert(status+" : "+error);
		   		}
		   	});
		});
		
		/* selectConfirmLine.jsp */
		
		$("input[name='chkLine']").change(function() {
            if ($(this).is(":checked")) {
            	$("input[name='chkLine']").not(this).prop("checked", false);
            }
        });
		
		//결재라인 선택창에서 선택버튼 클릭시
		$('#select').click(function(){
			var confirmLineNo="";
			var chk="";
			var str="";
			
			//유효성 검사
			if (!$("input[name='chkLine']").is(":checked")) {
     	     	alert("결재선을 선택하세요");
               	return false;
			}
			
			$("input[name='chkLine']:checked").each(function() {
                //checkbox가 포함된 tr
                chk=$(this).parent().parent();
                //결재라인번호 저장
                confirmLineNo=($(this).val());
            });
            
            //부모창의 결재라인번호에 값 넘기기
			$(opener.document).find("#confirmLineNo").val(confirmLineNo);
			
			//tr에 포함된 결재자들의 이름 부모창으로 넘기기
			for(var i=1; i<4; i++){
				str=$(chk).find("td:eq("+i+")").text();
				$(opener.document).find("#confirm"+i+"_Name").html(str)
			}
			window.close();
		});
		
		$('#close').click(function(){
	    	window.close();
		});
	});
	
	/* selectConfirmLine.jsp */
	
	//결재라인 선택창에서 삭제버튼 클릭시
	function lineDel(no,bt){
		var chkLine=$(bt).parent().parent().find('input[name=chkLine]');
		
		if(!chkLine.is(':checked')){
			alert('삭제할 결재선을 선택하세요');
		}else{
			if(confirm("선택한 결재선을 삭제하시겠습니까?")){
				location.href=contextPath+"/confirm/deleteConfirmLine?confirmLineNo="+no;
			}
		}
	}