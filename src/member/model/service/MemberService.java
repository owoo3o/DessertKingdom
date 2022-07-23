package member.model.service;


import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	// 회원가입
	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	// 아이디 중복확인
	public int checkId(String joinUserId) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkId(conn, joinUserId);
		
		close(conn);
		
		
		return result;
	}
	
	// 로그인
	public Member loginMember(Member member) {
		Connection conn = getConnection();
		
		Member loginMember = new MemberDAO().loginMember(conn, member);
		
		close(conn);
		
		return loginMember;
	}

	// 마이페이지. 아이디 갖고 내 정보 갖고오기
	public Member selectMember(String loginMemberId) {
		Connection conn = getConnection();
		
		Member member = new MemberDAO().selectMember(conn, loginMemberId);
		
		close(conn);
		
		return member;
	}

	// 마이페이지 비밀번호확인
	   public Member pwdCheck(Member member) {
		      Connection conn = getConnection();
		      Member pageMember = new MemberDAO().pwdCheck(conn, member);
		      
		      close(conn);
		      
		      return pageMember;
		   }

	 // 회원정보 수정
	   public int updateMemeber(Member m) {
		      Connection conn = getConnection();
		      
		      int result = new MemberDAO().updateMember(conn, m);
		      
		      if(result > 0) {
		         commit(conn);
		      } else {
		         rollback(conn);
		      }
		         
		      close(conn);
		      return result;
		   }

	   // 회원 탈퇴
	   public int deleteMember(String userId) {
		      Connection conn = getConnection();
		      
		      int result = new MemberDAO().deleteMember(conn, userId);
		      
		      if(result > 0) {
		         commit(conn);
		      } else {
		         rollback(conn);
		      }
		      
		      close(conn);
		      
		      return result;
		   }
		   

}
