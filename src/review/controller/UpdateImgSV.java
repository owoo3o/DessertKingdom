package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.ReviewBoard;

/**
 * Servlet implementation class UpdateImgSV
 */
@WebServlet("/update.th")
public class UpdateImgSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateImgSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));
		// 사진을 뭐로 넘겨야지??
		
		ReviewBoard r = new ReviewBoard();
		r.setBoardId(bId);
		r.setBoardTitle(request.getParameter("title"));
		r.setBoardContent(request.getParameter("content"));
		
		int result = new ReviewService().updateReview(r);
		
		System.out.println(bId + "업데이트이미지서블릿bid");
		System.out.println(r + "업데이트이미지서블릿r");
		
		if(result > 0) {
			response.sendRedirect("detail.th?bId=" + bId);
		} else {
			request.setAttribute("msg", "수정에 실패하였습니다.");
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
