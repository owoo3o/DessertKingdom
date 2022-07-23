package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.Attachment;
import review.model.vo.PageInfo;
import review.model.vo.ReviewBoard;

/**
 * Servlet implementation class ImageListServlet
 */
@WebServlet("/list.th")
public class ImageListSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageListSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService service = new ReviewService(); //레퍼런스 변수로.
		// 사진게시판에 대한 내용에 대해 board, 그 사진에대해 파일 갖고오는거 2번 service에 왔다갔다.
		// + 페이징,,
		
		int listCount;		// 게시글 총 개수			db에서 받아옴.
		int currentPage;	// 현재 페이지 표시  			밑에서 받아옴.
		int pageLimit;		// 한 페이지에 표시될 페이징 수
		int boardLimit;		// 한 페이지에 보일 게시글 최대 개수
		int maxPage;		// 전체 페이지 중 가장 마지막 페이지
		int startPage;		// 페이징 된 페이지 중 시작 페이지   
		int endPage;		// 페이징 된 페이지 중 마지막 페이지
		
		listCount = service.getListCount(); //전체 게시글 개수
//		System.out.println(listCount);
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 6;
		
//		System.out.println(boardLimit + "boardlimit");
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		
		startPage = (currentPage -1)/pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<ReviewBoard> list = service.selectList(pi);
		
//		System.out.println(pi + "pi");
				
		// 게시물리스트
		ArrayList<ReviewBoard> bList = service.selectFList(pi);
		// 파일리스트
		ArrayList<Attachment> fList = service.selectFList(2);
		
//		System.out.println(fList);
//		System.out.println(bList);
		
		String page = null;
		if(list != null && bList != null && fList != null) { //  다 데이터가 존재한다면
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("bList", bList);
			request.setAttribute("fList", fList);
			page = "WEB-INF/views/review/Review_list.jsp"; // 화면으로 보내준다.
		} else {
			request.setAttribute("msg", "게시물 조회에 실패하였습니다.");
			page = "WEB-INF/views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
