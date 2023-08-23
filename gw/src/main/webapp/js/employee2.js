
/**
 * employee2.js
 */

	//전역변수 선언
	var contextPath = "/gw";

 	$(function() {
		var tel=$('#tel').val();
		var str=tel.split("-");
		var tel1=str[0];
		var tel2=str[1];
		var tel3=str[2];
		$('#tel1').val(tel1);
		$('#tel2').val(tel2);
		$('#tel3').val(tel3);
		
		var email=$('#email').val();
		var str2=email.split("@");
		var email1=str2[0];
		$('#email1').val(email1);
		var email2=str2[1];
		if(email2=='naver.com'){
			$('#email2').val('naver.com');
		}else if(email2=='hanmail.net'){
			$('#email2').val('hanmail.net');
		}else if(email2=='nate.com'){
			$('#email2').val('nate.com');
		}else if(email2=='gmail.com'){
			$('#email2').val('gmail.com');
		}else{
			$('#email2').val('etc');
			$("#email3").css('visibility', 'visible');
			$('#email3').val(email2);
		}	
		
		var jumin=$('#jumin').text();
		var str=jumin.substr(0,8)+"******";
		$('#jumin').text(str);
		 
		var address=$('#address').val();
		var postcode=address.substring(1,6);
		var roadaddress=address.substring(7);
		$('#sample4_postcode').val(postcode);
		$('#sample4_roadAddress').val(roadaddress);
				 

		var maritalStatus = $('#married').val();
	    if (maritalStatus === "Y") {
	        $("#marriedFlagY").prop("checked", true);
	    } else if (maritalStatus === "N" || maritalStatus.length<1) {
	        $("#marriedFlagN").prop("checked", true);
	    }
			
					 
		//등록(또는 수정) 버튼 클릭시 유효성검사
		$("#empWrite").click(function() {
			var tel1=$('#tel1').val();
			var tel2=$('#tel2').val();
			var tel3=$('#tel3').val();
			
			var tel="";
			if(tel1!=="" && tel2!=="" && tel3!==""){
				tel=tel1+"-"+tel2+"-"+tel3;
			}
			$('#tel').attr('value',tel);
			
			var email1=$('#email1').val();
			var email2=$('#email2').val();
			var email3=$('#email3').val();
			
			var email="";
			if(email1!==""){
				if(email2==="etc"){
					if(email3!==""){
					email=email1+"@"+email3;
					}
				}else{
					email=email1+"@"+email2;
				}	
			}
			$('#email').attr('value',email);
			
			var postcode=$('#sample4_postcode').val();
			var roadaddress=$('#sample4_roadAddress').val();
			
			var address="";
			if(postcode!=="" && roadaddress!==""){
				address="("+postcode+")"+roadaddress;
			}
			$('#address').attr('value',address);
			
			if ($('#pwd').val().length < 1) {
				alert("비밀번호를 입력하세요");
				$('#pwd').focus();
				return false;
			}
			
			if ($('#pwd').val() != $('#pwd2').val()) {
				alert("비밀번호가 일치하지 않습니다. 확인 바랍니다.");
				$("#pwd2").focus();
				return false;
			}
			
			if ($('#tel').val().length < 1) {
				alert("전화번호를 입력하세요.");
				$('#tel1').focus();
				return false;
			}
			
			if ($('#email').val().length < 1) {
				alert("이메일을 입력하세요.");
				$('#email1').focus();
				return false;
			}
			
			if ($('#sample4_roadAddress').val().length < 1) {
				alert("주소를 입력하세요.");
				$('#btnsearchAddress').focus();
				return false;
			}
			
			if ($('#sample4_detailAddress').val().length < 1) {
				alert("상세주소는 필수 입력사항입니다.");
				$('#btnsearchAddress').focus();
				return false;
			}
		
			if (!validate_num($("#tel1").val())
					||!validate_num($("#tel2").val())
					|| !validate_num($("#tel3").val())) {
				alert("전화번호는 숫자만 가능합니다");
				$("#tel1").focus();
				return false;
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
	});
	
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
             
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
            }
        }).open();
    }
	
	function validate_num(num) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(num); //정규식과 일치하면 true
		/* 정규식 /^[0-9]*$/g
		0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복 */
	}
