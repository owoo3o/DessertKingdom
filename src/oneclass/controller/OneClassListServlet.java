package oneclass.controller;

import static common.JDBCTemplate.*;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oneclass.model.vo.PageInfo;
import oneclass.model.service.OneClassService;
import oneclass.model.vo.Attachment;
import oneclass.model.vo.OneClass;


/**
 * Servlet implementation class OneClassListServlet
 */
@WebServlet("/list.one")
public class OneClassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneClassListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OneClassService service = new OneClassService();
		
		int listCount;	 // 게시물 총 개수
		int currentPage; // 현재 페이지 표시
		int pageLimit;	 //	한페이지에 표시 될 페이징 수 
		int boardLimit;	// 한페이지에 보일 최대 페이지수 
		int maxPage;	// 전체 페이지 중 가장 마지막 페이지
		int startPage;	// 페이징 된 페이지 중 시작 페이지
		int endPage;	// 페이징 된 페이지 중 마지막 페이지 
		
		listCount = service.getListCount();
		currentPage =  1;// 커런트페이지 요청이 없으면 (null) 
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//커런트페이지가 널이 아닐때  
			// 이프문에 걸려 들어왔단 말은 데이터가 currentPage=숫자 로 들어왔다는거고
			//그걸 해당하는 숫자로 변경 
		}
		pageLimit = 10;
		boardLimit = 6;
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage =(currentPage -1)/pageLimit *pageLimit +1;
		endPage = startPage + pageLimit;
		if( maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//게시글 리스트 가져오기
		ArrayList<OneClass> bList = service.selectFList(pi);
		
		//첨부파일 리스트 가져오기
		ArrayList<Attachment> fList = service.selectFList(2);
		
		//넘어가기
		String page = null;
		if(bList != null && fList != null) {
			request.setAttribute("bList", bList); 
			request.setAttribute("pi", pi);
			request.setAttribute("fList", fList);
			
			page = "WEB-INF/views/oneclass/oneClassList.jsp";
		} else {
			request.setAttribute("msg", "원데이클래스 게시판 조회에 실패했습니다");
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
