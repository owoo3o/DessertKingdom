package inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.QnaService;
import inquiry.model.vo.Qna;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertQnaServlet
 */
@WebServlet("/insert.qna")
public class InsertQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("qnaTitle");
		int category = Integer.parseInt(request.getParameter("category"));
		String content = request.getParameter("qnacontent");
		String writer = ((Member)request.getSession().getAttribute("loginMember")).getUserId();
		
		System.out.println(title);
		System.out.println(category);
		System.out.println(content);
		System.out.println(writer);
		
		
		Qna q = new Qna();
		q.setBoardTitle(title);
		q.setCateId(category);
		q.setBaordContent(content);
		q.setBoardType(3);
		q.setBoardWriter(writer);
		
		System.out.println(q);
		int result = new QnaService().insertQna(q);
		
		if(result == 2) {
			response.sendRedirect("list.qna");
		} else {
			request.setAttribute("msg", "글 작성에 실패했습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
