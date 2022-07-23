package oneclass.model.dao;

import static common.JDBCTemplate.*;

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


import oneclass.model.vo.Attachment;
import oneclass.model.vo.OneClass;
import oneclass.model.vo.PageInfo;



public class OneClassDAO {
	private Properties prop = new Properties();
	
	public OneClassDAO() {
		String fileName = OneClassDAO.class.getResource("/sql/oneclass/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList selectBList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<OneClass> list =null;
		
		String query = prop.getProperty("selectBList");
		
		try {
			stmt= conn.createStatement();
			rset= stmt.executeQuery(query);
			list = new ArrayList<OneClass>();
			
			while(rset.next()) { 
				list.add(new OneClass(rset.getInt("BOARD_ID"),
									  rset.getDate("CREATE_DATE"),
									  rset.getInt("BOARD_COUNT"),
									  rset.getString("BOARD_TITLE"),
									  rset.getString("BOARD_CONTENT"),
									  rset.getString("STATUS"),
									  rset.getString("BOARD_WRITER"),
									  rset.getInt("BOARD_TYPE"),
									  rset.getDate("MODIFY_DATE"),
									  rset.getString("CLASS_CATEGORY")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		String query = prop.getProperty("selectFlist");
		
		
		try {
			stmt =conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Attachment>();
			
			while(rset.next()) {
				Attachment a = new Attachment();
				a.setBoardId(rset.getInt("BOARD_ID"));
				a.setChangeName(rset.getString("CHANGE_NAME"));
				
				list.add(a);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int insertBoard(Connection conn, OneClass o) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, o.getBoardTitle());
			pstmt.setString(2, o.getBoardContent());
			pstmt.setString(3, o.getBoardWriter());
			pstmt.setInt(4, o.getBoardType());
			pstmt.setString(5, o.getBoardWriter());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertFile(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result =0;
String query = prop.getProperty("insertFile");
		
		try {
			for(int i=0; i< fileList.size(); i++) {
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
		
		return result;

	}

	public int insertOneClass(Connection conn, OneClass o) {
		PreparedStatement pstmt= null;
		int result =0;
		
		String query = prop.getProperty("insertOneClass");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, o.getClassCategory());
			pstmt.setDate(2, o.getClassDate());
			pstmt.setString(3, o.getClassroom());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int updateCount(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		
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

	public OneClass selectBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		OneClass b = null;
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				 b = new OneClass(rset.getInt("BOARD_ID"),
						 		  rset.getDate("CREATE_DATE"),
						 		  rset.getInt("BOARD_COUNT"),
						 		  rset.getString("BOARD_TITLE"),
						 		  rset.getString("BOARD_CONTENT"),
						 		  rset.getString("STATUS"),
						 		  rset.getString("BOARD_WRITER"),
						 		  rset.getDate("MODIFY_DATE"),
						 		  rset.getString("MEMBER_ID"),
						 		  rset.getInt("CLASS_ID"),
						 		  rset.getString("CLASS_CATEGORY"),
						 		  rset.getDate("CLASS_DATE"),
						 		  rset.getString("CLASSROOM"));
				 
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public ArrayList<Attachment> selectFiles(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		String query = prop.getProperty("selectFiles");
		
		try {
			pstmt= conn.prepareStatement(query);
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

	public int deleteOneClass(Connection conn, int no) {
		PreparedStatement pstmt =null;
		int result = 0;
		
		String query = prop.getProperty("deleteOneClass");
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);// reset에있는 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return result;
	}

	public ArrayList<OneClass> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OneClass> list = null;
		
		String query = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<OneClass>();
			while(rset.next()) { 
				list.add(new OneClass(rset.getInt("BOARD_ID"),
									  rset.getDate("CREATE_DATE"),
									  rset.getInt("BOARD_COUNT"),
									  rset.getString("BOARD_TITLE"),
									  rset.getString("BOARD_CONTENT"),
									  rset.getString("STATUS"),
									  rset.getString("BOARD_WRITER"),
									  rset.getInt("BOARD_TYPE"),
									  rset.getDate("MODIFY_DATE"),
									  rset.getString("CLASS_CATEGORY")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	

	
	


}
