package inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.QnaService;
import inquiry.model.vo.Qna;
import inquiry.model.vo.Reply;
import member.model.vo.Member;

/**
 * Servlet implementation class SelectQnaServlet
 */
@WebServlet("/detail.qna")
public class SelectQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId").trim());
		
		QnaService service = new QnaService();
		
		Qna qna = service.selectQna(bId);
		
		// 댓글 리스트 가져오기
		ArrayList<Reply> list = new QnaService().selectReplyList(bId);
		
		String page = null;
		if(qna != null) {
			page = "WEB-INF/views/inquiry/qnaDetailForm.jsp";
			request.setAttribute("qna", qna);   // 글 상세보기
			request.setAttribute("list", list); // 댓글 리스트
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세 조회에 실패하였습니다.");
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
