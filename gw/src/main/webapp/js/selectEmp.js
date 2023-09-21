	$(function() {
		$('.a-select').click(function() {
		    // 해당 a 태그에 active 클래스 추가
		    $(this).addClass('active');
		    
		    // 클릭한 a 태그를 제외한 다른 a 태그들의 active 클래스 제거
		    $('.a-select').not(this).removeClass('active');
		});
    	
    	//참조자 선택화면 확인버튼 클릭시	  
		$('#insert').click(function(){
			if($('#select').find('.selectName').length>0){
				
		    	$('#select>.selectName').each(function(index,item){
		    		var result=$(item).html();
		    		if(index==0){
		    			$(opener.document).find('#referEmpNameSpan').html(result);
		    		}else{
		    			$(opener.document).find('#referEmpNameSpan').append(", "+result);
		    		}
	    		});
		    	
		    	$('#select>.selectNo').each(function(index,item){
		    		var result=$(item).html();
		    		if(index==0){
			    		$(opener.document).find('#referEmpNo').html(
			    			"<input type='hidden' name='referEmpNo' value='"+result+"'>");
		    		}else{
			    		$(opener.document).find('#referEmpNo').append(
			    			"<input type='hidden' name='referEmpNo' value='"+result+"'>");
		    		}
		    	});
		    	
			}else{
		    	$(opener.document).find('#referEmpNameSpan').html("참조자를 선택하세요");
			    $(opener.document).find('#referEmpNo').html("");
			}
			
	    	self.close();
		});
    	
    	$('#close').click(function(){
		    self.close();
    	});
	});
    
    //참조자 선택시	
	function selectEmp() {
		var isDuplicate = false; 
		var selNo=$('.active>#empNo').val();
		var selName=$('.active>#empNameDiv').text();
		
		if(selNo==null){
			alert("참조자를 선택하세요");
			return;
		}
		
		//참조자 유효성 검사
		$('#select>.selectNo').each(function(){
			if(selNo==$(this).html()){
				alert("중복된 참조자입니다");
				isDuplicate = true;
				return false;
			}
		});
		
		if(!isDuplicate){
	    	var output="<span class='selectName' style='display: block;'>"+selName+
	    		"</span><span class='selectNo' style='display: none;'>"+selNo+"</span>";
	    	$('#select').append(output);
		}
		
	    $('.a-select').removeClass('active');
	}
    
    //선택된 참조자 선택해제
	function deleteEmp() {
		var lastSelectName = $('#select>.selectName:last');
		var lastSelectNo = $('#select>.selectNo:last');
		
	    if (lastSelectName.length > 0) {
	        lastSelectName.remove();
	        lastSelectNo.remove();
	    }
	}