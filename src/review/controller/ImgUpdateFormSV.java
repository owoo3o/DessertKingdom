package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import review.model.vo.ReviewBoard;

/**
 * Servlet implementation class ImgUpdateFormSV
 */
@WebServlet("/ImgUpdateForm.th")
public class ImgUpdateFormSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImgUpdateFormSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int bId = Integer.parseInt(request.getParameter("bId"));
		// 사진을 뭐로 넘겨야지??
		
		ReviewBoard r = new ReviewBoard();
		r.setBoardTitle(title);
		r.setBoardContent(content);
		r.setBoardId(bId);

		System.out.println(r + "이미지업데이트폼서블릿r");
		System.out.println(bId + "이미지업데이트폼서블릿bid");
		
		request.setAttribute("r", r);
		request.getRequestDispatcher("WEB-INF/views/review/Review_updateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
