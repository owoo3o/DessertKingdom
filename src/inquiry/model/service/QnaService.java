package inquiry.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import inquiry.model.dao.FaqDAO;
import inquiry.model.dao.QnaDAO;
import inquiry.model.vo.Faq;
import inquiry.model.vo.PageInfo;
import inquiry.model.vo.Qna;
import inquiry.model.vo.Reply;

public class QnaService {
	
	// 페이징 처리를 위해 게시글 개수 가져오기
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new QnaDAO().getListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	
	// 페이징 처리를 위해 게시글 개수 가져오기
	public ArrayList<Qna> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Qna> list = new QnaDAO().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	
	// 글 작성
	public int insertQna(Qna q) {
		Connection conn = getConnection();
	
		QnaDAO dao = new QnaDAO();
		
		int result1 = dao.insertBoard(conn, q);
		int result2 = dao.inserQna(conn, q);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		return result1 + result2;
	}

	// 글 상세보기
	public Qna selectQna(int bId) {
		Connection conn = getConnection();
		int result = new QnaDAO().updateCount(conn, bId);

		Qna qna = null;
		if(result > 0) {
			qna= new QnaDAO().selectQna(conn, bId);
			if(qna != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		
		close(conn);
		return qna;
	}


	public int updateQna(Qna q) {
		Connection conn = getConnection();
		int result1 = new QnaDAO().updateBoard(conn, q);
		int result2 = new QnaDAO().updateQna(conn, q);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		return result1 + result2;
	}

	
	// 댓글 조회
	public ArrayList<Reply> selectReplyList(int bId) {
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new QnaDAO().selectReplyList(conn, bId);
	
		close(conn);
		return list;
	}

	// 댓글 삽입하기
	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		
		QnaDAO dao = new QnaDAO();
		
		int result = dao.insertReply(conn, r);
		ArrayList<Reply> list = null;
		if(result > 0) {
			commit(conn);
			list = dao.selectReplyList(conn, r.getBoardId());
		} else {
			rollback(conn);
		} 
		
		close(conn);
		return list;
	}


	// 카테고리별 가져오기
	public ArrayList<Qna> selectCate(String cataName) {
		Connection conn = getConnection();
		
		ArrayList<Qna> list = new QnaDAO().selectCate(conn, cataName);
		
		close(conn);
		return list;
	}

	//댓글 삭제
	public ArrayList<Reply> deleteReply(Reply r) {
		Connection conn = getConnection();
		QnaDAO dao = new QnaDAO();
		
		int result = dao.deleteReply(conn, r.getReplyId());

		ArrayList<Reply> list = null;
		if(result > 0) {
			commit(conn);
			list = dao.selectReplyList(conn, r.getBoardId());
		} else {
			rollback(conn);
		} 
		
		close(conn);
		return list;
	}

	// 댓글 수정
	public ArrayList<Reply> updateReply(Reply r) {
		Connection conn = getConnection();
		ArrayList<Reply> list = null;
		QnaDAO dao = new QnaDAO();
		
		int result = dao.updateReply(conn, r);
		
		if(result > 0) {
			commit(conn);
			list = dao.selectReplyList(conn, r.getBoardId());
		} else {
			rollback(conn);
		}
		
		close(conn);
		return list;
	}



}
