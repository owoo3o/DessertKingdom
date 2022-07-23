package review.model.dao;

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

import review.model.vo.Attachment;
import review.model.vo.PageInfo;
import review.model.vo.ReviewBoard;

public class ReviewDAO {

private Properties prop = new Properties();
	
	public ReviewDAO() {
		String fileName = ReviewDAO.class.getResource("/sql/review/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 게시물 리스트 갖고오기
	public ArrayList<ReviewBoard> selectBList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ReviewBoard> list = null;
		
		String query = prop.getProperty("selectBList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<ReviewBoard>(); //객체생성
			
			while(rset.next()) {
				list.add(new ReviewBoard(rset.getInt("board_id"),
								   rset.getInt("board_type"),
								   rset.getString("board_title"),
								   rset.getString("board_content"),
								   rset.getString("board_writer"),
								   rset.getInt("board_count"),
								   rset.getDate("create_date"),
								   rset.getDate("modify_date"),
								   rset.getString("status")));
			}
			
//			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	// 사진게시판 사진 글쓰기?
	public ArrayList<Attachment> selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectFList");
		// 썸네일만 갖고온다 안에 들어있는 사진 다 갖고올 필요 없다. LIST사진만
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Attachment>();
			while(rset.next()) {
				Attachment a = new Attachment();
				a.setBoardId(rset.getInt("board_id")); //어떤게시물에 사진이 들어가는지
				a.setChangeName(rset.getString("change_name"));	// 저장된 파일 이름이 어떻게 바뀌었는지
				
				list.add(a);
			}
//			System.out.println(list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	// 게시판 글 쓰기
	public int insertBoard(Connection conn, ReviewBoard r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard"); 
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getBoardTitle());
			pstmt.setString(2, r.getBoardContent());
			pstmt.setString(3, r.getBoardWriter());
			pstmt.setInt(4, r.getBoardType());
			pstmt.setString(5, r.getBoardWriter());
			
			result = pstmt.executeUpdate();
//			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 사진게시판 사진첨부
	public int insertFile(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		//0509 8교시 17분,,
		String query = prop.getProperty("insertFile");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Attachment a = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, a.getOriginName());
				pstmt.setString(2, a.getChangeName());
				pstmt.setString(3, a.getFilePath());
				pstmt.setInt(4, a.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
//		System.out.println(result); 
		return result;
	}




	public ArrayList<Attachment> selectFiles(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectFiles");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
			list = new ArrayList<Attachment>();
			
			while(rset.next()) {
				Attachment a = new Attachment();
				a.setFileId(rset.getInt("FILE_ID"));
				a.setOriginName(rset.getString("ORIGIN_NAME"));
				a.setChangeName(rset.getString("CHANGE_NAME"));
				a.setFilePath(rset.getString("FILE_PATH"));
				a.setUploadDate(rset.getDate("UPLOAD_DATE"));
				
				list.add(a);
							
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 조회수??
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


	public ReviewBoard selectBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReviewBoard r = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new ReviewBoard(rset.getInt("board_id"),
						   			rset.getInt("board_type"),
						   			rset.getString("board_title"),
						   			rset.getString("board_content"),
						   			rset.getString("board_writer"),
						   			rset.getInt("board_count"),
						   			rset.getDate("create_date"),
						   			rset.getDate("modify_date"),
						   			rset.getString("status"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return r;
	}


	public int deleteImg(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteImg");
		
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


	public int updateReview(Connection conn, ReviewBoard r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getBoardTitle());
			pstmt.setString(2, r.getBoardContent());
			pstmt.setInt(3, r.getBoardId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 게시물 총 개수 (페이징)
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null; // 개수 갖고오니 select
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
//		System.out.println(result + "게시물총개수dao");
		return result;
	}

	// 페이징
	public ArrayList<ReviewBoard> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewBoard> list = new ArrayList<ReviewBoard>();
		
		String query = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new ReviewBoard(rset.getInt("board_id"),
										 rset.getInt("board_type"),
										 rset.getString("board_title"),
										 rset.getString("board_content"),
										 rset.getString("board_writer"),
										 rset.getInt("board_count"),
										 rset.getDate("create_date"),
										 rset.getDate("modify_date"),
										 rset.getString("status")));
			}
			
//			System.out.println(list +"dao");
//			System.out.println(startRow +"startR");
//			System.out.println(endRow + "endR");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	
	
	
	
	
	

}
