package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDAO {


private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//회원가입
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
//		System.out.println(result);
		return result;
	}

	// 아이디 중복확인
	public int checkId(Connection conn, String joinUserId) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("checkId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, joinUserId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	
	// 로그인
	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser =null;
		
		String query = prop.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getString("MEMBER_ID"),
									   rset.getString("MEMBER_PWD"),
									   rset.getString("MEMBER_NAME"),
									   rset.getString("MEMBER_EMAIL"),
									   rset.getString("MEMBER_PHONE"),
									   rset.getString("MANAGER"),
									   rset.getString("MEMBER_STATUS"),
									   rset.getString("MEMBER_ONCLASS")
									   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		
		return loginUser;
	}

	public Member selectMember(Connection conn, String loginMemberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginMemberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member(rset.getString("MEMBER_ID"),
								   rset.getString("MEMBER_PWD"),
								   rset.getString("MEMBER_NAME"),
								   rset.getString("MEMBER_EMAIL"),
								   rset.getString("MEMBER_PHONE"),
								   rset.getString("MANAGER"),
								   rset.getString("MEMBER_STATUS"),
								   rset.getString("MEMBER_ONCLASS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	// 마이페이지 비밀번호 확인
	 public Member pwdCheck(Connection conn, Member member) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Member pageMember = null;
	      
	      String query = prop.getProperty("loginUser");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, member.getUserId());
	         pstmt.setString(2, member.getUserPwd());
	         System.out.println(member.getUserId());
	         System.out.println(member.getUserPwd());
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            pageMember = new Member(rset.getString("MEMBER_ID"),
	                              rset.getString("MEMBER_PWD"),
	                              rset.getString("MEMBER_NAME"),
	                              rset.getString("MEMBER_EMAIL"),
	                              rset.getString("MEMBER_PHONE"),
	                              rset.getString("MANAGER"),
	                              rset.getString("MEMBER_STATUS"),
	                              rset.getString("MEMBER_ONCLASS"));
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      System.out.println(pageMember);
	      return pageMember;
	   }

	 // 회원 정보 업데이트
	   public int updateMember(Connection conn, Member m) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("updateMember");
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, m.getUserPwd());
	         pstmt.setString(2, m.getUserName());
	         pstmt.setString(3, m.getEmail());
	         pstmt.setString(4, m.getPhone());
	         pstmt.setString(5, m.getUserId());
	         
	         result = pstmt.executeUpdate();
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	     // System.out.println(result);
	      return result;
	   }

	   // 회원탈퇴
	   public int deleteMember(Connection conn, String userId) {
		      PreparedStatement pstmt = null;
		      int result = 0;
		      
		      String query = prop.getProperty("deleteMember");
		      
		      try {
		         pstmt = conn.prepareStatement(query);
		         pstmt.setString(1, userId);
		         
		         result = pstmt.executeUpdate();
		      
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		      }
		      
		      return result;
		   }
	
	
	
}

		
	
	
	
	
	

