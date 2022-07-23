package oneclass.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oneclass.model.vo.Attachment;
import oneclass.model.vo.OneClass;
import oneclass.model.service.OneClassService;

/**
 * Servlet implementation class SelectOneListServlet
 */
@WebServlet("/detail.one")
public class SelectOneClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  int bId= Integer.parseInt(request.getParameter("bId"));
		  
		  
		  OneClassService service = new OneClassService();
		  OneClass board = service.selectBoard(bId);
		  ArrayList<Attachment> fileList = service.selectFiles(bId);;
		
		  String page = null;
			if(fileList !=null) {
				request.setAttribute("board", board);
				request.setAttribute("fileList", fileList);
				
				page = "WEB-INF/views/oneclass/OneClassDetail.jsp";
				
			}else {
				request.setAttribute("msg", "게시판상세보기에 실패하였습니다.");
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
