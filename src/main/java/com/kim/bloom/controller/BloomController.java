package com.kim.bloom.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BloomController {
	
	/* Console 창에 해당 로그가 찍혀 프로그램이 오류 발생 시 어디서 어떤 이유로 오류가 발생하는지 알 수 있어 이슈 처리가 용이 */
	private static final Logger logger = LoggerFactory.getLogger(BloomController.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPageGet() {
		
		logger.info("메인페이지 진입");
		
		return "main";
	}
	
}
