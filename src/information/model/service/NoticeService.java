package information.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import information.model.dao.NoticeDAO;
import information.model.vo.Notice;
import information.model.vo.PageInfo;
import information.model.vo.Picture;
import information.model.vo.Teacher;

public class NoticeService {

	// 공지사항 리스트 불러오기
	public ArrayList<Notice> noticeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDAO().noticeList(conn, pi);
		
		close(conn);
		
		return list;
	}

	// 공지사항 상세조회
	public Notice noticeDetail(int no) {
		Connection conn = getConnection();
		
		// 조회수 처리
		int result = new NoticeDAO().noticeCount(conn, no);
		
		Notice notice=null;
		
		if(result > 0) {
			notice = new NoticeDAO().noticeDetail(conn, no);
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return notice;
	}

	// 공지사항 글쓰기
	public int writeNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDAO().writeNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}

	// 공지사항 수정
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDAO().updateNotice(conn, n);
		int result2 = 0;
		if(result > 0) {
			result2 = new NoticeDAO().updateNotice2(conn, n);
			if(result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		close(conn);
		return result2;
	}

	// 공지사항 삭제
	public int deleteNotice(int num) {
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteNotice(conn, num);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	//페이징 - 총 게시물 갯수
	public int boardAll() {
		Connection conn = getConnection();
		int boardAll = new NoticeDAO().boardAll(conn);
		
		close(conn);
		
		return boardAll;
	}

	// 선생님 리스트 불러오기
	public ArrayList TList(int i) {
		Connection conn = getConnection();
		
		NoticeDAO dao = new NoticeDAO();
		ArrayList list = null;
		if(i == 1) {
			list = dao.TList(conn);
		} else {
			list = dao.PList(conn);
		}
		close(conn);
		
		return list;
	}

	// 선생님 등록
	public int writeTeacher(Teacher t, ArrayList<Picture> fileList) {
		Connection conn = getConnection();
		
		NoticeDAO dao = new NoticeDAO();
		
		int result1 = dao.writeTeacher(conn, t);
		int result2 = dao.writePicture(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1 + result2;
	}

	// 선생님 정보 삭제
	public int deleteTeacher(int numT) {
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteTeacher(conn, numT);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
