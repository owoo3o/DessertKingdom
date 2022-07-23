package information.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import information.model.service.NoticeService;
import information.model.vo.Notice;
import information.model.vo.PageInfo;
import information.model.vo.Picture;
import information.model.vo.Teacher;

/**
 * Servlet implementation class InformationPage
 */
@WebServlet("/information")
public class InformationPageSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformationPageSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징 불러오기 
		NoticeService service = new NoticeService();
		
		int boardAll;
		int nowPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int firstPage;
		int lastPage;
		
		boardAll = service.boardAll();
		
		nowPage = 1;
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		pageLimit = 10;
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)boardAll/boardLimit);
		
		firstPage = (nowPage-1)/pageLimit * pageLimit +1;
		
		lastPage = firstPage + pageLimit - 1;
		if(maxPage < lastPage) {
			lastPage = maxPage;
		}
		
		
		PageInfo pi = new PageInfo(boardAll, nowPage, pageLimit, boardLimit, maxPage, firstPage, lastPage);
		
		
		// 공지사항 리스트 불러오기
		ArrayList<Notice> listN = service.noticeList(pi);
		
		
		// 선생님 리스트 불러오기
		ArrayList<Teacher> tList = service.TList(1);
		
		// 사진리스트 불러오기
		ArrayList<Picture> pList = service.TList(2);
				
		String page = null;
		if(listN != null && tList != null && pList != null) {
			page = "WEB-INF/views/information/information.jsp";
			request.setAttribute("listN", listN);
			request.setAttribute("pi", pi);
			request.setAttribute("tList", tList);
			request.setAttribute("pList", pList);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "리스트 조회에 실패하였습니다");
		}
		System.out.println("인포는 안그런가");
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
