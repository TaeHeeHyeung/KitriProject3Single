package com.kitri.single.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.single.member.dao.MemberDao;
import com.kitri.single.user.dao.UserDao;
import com.kitri.single.user.model.UserDto;



@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private JavaMailSender mailSender;	
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regist(UserDto userDto) {
		int result = sqlSession.getMapper(MemberDao.class).regist(userDto);
	}

	@Override
	@Transactional
	public void create(UserDto userDto) throws MessagingException, UnsupportedEncodingException {
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);

		userDto.setAuthkey(authkey);
		sqlSession.getMapper(MemberDao.class).updateAuthkey(userDto);
		

		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[Hoon's Board v2.0] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8080/user/joinConfirm?uid=")
				.append(userDto.getUuid())
				.append("&email=")
				.append(userDto.getUserId())
				.append("&authkey=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("관리자 ", "관리자명");
		sendMail.setTo(userDto.getUserId());
		sendMail.send();
	}

}
