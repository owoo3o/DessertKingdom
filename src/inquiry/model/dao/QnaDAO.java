package inquiry.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import inquiry.model.vo.PageInfo;
import inquiry.model.vo.Qna;
import inquiry.model.vo.Reply;

public class QnaDAO {

	private Properties prop = new Properties();
	
	public QnaDAO() {
		String fileName = QnaDAO.class.getResource("/sql/inquiry/qna-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 페이징 처리-게시글 카운트
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getlistCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return result;
	}

	// qna 게시글 가져오기
	public ArrayList<Qna> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Qna> list = new ArrayList<>();
		
		String query = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Qna(rset.getInt("BOARD_ID"),
								 rset.getInt("BOARD_TYPE"),
						 		 rset.getInt("QNA_NO"),
						 		 rset.getInt("CATE_ID"),
						 		 rset.getString("CATE_NAME"),
						 		 rset.getString("BOARD_TITLE"),
						 		 rset.getString("BOARD_CONTENT"),
						 		 rset.getString("BOARD_WRITER"),
						 		 rset.getDate("CREATE_DATE"),
						 		 rset.getDate("MODIFY_DATE"),
						 		 rset.getInt("BOARD_COUNT"),
						 		 rset.getString("STATUS"),
								 rset.getString("MEMBER_ID")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 게시글 추가하기
	public int insertBoard(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getBoardTitle());
			pstmt.setString(2, q.getBaordContent());
			pstmt.setString(3, q.getBoardWriter());
			pstmt.setInt(4, q.getBoardType());
			pstmt.setString(5, q.getBoardWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	// QNA 테이블에 글 추가	
	public int inserQna(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQna");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, q.getCateId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
		
	}

	// 조회수 업데이트
	public int updateCount(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	// 게시글 상세보기
	public Qna selectQna(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Qna q = null;
		
		String query = prop.getProperty("selectQna");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Qna(rset.getInt("BOARD_ID"),
						 rset.getInt("BOARD_TYPE"),
				 		 rset.getInt("QNA_NO"),
				 		 rset.getInt("CATE_ID"),
				 		 rset.getString("CATE_NAME"),
				 		 rset.getString("BOARD_TITLE"),
				 		 rset.getString("BOARD_CONTENT"),
				 		 rset.getString("BOARD_WRITER"),
				 		 rset.getDate("CREATE_DATE"),
				 		 rset.getDate("MODIFY_DATE"),
				 		 rset.getInt("BOARD_COUNT"),
				 		 rset.getString("STATUS"),
						 rset.getString("MEMBER_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return q;
	}

	// 게시글 수정
	public int updateBoard(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getBoardTitle());
			pstmt.setString(2, q.getBaordContent());
			pstmt.setInt(3, q.getBoardId());
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public int updateQna(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateQna");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, q.getCateId());
			pstmt.setInt(2, q.getBoardId());
			
			System.out.println(q.getCateId());
			System.out.println(q.getBaordContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
	
	// 댓글 모두 가져오기
	public ArrayList<Reply> selectReplyList(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			
			// 한 게시글에 댓글이 여러 개 일 수 있으므로 while문을 이용해 list에 담기
			list = new ArrayList<Reply>();
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_ID"),
								   rset.getString("REPLY_STATUS"),
								   rset.getInt("BOARD_ID"),
								   rset.getString("REPLY_WRITER"),
								   rset.getString("MEMBER_ID"),
								   rset.getDate("CREATE_DATE"),
								   rset.getDate("MODIFY_DATE"),
								   rset.getString("REPLY_CONTENT")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 댓글 삽입
	public int insertReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getBoardId());
			pstmt.setString(2, r.getReplyWriter());
			pstmt.setString(3, r.getReplyContent());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 카테고리 필터링
	public ArrayList<Qna> selectCate(Connection conn, String cateName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Qna> list = new ArrayList<>();
		
		String query = prop.getProperty("selectCate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cateName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qna(rset.getInt("BOARD_ID"),
								 rset.getInt("BOARD_TYPE"),
						 		 rset.getInt("QNA_NO"),
						 		 rset.getInt("CATE_ID"),
						 		 rset.getString("CATE_NAME"),
						 		 rset.getString("BOARD_TITLE"),
						 		 rset.getString("BOARD_CONTENT"),
						 		 rset.getString("BOARD_WRITER"),
						 		 rset.getDate("CREATE_DATE"),
						 		 rset.getDate("MODIFY_DATE"),
						 		 rset.getInt("BOARD_COUNT"),
						 		 rset.getString("STATUS"),
								 rset.getString("MEMBER_ID")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 댓글 삭제
	public int deleteReply(Connection conn, int rId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 댓글 수정
	public int updateReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getReplyId());
			
			result = pstmt.executeUpdate(); 
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
		


}
