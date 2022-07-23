package information.model.dao;

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

import information.model.vo.Notice;
import information.model.vo.PageInfo;
import information.model.vo.Picture;
import information.model.vo.Teacher;

public class NoticeDAO {
	
	private Properties prop = new Properties();
	
	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/information/info-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 공지사항 리스트 불러오기
	public ArrayList<Notice> noticeList(Connection conn, PageInfo pi) {
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query = prop.getProperty("noticeList");
		
		// 페이징시 한페이지 표시 게시글 갯수
		int startRow = (pi.getNowPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit()-1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("BOARD_ID"),
									rset.getInt("NOTICE_NO"),
									rset.getString("BOARD_TITLE"),
									rset.getString("BOARD_CONTENT"),
									rset.getString("MEMBER_ID"),
									rset.getInt("BOARD_COUNT"),
									rset.getDate("CREATE_DATE"),
									rset.getDate("ENDVIEW_DATE"),
									rset.getString("STATUS")));
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


	// 공지사항 상세조회
	public Notice noticeDetail(Connection conn, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice notice = null;
		
		String query = prop.getProperty("noticeDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				notice = new Notice(rset.getInt("BOARD_ID"),
									rset.getInt("NOTICE_NO"),
									rset.getString("BOARD_TITLE"),
									rset.getString("BOARD_CONTENT"),
									rset.getString("BOARD_WRITER"),
									rset.getInt("BOARD_COUNT"),
									rset.getDate("CREATE_DATE"),
									rset.getDate("ENDVIEW_DATE"),
									rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return notice;
	}


	// 공지사항 조회수갱신
	public int noticeCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("viewCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 공지사항 작성
	public int writeNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("writeNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, n.getCreateDate());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeContent());
			pstmt.setString(4, n.getNoticeWriter());
			pstmt.setString(5, n.getNoticeWriter());
			pstmt.setDate(6, n.getEndViewDate());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 공지사항 수정 board테이블..
	public int updateNotice(Connection conn, Notice n) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, n.getCreateDate());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeContent());
			pstmt.setString(4, n.getNoticeWriter());
			pstmt.setString(5, n.getNoticeWriter());
			pstmt.setInt(6, n.getBoardId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 공지사항 수정 notice테이블..
	public int updateNotice2(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice2");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, n.getEndViewDate());
			pstmt.setInt(2, n.getBoardId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}


	// 공지 삭제
	public int deleteNotice(Connection conn, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("delete");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	// 페이징 - 전체 게시글 갯수 조회
	public int boardAll(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("boardAll");
		
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

	
	// 선생님 리스트 불러오기
	public ArrayList<Teacher> TList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Teacher> list = null;
		
		String query = prop.getProperty("TList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList();
			
				while(rset.next()) {
					list.add(new Teacher(rset.getInt("BOARD_ID"),
										rset.getString("BOARD_TITLE"),
										rset.getString("BOARD_CONTENT"),
										rset.getString("STATUS"),
										rset.getString("MEMBER_ID")));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("리스트1" + list);
		return list;
	}

	// 사진리스트 불러오기
	public ArrayList PList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Picture> list = null;
		
		String query = prop.getProperty("PList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Picture>();
			while(rset.next()) {
				Picture p = new Picture();
				p.setBoardId(rset.getInt("BOARD_ID"));
				p.setChangeName(rset.getString("CHANGE_NAME"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("리스트2" + list);
		return list;
	}


	// 선생님 정보 등록
	public int writeTeacher(Connection conn, Teacher t) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("writeTeacher");
		//INSERT ALL INTO BOARD VALUES(SEQ_BID.NEXTVAL, SYSDATE, DEFAULT, ?, ?, DEFAULT, admin,6, null, admin ) INTO TEACHER VALUES(SEQ_TID.NEXTVAL, SEQ_BID.CURRVAL) SELECT * FROM dual
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, t.getTeacherName());
			pstmt.setString(2, t.getTeacherInfo());
			pstmt.setString(3, t.getTeacherWriter());
			pstmt.setString(4, t.getTeacherWriter());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	// 선생님 사진 등록
	public int writePicture(Connection conn, ArrayList<Picture> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("writePicture");
		
		try {
			for(int i = 0; i <fileList.size(); i++) {
				Picture p = fileList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, p.getOriginName());
				pstmt.setString(2, p.getChangeName());
				pstmt.setString(3, p.getFilePath());
				pstmt.setInt(4, p.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 선생님 정보 삭제
	public int deleteTeacher(Connection conn, int numT) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("delete");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, numT);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
