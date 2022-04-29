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
					<div class="mail_check_input_box">
						<input class="mail_check_input">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
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
				data : data /* 전송할 데이터, GET 요청시엔 비운다  */
			});
			
		});
		
		
	</script>

</body>
</html>