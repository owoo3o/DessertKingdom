package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.Attachment;
import review.model.vo.ReviewBoard;

/**
 * Servlet implementation class SelectImageSV
 */
@WebServlet("/detail.th")
public class SelectImageSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectImageSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		System.out.println(bId);
		
		ReviewService service = new ReviewService();
		ReviewBoard review = service.selectBoard(bId);
		ArrayList<Attachment> fileList = service.selectFiles(bId);
		
		String page = null;
		if(review != null && fileList != null) {
			request.setAttribute("review", review);
			request.setAttribute("fileList", fileList);
			page = "WEB-INF/views/review/Review_detail.jsp";
		} else {
			request.setAttribute("msg", "상세보기에 실패하였습니다.");
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
