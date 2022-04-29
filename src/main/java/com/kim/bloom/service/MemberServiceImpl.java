package com.kim.bloom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kim.bloom.mapper.MemberMapper;
import com.kim.bloom.model.MemberVO;

@Service("MemberSerivice")
public class MemberServiceImpl implements MemberSerivice{
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		memberMapper.memberJoin(member);
	}

	@Override
	public int idCheck(String memberId) throws Exception {
		
		return memberMapper.idCheck(memberId);
	}

	

}
