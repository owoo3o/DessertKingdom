package oneclass.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.ImgRenamePolicy;

import member.model.vo.Member;
import oneclass.model.service.OneClassService;
import oneclass.model.vo.Attachment;
import oneclass.model.vo.OneClass;

/**
 * Servlet implementation class InsertOneClassServlet
 */
@WebServlet("/insert.one")
public class InsertOneClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertOneClassServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// String title = request.getParameter("title");
		// System.out.println(title);// null 뜬다

		if (ServletFileUpload.isMultipartContent(request)) {// 내가 지금 넘어온게 multipart/form-data로 전송했는지 확인
			// MultipartRequest 객체 사용법
			// MultipartRequest multiRequest = new MultipartRequest(HttpServletRequest,
			// 파일저장소 경로, 파일 최대 크기, 인코딩 타입, 파일명 변환 규칙);
			// 파일명 변환규칙에 사용되는 기본 클래스 : DefaultFileRenamePolicy
			// 같은이름의 파일이 존재하면 파일명 뒤에 숫자 붙임( ex) aaa.png, aaa1.png ,aaa2.png)

			int maxSize = 1024 * 1024 * 10; // 10Mbyte
			String root = request.getSession().getServletContext().getRealPath("/"); // WebContent 아래
			String savePath = root + "thumbnail_uploadFiles/";

			File f = new File(savePath);

			if (!f.exists()) {
				f.mkdirs();
			}
			// System.out.println(savePath);//C:\5_Servlet_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp2\wtpwebapps\3_JSPServlet\thumbnail_uploadFiles/
			// 서버껏다키고 서버옵션이라는 부분이 있습니다
			// 서버 모듈위드아웃 퍼블리싱에 체크
			// C:\5_Servlet_workspace\3_JSPServlet\WebContent\thumbnail_uploadFiles/
			// 원하는 위치에 파일이 생겼다 ~!!
			// publishing 컴퓨터가 지가 알아서 경로를 바꿔주는것 퍼블리싱이 // 메타데이터 안에서 컴퓨터가 인식하기 좋은 위치에 만들어주는것을
			// 퍼블리싱이라고해요
			// 재탐색하곤 조금 다르고요 슬래시(/)라고할때 웹컨텐트밑이 맞는데 컴퓨터가 인지하는것은 좀달라요
			// 퍼블리싱 경로자체가 복잡하고 개발자가 지정하는경로가 아니라 개발하는데 어려움을 겪을수있다.
			// 그래서 서버모듈 위드아웃 퍼블리싱에 체크해야 한다.
			// 그래서 앞으로 뭐할때 서버모듈 위드아웃 퍼블리싱에 체크하고 진행하시구용

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new ImgRenamePolicy());
			// cos.jar 라이브러리 필요
			// 임포트 하려해도 임포트가 안된다 왜냐하면 멀티파트 리퀘스트라는건 또다른 jar르 파일 라이브러리가 존재해야합니다.
			// 다운받고 WebContent 에 lib에 cos.jar넣어주면 임포트가 된다 !!!
			// new DefaultFileRenamePolicy() 이거 한 번만 다시 설명해주실 수 있나요? 파일명 변환 규칙중 따로 규칙을 만들지
			// 않겠다 라고하면 걍
			// DefaultFileRenamePolicy() 이 디폴트규약을 쓰겠다 사용하겠다를 쓰면된다 com.oreilly.servlet →
			// cos.jar 라이브러리를 사용하는 것이 구나 알 수 있다.
			// 우리는 우리가 규약을 만들겠다 ~~~

			// 자이제 멀티리퀘스트 만들어씅니깐 이제 ?? 다 가지고 올께용

			String title = multiRequest.getParameter("title");
//		 		System.out.println(title +"title 값");
			String content = multiRequest.getParameter("content");
//		 		System.out.println(content+ "content값");
			String writer = ((Member) request.getSession().getAttribute("loginMember")).getUserId();
//		 		System.out.println(writer +"writerid 값");
			String sDate = multiRequest.getParameter("date");
//		 		System.out.println(sDate+"StringDate값");
			Date date = null;
			if (sDate.equals("")) {
				date = new Date(new GregorianCalendar().getTimeInMillis());
			} else {
				String[] dateArr = sDate.split("-");
				int year = Integer.parseInt(dateArr[0]);// 2022
				int month = Integer.parseInt(dateArr[1]) - 1;// 05
				int day = Integer.parseInt(dateArr[2]);// 03
				// 2022 -05-03 why 2022-06-03 zerobased index //달(Month)만 제로베이스 따라서 달에 -1을 해준다.

				date = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());

			}
			System.out.println(date);
			String classroom = multiRequest.getParameter("classroom");
//		 		System.out.println(classroom +" / classroom옵션");
			String classCategory = multiRequest.getParameter("category");
			System.out.println(classCategory + " / 클래스카테고리 옵션");

			ArrayList<String> saveFiles = new ArrayList<String>(); // 파일의 바뀐 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); // 파일의 원래 이름을 저장할 ArrayList
			// 이제 제일 중요한 사진들 가져오는거

			Enumeration<String> files = multiRequest.getFileNames(); // input type file의 name 값
			// 반환값 Enumaratioin 우리 Enumaratioin 들어봤습니다 어디서 들어봤나요?/
			// 어디서 들어봤나요 맞춰보세요 → 컬렉션의 이터레이터 이터레이터의 구버젼 이터레이터의 업그레이드버젼은 리스트 이터레이터?
			// 이거왜 옛날꺼써? 라고 물어보면 할 말이 없써용 (2008년도꺼라서 ??)
			// System.out.println(files);// 머가나와요?? 주소값이나와요
			// java.util.Hashtable$Enumerator@4c35ff0
			// 해쉬값이 나와요
			// 딱봤을때 이너머레이션의 주소값이 뜰텐데요 이거 우리가 알수가없어요
			// 그래서 이터레이터 했던거처럼 이너레이션도 와일문 돌릴꺼에요

			while (files.hasMoreElements()) {
				// System.out.println(files.nextElement()); // thumbnaleImg1~4가 나옴 th
				String name = files.nextElement();// 전송 순서 역순

				if (multiRequest.getFilesystemName(name) != null) {
//		 					System.out.println(multiRequest.getFilesystemName(name));
//		 					System.out.println(multiRequest.getOriginalFileName(name));

					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			// System.out.println(saveFiles);//[2022050916454461680059.png,
			// 202205091645446137315.png, 2022050916454460946240.png,
			// 2022050916454460643273.png]
			// System.out.println(originFiles);//[애러2.png, 애러1.png, 1.png, 3.png]
			// getFilenames가 역순으로 가져오기때문에 역순으로 뜬다
			// 이제 다뽑아왔으니 데이터에 전달할 일만 남았어요

			OneClass o = new OneClass();
			o.setBoardTitle(title);
			o.setBoardContent(content);
			o.setBoardWriter(writer);
			o.setBoardType(1);
			o.setClassCategory(classCategory);// 카테고리까지 설정합니다.
			o.setClassDate(date);
			o.setClassroom(classroom);
			// 선생님 혹시 카테고리 어떻게 사용한다고 하셨나용
			// 카테고리는 인서트 보드 부분을 고대로 사용할꺼에요
			// 여기다 제가 카테고리포함된 쿼리를 그대로 사용할 거기때문에 임의로 카테고리를 10이라고 넣어준거에요

			// 그다음에 저희가 보드만 집어넣지 한고 첨부파일도 집어 넣을거에요
			// 계속해서 저희가 거꾸로 들어갈것을 기억해 주셔야 하고요
			// 꺼꿀로 들어가있습니다

			ArrayList<Attachment> fileList = new ArrayList<>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				// 파일이 역순으로 저장되어서 저렇게 쓰신건가요? ㅇㅋ 파일이 역순으로 들어가서
				// for문도 역순으로 쓴 겁니다.
				// i-- 아닌가요 그럼 아맞아요 제가 습관적으로 i ++이라고 썻습니다.
				// 선생님 if(i == originFiles.size() -1) 이거 -1 해주는게 0베이스라 해주는건가여? 넵

				Attachment a = new Attachment();
				a.setFilePath(savePath);
				a.setOriginName(originFiles.get(i));
				a.setChangeName(saveFiles.get(i));

				if (i == originFiles.size() - 1) {
					// 오리진파일 사이즈보다 1이 작은거랑 인덱스랑 같아 그럼 그 위치에 있는 이미지는 썸넬이미지
					// 에요 아니면 그냥 내용에 있는 이미지에요 ??
					// 썸네일이죠
					a.setFileLevel(0); // 썸네일이면 0
				} else {
					a.setFileLevel(1); // 썸네일 아니면 1
				}

				fileList.add(a);

			}
			// 그럼 DB로 보내주겠습니다 너무 오래걸려쬬?
			
			  int result = new OneClassService().insertFile(o,fileList);
			  
			  if(result == fileList.size() +2) {//내가담고있는 파일사이즈 + 보드 (2)
			  response.sendRedirect("list.one");
			  
			  }else { request.setAttribute("msg", "원데이 클래스 게시판등록에 실패했습니다.");
			  request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(
			 request, response); for(int i= 0; i< saveFiles.size(); i++) { File failFile =
			  new File(savePath + saveFiles.get(i)); failFile.delete(); } }
			 

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
