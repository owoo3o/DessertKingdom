package information.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import information.model.service.NoticeService;
import information.model.vo.Picture;
import information.model.vo.Teacher;
import member.model.vo.Member;

/**
 * Servlet implementation class writeTeacherSV
 */
@WebServlet("/writeTeacher")
public class writeTeacherSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public writeTeacherSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if(ServletFileUpload.isMultipartContent(request)) {
			 
			 int maxSize = 1024*1024*10;
			 String root = request.getSession().getServletContext().getRealPath("/"); 
			 String saveFile = root + "teacher_upFiles/";
			 
			 File f = new File(saveFile);
			 if(!f.exists()) {
				 f.mkdirs();
			 }
			 
			 MultipartRequest multiRequest = new MultipartRequest(request, saveFile, maxSize, "Utf-8", new MyFileRenamePolicy());
			 
			 String title = multiRequest.getParameter("teacher_Name");
			 String content = multiRequest.getParameter("teacher_Content");
			 String writer = ((Member)request.getSession().getAttribute("loginMember")).getUserId();	
			 
			 ArrayList<String> saveNames = new ArrayList<String>();
			 ArrayList<String> originNames = new ArrayList<String>();
			 
			 Enumeration<String> files = multiRequest.getFileNames();
			 while(files.hasMoreElements()) {
				 String name = files.nextElement();
				 if(multiRequest.getFilesystemName(name) != null) {
					 saveNames.add(multiRequest.getFilesystemName(name));
					 originNames.add(multiRequest.getOriginalFileName(name));
				 }
			 }
			 Teacher t = new Teacher();
			 t.setTeacherName(title);
			 t.setTeacherInfo(content);
			 t.setTeacherWriter(writer);
			 
			 ArrayList<Picture> fileList = new ArrayList<>();
			 for(int i = originNames.size() -1; i >= 0; i--) {
				 Picture p = new Picture();
				 p.setFilePath(saveFile);
				 p.setOriginName(originNames.get(i));
				 p.setChangeName(saveNames.get(i));
				 
				 if(i == originNames.size() - 1) {
					 p.setFileLevel(0);
				 } else {
					 p.setFileLevel(1);
				 }
				 
				 fileList.add(p);
			 }
			 
			 int result = new NoticeService().writeTeacher(t, fileList);
			 
			 if(result == fileList.size() + 1) {
				 response.sendRedirect("information");
			 } else {
				request.setAttribute("msg", "선생님 등록에 실패했습니다");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				for(int i = 0; i < saveNames.size(); i++) {
					File failFile = new File(saveFile + saveNames.get(i));
					failFile.delete();
				}
				
			 }
			 
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
