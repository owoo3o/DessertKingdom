package information.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import information.model.service.NoticeService;
import information.model.vo.Notice;
import member.model.vo.Member;

/**
 * Servlet implementation class updateNoticeSV
 */
@WebServlet("/updateNotice")
public class updateNoticeSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateNoticeSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int numN = Integer.parseInt(request.getParameter("notice_No"));
		int numB = Integer.parseInt(request.getParameter("board_No"));
		String title = request.getParameter("notice_Title");
		String createDate = request.getParameter("writeN_c");
		String deleteDate = request.getParameter("writeN_d");
		String content = request.getParameter("notice_Content");
		String writer = ((Member)request.getSession().getAttribute("loginMember")).getUserId();
		
		Date cDate = null;
		if(createDate.equals("")) {
			cDate = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] cDateArr = createDate.split("-");
			int year = Integer.parseInt(cDateArr[0]);
			int month = Integer.parseInt(cDateArr[1]) - 1;
			int day = Integer.parseInt(cDateArr[2]);
			
			cDate = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}
		Date dDate = null;
		if(deleteDate.equals("")) {
			dDate = new Date(new GregorianCalendar(2049, 11, 31).getTimeInMillis());
		} else {
			String[] dDateArr = deleteDate.split("-");
			int year = Integer.parseInt(dDateArr[0]);
			int month = Integer.parseInt(dDateArr[1]) - 1;
			int day = Integer.parseInt(dDateArr[2]);
			
			dDate = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}
		
		Notice n = new Notice();
		n.setNoticeNo(numN);
		n.setBoardId(numB);
		n.setNoticeTitle(title);
		n.setCreateDate(cDate);
		n.setEndViewDate(dDate);
		n.setNoticeContent(content);
		n.setNoticeWriter(writer);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) {
			response.sendRedirect("information");
		} else {
			request.setAttribute("msg", "공지사항 수정에 실패하였습니다");;
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
