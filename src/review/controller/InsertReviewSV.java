package review.controller;

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

import common.ImgRenamePolicy;
import member.model.vo.Member;
import review.model.service.ReviewService;
import review.model.vo.Attachment;
import review.model.vo.ReviewBoard;


/**
 * Servlet implementation class InsertReviewSV
 */
@WebServlet("/insert.th")
public class InsertReviewSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내가 넘어온것이 multipart/form-data로 넘어왔는지
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10; // 10Mbyte
			String root = request.getSession().getServletContext().getRealPath("/"); // / : webcontent아래
			String savePath = root + "img_uploadFiles/";
			
			File f = new File(savePath);
			if(!f .exists()) {
				f.mkdirs(); 	// 폴더가 없다면 폴더를 만들게
			}
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new ImgRenamePolicy()); // 이건 만든 규칙
															//request, 파일경로, 파일최대크기, 인코딩, 파일명 변환 규칙
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String writer = ((Member)request.getSession().getAttribute("loginMember")).getUserId();
			
			ArrayList<String> saveFiles = new ArrayList<String>(); //파일의 바뀐 이름 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); // 파일의 원래 이름 저장할 ArrayList
			
			
			Enumeration<String> files = multiRequest.getFileNames(); // input type="file"의 name값.
//			System.out.println(files);
			while(files.hasMoreElements()) {		// 다음 요소가 있다면
				String name = files.nextElement();	// 다음 값 갖고와. getFileName : 전송순서 역순이다. 파라미터 명 역순
				System.out.println(name + "while");
				
				if(multiRequest.getFilesystemName(name) != null) { // 뭔가가 바뀌었다면.
					 saveFiles.add(multiRequest.getFilesystemName(name)); // 바뀐 파일 이름 갖고와서 저장
					 originFiles.add(multiRequest.getOriginalFileName(name)); // 원래 파일 이름 갖고와서 저장
					 System.out.println(name + "if문");
				 }
			}
//			System.out.println(saveFiles);
//			System.out.println(originFiles);
			
			// DB전달
			ReviewBoard r = new ReviewBoard();
			r.setBoardContent(content);
			r.setBoardTitle(title);
			r.setBoardWriter(writer);
			r.setBoardType(2); //사진게시판이니까 2?
//			System.out.println(r + "찍어본거");
			ArrayList<Attachment> fileList = new ArrayList<Attachment>(); // 첨부파일이 들어갈 list
			for(int i = originFiles.size() -1 ; i >= 0; i--) { // 파일이 역순이기에 for문도 거꾸로 썼다.
				Attachment a = new Attachment();
				a.setFilePath(savePath);
				a.setOriginName(originFiles.get(i));
				a.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size() - 1) { // originFiles의 사이즈보다 1이 작은 것 만큼의 숫자와 index와 같다. (zero-based여서 -1)
												  // 그 위치의 이미지는 썸네일이 된다.
					a.setFileLevel(0); //썸네일 이면 0
				} else {
					a.setFileLevel(1); // 아니면 1
				}
				 fileList.add(a);
				 
//				 System.out.println(a);
//				 Attachment [fileId=0, boardId=0, originName=crown.PNG, changeName=2022052015155925275251.PNG, filePath=C:\5_Servlet_workspace\SemiProject\WebContent\img_uploadFiles/, uploadDate=null, fileLevel=0, downloadCount=0, status=null]
			}
//			System.out.println(fileList);
			int result = new ReviewService().insertFile(r, fileList);
			
			if(result == fileList.size() + 1) {	// board만 들어갔어도 0보다 크고, attachment만 들어가도 0보다 큼
				response.sendRedirect("list.th");
//				System.out.println("if문");
			} else {
				request.setAttribute("msg", "사진게시판 등록에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
//				System.out.println("else문");
				//실패했을 때 저장된 사진 삭제
				for(int i = 0; i < saveFiles.size(); i++) {
					File failFile = new File(savePath + saveFiles.get(i));
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
