package inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.vo.Qna;

/**
 * Servlet implementation class qnaUpdateFormServlet
 */
@WebServlet("/qnaUpdateForm.qna")
public class QnaUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("qnaTitle");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		String writer = request.getParameter("qnaWriter");
		int	bId = Integer.parseInt(request.getParameter("bId").trim());

 		
 		Qna q = new Qna();
		q.setBoardTitle(title);
		q.setBoardId(bId);
		q.setCateName(category);
		q.setBaordContent(content);
		q.setBoardWriter(writer);
		
		request.setAttribute("q", q);
		request.getRequestDispatcher("WEB-INF/views/inquiry/qnaUpdateForm.jsp").forward(request, response);
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
