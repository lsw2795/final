	var contextPath = "/gw";

	/* anonymousReportDetail.jsp */
	
	$(function() {
		//신고처리 버튼 클릭   		  
		$('#statusUpdate').click(function(){ 
			$.ajax({ //ReportController
		    	url:contextPath+"/report/anonymous/UpdateAjax",
		   		type:"post",
		   		dataType:"text",
		   		data:"reportNo="+$('#reportNo').val(),
		   		success:function(res){
		   			alert(res);
		   			opener.location.reload();
		   			window.close();
		    	},error:function(xhr, status, error){
		    		alert(status+" : "+error);
		   		}
		   	});
		});
		
		//신고보류 버튼 클릭  
		$('#statusPostpone').click(function(){
    		$.ajax({ //ReportController
		    	url:contextPath+"/report/anonymous/statusPostponeAjax",
		   		type:"post",
		   		dataType:"text",
		   		data:"reportNo="+$('#reportNo').val(),
		   		success:function(res){
		   			alert(res);
		   			opener.location.reload();
		   			window.close();
		    	},error:function(xhr, status, error){
		    		alert(status+" : "+error);
		   		}
		   	});
		});
		
		$('#close').click(function(){
	    	window.close();
		});
	});
	
	/* anonymousReportList.jsp */
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmSearch"]').submit();
	}
	
	function search(){
		$('input[name="currentPage"]').val('1');
		$('form[name="frmSearch"]').submit();
	}
	
	function statusUpdate(reportNo,status,tr){
		//ReportController
		window.open(contextPath+"/report/anonymousReportDetail?reportNo="+reportNo,"_blank","width=500,height=680 left=750 top=150")
	}