package inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.FaqService;
import inquiry.model.vo.Faq;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertFaqServlet
 */
@WebServlet("/insert.faq")
public class InsertFaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFaqServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("faqTitle");
		int category = Integer.parseInt(request.getParameter("category"));
		String content = request.getParameter("faqcontent");
		String writer = ((Member)request.getSession().getAttribute("loginMember")).getUserId();
		
		Faq f = new Faq();
		f.setBoardTitle(title);
		f.setCateId(category);
		f.setBaordContent(content);
		f.setBoardType(4);
		f.setBoardWriter(writer);
		
		
		int result = new FaqService().insertFaq(f);
		
		if(result == 2) {
			response.sendRedirect("list.faq");
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
