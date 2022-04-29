package com.kim.bloom.controller;

import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kim.bloom.model.MemberVO;
import com.kim.bloom.service.MemberSerivice;

/*회원과 관련된 요청을 따로 관리하기 위해 controller를 분리*/
@Controller
@RequestMapping("/member") /* 회원과 관련된 호출을 url 경로에서 member를 타도록 설계 */
public class MemberController {
	
	/* Console 창에 해당 로그가 찍혀 프로그램이 오류 발생 시 어디서 어떤 이유로 오류가 발생하는지 알 수 있어 이슈 처리가 용이 */
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberSerivice memberSerivice;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String loginGet() {
		logger.info("회원가입 페이지 진입");
		
		return "join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPost(MemberVO member) throws Exception {
		logger.info("join 진입");
		
		memberSerivice.memberJoin(member);
		
		logger.info("join 서비스 성공");
		
		return "redirect:/main";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String joinGet() {
		logger.info("로그인 페이지 진입");
		
		return "login";
	}
	
	/* 아이디 중복 검사를 실행하는 메서드 */
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody /* 반환값 그대로 클라이언트한테 return 하고 싶은 경우 @ResponseBody를 사용 */
	public String memberIdChkPost(String memberId) throws Exception{
		logger.info(" memberIdChk() 진입");
		
		int result = memberSerivice.idCheck(memberId);
		
		logger.info("결과값 = "+result);
		
		if (result != 0) {
			return "fail";
		} else {
			return "success";
		}
		
	}
	
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public void mailCheckGet(String email) throws Exception{
		
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 : "+email);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111; /* 111111-999999까지의 범위 */
		logger.info("인증번호 : "+checkNum);
		
	}
	
	public void sendMailTest() throws Exception {
		
		String setFrom = "ksk8554@naver.com";
		String toMail = "ksumin9427@gamil.com";
		String subject = "테스트 메일";
		String content = "테스트";
	}
	
}
