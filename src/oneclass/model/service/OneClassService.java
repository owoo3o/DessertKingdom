package oneclass.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;
import oneclass.model.dao.OneClassDAO;
import oneclass.model.vo.Attachment;
import oneclass.model.vo.OneClass;
import oneclass.model.vo.PageInfo;

public class OneClassService {

	public ArrayList selectFList(int i) {// 한꺼번에 처리를 위해 제네릭 삭제 ~
		
		Connection conn = getConnection();
		OneClassDAO dao = new OneClassDAO();
		ArrayList list = null;
		
		if(i == 1) {// 1일때 bList
			list = dao.selectBList(conn);
		}else {//그외 일때 fList
			list = dao.selectFList(conn);
		}
		
		return list;
	}

	public int insertFile(OneClass o, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		OneClassDAO dao = new OneClassDAO();
		
		int result1 = dao.insertBoard(conn, o);
		int result2 = dao.insertFile(conn, fileList);
		int result3 = dao.insertOneClass(conn, o);
		
		if(result1 > 0 && result2 > 0 && result3 >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1 + result2 + result3;

	}

	public OneClass selectBoard(int bId) {
		Connection conn = getConnection();
		int result = new OneClassDAO().updateCount(conn, bId);
		OneClass board = null;
		if(result > 0) {
			board = new OneClassDAO().selectBoard(conn, bId);
			if(board != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		return board;
	}

	public ArrayList<Attachment> selectFiles(int bId) {
		Connection conn = getConnection();
		
		OneClassDAO dao = new OneClassDAO();
		
		ArrayList<Attachment> list = dao.selectFiles(conn, bId);
		
		close(conn);
		
		
		return list;
	}

	public int deleteOneClass(int no) {
		Connection conn = getConnection();
		
		int result = new OneClassDAO().deleteOneClass(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new OneClassDAO().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<OneClass> selectFList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<OneClass> list = new OneClassDAO().selectList(conn, pi);
		close(conn);
		return list;
	}

	

}
