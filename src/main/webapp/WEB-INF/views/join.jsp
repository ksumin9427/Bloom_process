<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous">
	</script>
</head>
<body>
	<div class="wrapper">
		
		<form id="join_form" method="post">
		<div class="wrap">
			<div class="subject">
				<span>회원가입</span>
			</div>
			
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="memberId">
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
				
			</div>
			
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw">
				</div>
			<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
			<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
			<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
			<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName">
				</div>
				<span class="final_name_ck">이름을 입력해주세요.</span>
			</div>
			
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail">
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn" class=""></span>
				</div>
			</div>
			
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1" readonly="readonly">
					</div>
					<div class="address_button" onclick="execution_daum_address()">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2" readonly="readonly">
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name="memberAddr3" readonly="readonly">
					</div>
				</div>
				<span class="final_addr_ck"></span>
			</div>
			
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
			
		</div>
		</form>
	</div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		var code = "";
		
		var idCheck = false;
		var idCkCheck = false;
		var pwCheck = false;
		var pwChCheck = false;
		var pwCkCorCheck = false;
		var nameCheck = false;
		var mailCheck = false;
		var mailNumCheck = false;
		var addressCheck = false;
		
		/* 회원 가입 버튼 메서드 */
		$(function(){ 
			$(".join_button").click(function() {
				var id = $(".id_input").val();
				var pw = $(".pw_input").val();
				var pwCk = $(".pwck_input").val();
				var name = $(".user_input").val();
				var mail = $(".mail_input").val();
				var addr = $(".addr_input_3").val();
				
				if(id == ""){
					$(".final_id_ck").css("display", "block");
					idCheck = false;
				} else {
					$(".final_id_ck").css("display", "none");
					idCheck = true;
				}
				
				if(pw == ""){
					$(".final_pw_ck").css("display", "block");
					pwCheck = false;
				} else {
					$(".final_pw_ck").css("display", "none");
					pwCheck = true;
				}
				
				if(pwck == ""){
					$(".final_pwck_ck").css("display", "block");
					pwCkCheck = false;
				} else {
					$(".final_pwck_ck").css("display", "none");
					pwCkCheck = true;
				}
				if(name == ""){
					$(".final_name_ck").css("display", "block");
					nameCheck = false;
				} else {
					$(".final_name_ck").css("display", "none");
					nameCheck = true;
				}
				if(mail == ""){
					$(".final_mail_ck").css("display", "block");
					mailCheck = false;
				} else {
					$(".final_mail_ck").css("display", "none");
					mailCheck = true;
				}
				if(addr == ""){
					$(".final_addr_ck").css("display", "block");
					addrCheck = false;
				} else {
					$(".final_addr_ck").css("display", "none");
					addrCheck = true;
				}
				if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){
					 $("#join_form").attr("action", "/member/join");
					 $("#join_form").submit();
		        }
				return false;
			});
		});
		
		/* 아이디 중복 검사 메서드 */
		/* propertychange keyup paste input은 input 박스의 내용을 실시간으로 감지 */
		$(".id_input").on("propertychange keyup paste input", function() {
			
			var memberId = $(".id_input").val(); /* val()은 value값을 가져온다.  */
			var data = {memberId : memberId} /* 컨트롤러에 넘길 데이터 이름 : 데이터(id_input에 입력된 값)  */
			
			$.ajax({ /* 사용자가 지정한 url 경로에 파일의 데이터를 전송하고 입력한 url 경로 파일로부터 요청한 데이터를 부른다  */
				type : "post", /* 전송 방식  */
				url : "/member/memberIdChk", /* 전송페이지  */
				data : data, /* 전송할 데이터, GET 요청시엔 비운다  */
				success : function(result){ /* 전송에 성공하면 실행될 코드 */
					
					if (result != "fail") {
						$(".id_input_re_1").css("display", "inline-block");
						$(".id_input_re_2").css("display", "none");
						idCkCheck = true;
					} else {
						$(".id_input_re_1").css("display", "none");
						$(".id_input_re_2").css("display", "inline-block");
						idCkCheck = false;
					}
				}
			});
			
		});
		
	/*이메일 전송 메서드  */	
	$(".mail_check_button").click(function(){
		var email = $(".mail_input").val();
		var boxWrap = $(".mail_check_input_box");
		var checkBox = $(".mail_check_input");
		
		$.ajax({
			type : "get",  /* url을 통해 데이터를 보낼 수 있도록 get방식으로  */
			url : "mailCheck?email=" + email,
			/* 전송에 성공하면 실행될 코드 */		
			success : function(data) { 
				/* attr()은 선택한 요소에 새 속성을 생성하거나 기존의 속성을 변경하거나 속성값을 가져올 때 사용 */
				checkBox.attr("disabled", false); /* 인증번호 입력칸에 입력이 가능하도록 한다 */ 
				boxWrap.attr("id","mail_check_input_box_true"); /* success가 되면 id값을 변경시켜서 색상을 변경시킨다 */
				code = data; /*받은 응답 데이터(checkNum)를 code에 넣는다  */
			}		
		});
	});
	
	$(".mail_check_input").blur(function(){ /* 인증번호를 비교하기 위한 메서드 */
		var inputCode = $(".mail_check_input").val(); /* 입력된 코드 */
		var checkResult = $("#mail_check_input_box_warn"); /* 비교한 결과 */
		
		if (inputCode == code) {
			checkResult.html("인증번호가 일치합니다."); /* html()은 선택한 요소의 하위요소를 가져와서 문자열로 반환한다 */
			checkResult.attr("class","correct");
			mailNumCheck = true;
		} else {
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class","incorrect")
			mailNumCheck = false;
		}
		
	});
	
	/* 주소 검색 기능 메서드 */
	function execution_daum_address() {
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
                
                } else {
                	 addr += ' ';
                }
 
                $(".address_input_1").val(data.zonecode);
                $(".address_input_2").val(addr);
                
                // 커서를 상세주소 필드를 사용할 수 있도록 변경하고 커서를 이동해주는 코드
				$(".address_input_3").attr("readonly", false);
                $(".address_input_3").focus();
	        }
	    }).open();
	}

	$(".pwck_input").on("propertychange keyup paste input", function() {
		
		var pw = $(".pw_input").val();
		var pwCk = $(".pwck_input").val();
		$(".final_pwck_ck").css("display","none");
		
		if (pw == pwCk) {
			$(".pwck_input_re_1").css("display","block");
			$(".pwck_input_re_2").css("display","none");
			pwCkCorCheck= true;
		}else{
			$(".pwck_input_re_1").css("display","none");
			$(".pwck_input_re_2").css("display","block");
			pwCkCorCheck= false;
			
		}
	});
	
		
		
	</script>

</body>
</html>