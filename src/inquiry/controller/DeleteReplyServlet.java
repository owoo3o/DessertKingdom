package inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import inquiry.model.service.QnaService;
import inquiry.model.vo.Reply;

/**
 * Servlet implementation class DeleteReplyServlet
 */
@WebServlet("/deleteReply.qna")
public class DeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int rId = Integer.parseInt(request.getParameter("rId"));
			int bId = Integer.parseInt(request.getParameter("bId").trim());
			
			Reply r = new Reply();
			r.setReplyId(rId);
			r.setBoardId(bId);
			
			ArrayList<Reply> list = new QnaService().deleteReply(r);
			response.setContentType("application/json; charset=UTF-8");	
			
			// 날짜 형식 지정 + Gson 객체 생성 + view에 데이터 보내기
			GsonBuilder gb = new GsonBuilder();
			GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
			Gson gson = dateGb.create();
			gson.toJson(list, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
