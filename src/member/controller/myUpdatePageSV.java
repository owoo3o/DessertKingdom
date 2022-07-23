package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class myUpdatePageSV
 */
@WebServlet(urlPatterns="/myUpdatePage", name="myUpdatePageSV")
public class myUpdatePageSV extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myUpdatePageSV() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String pwd1 = request.getParameter("pwd1");
      String pwd2 = request.getParameter("pwd2");
      String loginId = ((Member)request.getSession().getAttribute("loginMember")).getUserId();
      System.out.println("loginId"+loginId);
      Member member = new Member();
      member.setUserId(loginId);
      member.setUserPwd(pwd1);
      
      Member pageMember = new MemberService().pwdCheck(member);
      String page = null;
      if(pageMember != null) {
         page = "WEB-INF/views/member/myPageUpdate.jsp";
         request.setAttribute("pageMember", pageMember);
      } else {
         request.setAttribute("msg", "비밀번호를 확인해주세요");
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