package review.model.service;


import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.ArrayList;


import review.model.dao.ReviewDAO;
import review.model.vo.Attachment;
import review.model.vo.PageInfo;
import review.model.vo.ReviewBoard;

public class ReviewService {

	//게시물 리스트 갖고오기
	public ArrayList selectFList(int i) {
		Connection conn = getConnection();
		
		ReviewDAO dao = new ReviewDAO();
		ArrayList list = null;
		
		if(i == 1) {
			list = dao.selectBList(conn);	// 1일때는 보드에 대해 갖고와
		}else {
			list = dao.selectFList(conn);	// 2일때는 파일에 대해 갖고와
		}
		
		close(conn);
//		System.out.println(list);
		return list;
	}

	// 사진게시판 글쓰기
	public int insertFile(ReviewBoard r, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		ReviewDAO dao = new ReviewDAO();
		
		int result1 = dao.insertBoard(conn, r);
		int result2 = dao.insertFile(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1 + result2;
	}

	// 사진게시판 상세보기 사진갖고오기
	public ArrayList<Attachment> selectFiles(int bId) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new ReviewDAO().selectFiles(conn, bId);
		
		close(conn);
		
		return list;
	}
	// 조회수
	public ReviewBoard selectBoard(int bId) {
		Connection conn = getConnection();
		
		// 상세보기할 때 count도 같이 올라간다. 그래서 updateCount먼저 해줌.
				int result = new ReviewDAO().updateCount(conn, bId);
				
				ReviewBoard review = null;  // result가 0보다 크면 잘 진행이 됐기에 board에 대한 select진행. 
				if(result > 0) {
					review = new ReviewDAO().selectBoard(conn, bId);
					if(review != null) { //만약 board가 null이 아닐때 commit을 해줘야 정확함.
						commit(conn); // result가 1보다 크고, board가 0이 아닐때만 commit.
					} else {
						rollback(conn);
					}
				} else {
					rollback(conn);
				}
				close(conn);
				
				return review;
			}

	//삭제
	public int deleteImg(int bId) {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().deleteImg(conn, bId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 수정
	public int updateReview(ReviewBoard r) {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().updateReview(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 게시물 총 개수(페이징)
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new ReviewDAO().getListCount(conn);
		
		return listCount;
	}

	// 페이징
	public ArrayList<ReviewBoard> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<ReviewBoard> list = new ReviewDAO().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public ArrayList<ReviewBoard> selectFList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<ReviewBoard> list = new ReviewDAO().selectList(conn, pi);
		
		close(conn);
		
		
		return list;
	}
	
}
