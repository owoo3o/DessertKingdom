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

import inquiry.model.vo.Faq;
import inquiry.model.vo.PageInfo;
import inquiry.model.vo.Qna;

public class FaqDAO {
	private Properties prop = new Properties();
	
	public FaqDAO() {
		String fileName = FaqDAO.class.getResource("/sql/inquiry/faq-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 페이징 처리를 위해 게시글 개수 가져오기
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
			
		String query = prop.getProperty("getListCount");
		
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
	
	// FAQ 게시판의 글 목록
	public ArrayList<Faq> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Faq> list = new ArrayList<>();
		
		String query = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Faq(rset.getInt("BOARD_ID"),
								 rset.getInt("BOARD_TYPE"),
						 		 rset.getInt("FAQ_NO"),
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

	
	// BOARD 테이블에 글 추가
	public int insertBoard(Connection conn, Faq f) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, f.getBoardTitle());
			pstmt.setString(2, f.getBaordContent());
			pstmt.setString(3, f.getBoardWriter());
			pstmt.setInt(4, f.getBoardType());
			pstmt.setString(5, f.getBoardWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	// FAQ 테이블에 글 추가
	public int inserFaq(Connection conn, Faq f) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("inserFaq");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, f.getCateId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
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
	
		
		// FAQ 상세보기 
		public Faq selectFaq(Connection conn, int bId) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Faq f = null;
			
			String query = prop.getProperty("selectFaq");
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, bId);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					f = new Faq(rset.getInt("BOARD_ID"),
							 rset.getInt("BOARD_TYPE"),
					 		 rset.getInt("FAQ_NO"),
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

			return f;
		}

		public int updateBoard(Connection conn, Faq f) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("updateBoard");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, f.getBoardTitle());
				pstmt.setString(2, f.getBaordContent());
				pstmt.setInt(3, f.getBoardId());
			
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			System.out.println(result);
		
			return result;
		}

		public int updateFaq(Connection conn, Faq f) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("updateFaq");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, f.getCateId());
				pstmt.setInt(2, f.getBoardId());
				
				System.out.println(f.getCateId());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
			return result;
		}

		public int deleteBoard(Connection conn, int bId) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("deleteBoard");
			
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

		public ArrayList<Faq> selectCate(Connection conn, String cateName) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Faq> list = new ArrayList<>();
			
			String query = prop.getProperty("selectCate");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, cateName);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Faq(rset.getInt("BOARD_ID"),
									 rset.getInt("BOARD_TYPE"),
							 		 rset.getInt("FAQ_NO"),
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


		// ajax category 페이징-전체 개수 
//		public int getCateCount(Connection conn, String cateName) {
//			PreparedStatement pstmt = null;
//			ResultSet rset = null;
//			int result = 0;
//				
//			String query = prop.getProperty("getCateCount");
//			
//			try {
//				pstmt = conn.prepareStatement(query);
//				pstmt.setString(1, cateName);
//				
//				rset = pstmt.executeQuery();
//				
//				if(rset.next()) {
//					result = rset.getInt(1);
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				close(rset);
//				close(pstmt);
//			}
//			
//			return result;
//		}
		


}

