package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */

// 회원정보수정
@WebServlet(urlPatterns="/updateMember", name="updateMemberSV")
public class UpdateMemberSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userId = request.getParameter("userId");
			String newPwd = request.getParameter("newPwd");
			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");
			String phone = request.getParameter("Phone");
			
			Member m = new Member();
			m.setUserId(userId);
			m.setUserPwd(newPwd);
			m.setUserName(userName);
			m.setEmail(userEmail);
			m.setPhone(phone);
			
			int result = new MemberService().updateMemeber(m);
			
			System.out.println(m);
			
			String page = null;
			if(result > 0) {
				// 내 정보 보기 쪽으로 넘어가면 되는데, 이때 내 정보 보기 url을 이용해서 넘어갈 것
				response.sendRedirect("myPage");
			} else {
				request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
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
