package com.kim.bloom.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kim.bloom.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {

	@Autowired
	private MemberMapper memberMapper;

	@Test
	public void memberJoin() throws Exception {

		
		  MemberVO member = new MemberVO();
		  
		  member.setMemberId("test0"); member.setMemberPw("test0");
		  member.setMemberName("test0"); member.setMemberMail("test");
		  member.setMemberAddr1("test0"); member.setMemberAddr2("test0");
		  member.setMemberAddr3("test0");
		  
		  memberMapper.memberJoin(member);
		 	
	}
	
//	@Test
//	public void memberIdChk() throws Exception {
//		String id = "admin";
//		String id2 = "test123";
//		memberMapper.idCheck(id);
//		memberMapper.idCheck(id2);
//	
//	}
		
}
