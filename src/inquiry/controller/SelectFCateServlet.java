package inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import inquiry.model.service.FaqService;
import inquiry.model.vo.Faq;
import inquiry.model.vo.PageInfo;

/**
 * Servlet implementation class SelectFCateE
 */
@WebServlet("/selectCate.faq")
public class SelectFCateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFCateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cateName = request.getParameter("cateName");
		// 페이징처리
		// 		- 게시글 전체 개수 가져올 때 : 페이징 처리 계산에 사용
		//		- 게시글 가져올 때
//		FaqService service = new FaqService();
		
//		int listCount;   // 게시물 총 개수
//		int currentPage; // 현재 페이지 표시
//		int pageLimit;	 // 한 페이지에서 표시될 페이징 수 
//		int boardLimit;  // 한 페이지에 보일 게시글에 대한 최대 개수
//		int maxPage;	 // 전체 페이지 중 가장 마지막 페이지
//		int startPage;	 // 페이징 된 페이지 중 시작 페이지
//		int endPage;	 // 페이징 된 페이지 중 마지막 페이지
//		
//		listCount = service.getCateCount(cateName);
//		
//		 // currentPage가 null이 아니다? -> 게시판에서 page 버튼을 클릭한 경우(currentPage=2)이런식으로 생김
//		 // currentPage=null인 경우는 currentPage=1 해서 1페이지로 유지(게시판 첨들어갔을 때)
//		currentPage = 1;
//		if(request.getParameter("currentPage") != null) { 
//			currentPage = Integer.parseInt(request.getParameter("currentPage")); 
//		}
//		
//		pageLimit = 3;
//		boardLimit = 5;
//		
//		maxPage = (int)Math.ceil((double)listCount/boardLimit);
//		
//		// startPage 계산 5n-1(n>=0)  5n+1에서 n은 (crrentPage-1/pageLimit)
//		startPage = (currentPage -1)/pageLimit * pageLimit + 1; // -> n * 10 + 1
//		
//		endPage = startPage + pageLimit - 1;
//		if(maxPage < endPage) {
//			endPage = maxPage;
//		}
//			
//		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		
		// 게시글 가져오기
		
		ArrayList<Faq> Flist = new FaqService().selectCate(cateName); 
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGb.create();
		gson.toJson(Flist, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
