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
				
			</div>
			
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw">
				</div>
			</div>
			
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
			</div>
			
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName">
				</div>
			</div>
			
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail">
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>
			
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1">
					</div>
					<div class="address_button">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2">
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name="memberAddr3">
					</div>
				</div>
			</div>
			
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
			
		</div>
		</form>
		
	</div>
	
	<script>
		var code = "";
	
	
		$(function(){ 
			$(".join_button").click(function() {
				$("#join_form").attr("action", "/member/join"); /* 클릭을 해서 해당 url로 보내게 만든다 */
				$("#join_form").submit();
			});
		});
		
		/* propertychange keyup paste input은 input 박스의 내용을 실시간으로 감지 */
		$(".id_input").on("propertychange keyup paste input", function() {
			
			
			var memberId = $(".id_input").val(); /* val()은 value값을 가져온다.  */
			var data = {memberId : memberId} /* 컨트롤에 넘길 데이터 이름 : 데이터(id_input에 입력된 값)  */
			
			$.ajax({ /* 사용자가 지정한 url 경로에 파일의 데이터를 전송하고 입력한 url 경로 파일로부터 요청한 데이터를 부른다  */
				type : "post", /* 전송 방식  */
				url : "/member/memberIdChk", /* 전송페이지  */
				data : data, /* 전송할 데이터, GET 요청시엔 비운다  */
				success : function(result){ /* 전송에 성공하면 실행될 코드 */
					
					if (result != "fail") {
						$(".id_input_re_1").css("display", "inline-block");
						$(".id_input_re_2").css("display", "none");
					} else {
						$(".id_input_re_1").css("display", "none");
						$(".id_input_re_2").css("display", "inline-block");
						
					}
				}
			});
			
		});
		
	$(".mail_check_button").click(function(){
		var email = $(".mail_input").val();
		var boxWrap = $(".mail_check_input_box");
		var checkBox = $(".mail_check_input");
		
		$.ajax({
			type : "get", /* url을 통해 데이터를 보낼 수 있도록 get방식으로  */
			url : "mailCheck?email=" + email,
			success : function(data) {
				/* attr()은 선택한 요소에 새 속성을 생성하거나 기존의 속성의 변경하거나 속성값을 가져올 때 사용 */
				checkBox.attr("disabled", false); /* success가 되면 인증번호 입력칸에 입력이 가능하도록 한다 */ 
				boxWrap.attr("id","mail_check_input_box_true"); /* success가 되면 id값을 변경시켜서 색상을 변경시킨다 */
				code = data; /*받은 응답 데이터를 code에 넣는다  */
			}		
		});
	});
	
	$(".mail_check_input").blur(function(){ /* 인증번호를 비교하기 위한 메서드 */
		var inputCode = $(".mail_check_input").val(); /* 입력된 코드 */
		var checkResult = $("#mail_check_input_box_warn"); /* 비교한 결과 */
		
		console.log("코드값: "+code+" / inputCode값: "+inputCode)
		
		if (inputCode == code) {
			checkResult.html("인증번호가 일치합니다."); /* html()은 선택한 요소의 하위요소를 가져와서 문자열로 반환한다 */
			checkResult.attr("class","correct");
		} else {
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class","incorrect")
		}
		
	});
		
		
	</script>

</body>
</html>