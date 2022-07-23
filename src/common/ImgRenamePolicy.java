package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

// 파일명 변환 규약 만든다
public class ImgRenamePolicy implements FileRenamePolicy {

	@Override // ImgRenamePolicy에 빨간줄 떠서 오버라이딩 해줌
	public File rename(File originFile) {
		long currentTime = System.currentTimeMillis(); // 현재시각 받아옴
		int ranNum = (int)(Math.random() * 100000); 	// 랜덤숫자
		
		// 확장자명 갖고와
		String name = originFile.getName();		// 파일이름 갖고옴
		String ext = null;						// 확장자 갖고온다. 가장 마지막에 있는 '.'만 찾으면 돼
		
		int dot = name.lastIndexOf("."); 		// 가장 마지막에 있는 . 에대한 인덱스를 가져와라~
		
		if(dot == -1) {		// 확장자가 없는 파일도 있다!( = .이 아예 없는 파일이 있을 수 있다, 어디에도 .이 없다면)
			ext = "";
		} else { // 뭔가 나타났다? 
			ext = name.substring(dot); 			// 123.PNG라면 .PNG까지 나오게 된다. 
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmssSSS"); 	// 밀리초까지
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext; // util에 있는 Date import.
//											날짜				  랜덤값          확장자

//										   getParent() : 내 상위 경로
		File newFile = new File(originFile.getParent(), fileName);
		// 파일해서 객체 만들어서 ↑  반환함 ↓
		// 그 경로에 fileName(바꿔준 이름)으로 저장까지 된다!
		return newFile;
		
	}
	
}
