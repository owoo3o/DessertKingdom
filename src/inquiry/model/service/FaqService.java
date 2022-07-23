package inquiry.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import inquiry.model.dao.FaqDAO;
import inquiry.model.dao.QnaDAO;
import inquiry.model.vo.Faq;
import inquiry.model.vo.PageInfo;
import inquiry.model.vo.Qna;

public class FaqService {

	// 페이징 처리를 위해 게시물 개수 가져오기
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new FaqDAO().getListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	// faq 게시물 가져오기
	public ArrayList<Faq> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDAO().selectList(conn, pi);
		
		close(conn);
		return list;
	}

	// faq 글 작성
	public int insertFaq(Faq f) {
		Connection conn = getConnection();
		
		FaqDAO dao = new FaqDAO();
		
		int result1 = dao.insertBoard(conn, f);
		int result2 = dao.inserFaq(conn, f);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		return result1 + result2;
	}

	// FAQ 글 상세보기
	public Faq selectFaq(int bId) {
		Connection conn = getConnection();
		
		int result = new FaqDAO().updateCount(conn, bId);

		Faq faq = null;
		if(result > 0) {
			faq = new FaqDAO().selectFaq(conn, bId);
			if(faq != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		
		close(conn);
		return faq;
	}

	// 게시글 수정
	public int updateFaq(Faq f) {
		Connection conn = getConnection();
		
		int result1 = new FaqDAO().updateBoard(conn, f);
		int result2 = new FaqDAO().updateFaq(conn, f);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
				
		return result1 + result2;
	}

	// 게시글 삭제
	public int deleteBoard(int bId) {
		Connection conn = getConnection();
		
		int result = new FaqDAO().deleteBoard(conn, bId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	// 카테고리에 맞는 게시글 가져오기
	public ArrayList<Faq> selectCate(String cateName) {
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDAO().selectCate(conn, cateName);
	
		close(conn);
		return list;
	}

//	public int getCateCount(String cateName) {
//		Connection conn = getConnection();
//		int listCount = new FaqDAO().getCateCount(conn, cateName);
//		
//		close(conn);
//	
//		return listCount;
//	
//	}


}
