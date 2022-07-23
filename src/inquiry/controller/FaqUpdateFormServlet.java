package inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.vo.Faq;

/**
 * Servlet implementation class FaqUpdateFormServlet
 */
@WebServlet("/faqUpdateForm.faq")
public class FaqUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String title = request.getParameter("faqTitle");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		int bId = Integer.parseInt(request.getParameter("bId").trim());
		
		Faq f = new Faq();
		f.setBoardTitle(title);
		f.setBoardId(bId);
		f.setCateName(category);
		f.setBaordContent(content);
		
		request.setAttribute("f", f);
		request.getRequestDispatcher("WEB-INF/views/inquiry/faqUpdateForm.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
