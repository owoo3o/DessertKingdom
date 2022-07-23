package information.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;

/**
 * Servlet implementation class updateNoticePageSV
 */
@WebServlet("/updateNoticePage")
public class updateNoticePageSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateNoticePageSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String numN = request.getParameter("notice_No");
		String numB = request.getParameter("board_No");
		String title = request.getParameter("notice_Title");
		String createDate = request.getParameter("writeN_c");
		String deleteDate = request.getParameter("writeN_d");
		String content = request.getParameter("notice_Content");
		request.setAttribute("numN", numN);
		request.setAttribute("numB", numB);
		request.setAttribute("title", title);
		request.setAttribute("createDate", createDate);
		request.setAttribute("deleteDate", deleteDate);
		request.setAttribute("content", content);
		
		request.getRequestDispatcher("WEB-INF/views/information/update_Notice.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
