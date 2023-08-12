
/**
 * employee.js
 */

	//전역변수 선언
	var contextPath = "/gw";

 	$(function() {
		//등록(또는 수정) 버튼 클릭시 유효성검사
		$("#empWrite").click(function() {
			if ($('#name').val().length < 1) {
				alert("사원이름을 입력하세요");
				$('#name').focus();				
				return false;
			}
			
			if ($('#pwd').val().length < 1) {
				alert("비밀번호를 입력하세요");
				$('#pwd').focus();
				return false;
			}
			if (!validate_num($("#extensionNo1").val())
					|| !validate_num($("#extensionNo2").val())) {
				alert("내선번호는 숫자만 가능합니다");
				$("#extensionNo1").focus();
				return false;
				//event.preventDefault();
			}
			
			if (!validate_num($("#tel1").val())
					||!validate_num($("#tel2").val())
					|| !validate_num($("#tel3").val())) {
				alert("전화번호는 숫자만 가능합니다");
				$("#tel1").focus();
				return false;
				//event.preventDefault();
			}
			
			if (!validate_num($("#jumin1").val())
					|| !validate_num($("#jumin2").val())) {
				alert("주민번호는 숫자만 가능합니다");
				$("#jumin1").focus();
				return false;
				//event.preventDefault();
			}
			
		});
		
		//직접입력을 선택하면 email3 텍스트 상자가 보이게
		$("#email2").change(function() {
			if ($("#email2").val() == "etc") {
				$("#email3").val("");
				$("#email3").css("visibility", "visible");
				$("#email3").focus();
			} else {
				$("#email3").css("visibility", "hidden");
			}
		});

		//아이디 중복확인
		$('#btnChkId').click(function(){
	    	var id=$('#userid').val();
	        open(contextPath+'/member/checkId?userid='+id,'dup',
	        	'width=590,height=300,location=yes,resizable=yes,left=0,top=0');
	    });
	    
	    //관리자아이디 중복확인
	    $('#btAdminChkId').click(function(){
	    	var id=$('#userid').val();
	        open(contextPath+'/admin/manager/adminCheckId?userid='+id,'dup',
	        	'width=590,height=300,location=yes,resizable=yes,left=0,top=0');
	    });
		
		//우편번호 찾기
		$('#btnZipcode').click(function(){            
			window.open(contextPath+'/zipcode/zipcode','zipcode',
				'width=350,height=400,location=yes,resizable=yes,left=0,top=0');
	    });
	});

	function validate_num(num) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(num); //정규식과 일치하면 true
		/* 정규식 /^[0-9]*$/g
		0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복		 */
	}
