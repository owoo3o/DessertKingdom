package inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.FaqService;
import inquiry.model.vo.Faq;

/**
 * Servlet implementation class UpdateFaqServlet
 */
@WebServlet("/update.faq")
public class UpdateFaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFaqServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("faqTitle");
		int cateId = Integer.parseInt(request.getParameter("category"));
		String content = request.getParameter("content");
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		System.out.println(content);
		
		Faq f = new Faq();
		f.setBoardTitle(title);
		f.setBoardId(bId);
		f.setCateId(cateId);;
		f.setBaordContent(content);
		
		System.out.println(f);
		int result = new FaqService().updateFaq(f);
		if(result > 1) {
			response.sendRedirect("detail.faq?bId=" + bId);
		} else {
			request.setAttribute("msg", "게시글 수정에 실패했습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
