package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {
	
	// HttpServletRequestWrapper는 기본생성자가 없으니 자식인 EncryptWrapper가 부모를 상속받을 수 없으므로
	// EncryptWrapper에서 매개변수로 HttpServletRequest를 받아 super(request)호출
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {

		// name 속성 값이 비밀번호와 관련된 정보일 때만 암호화 진행
		String value= null;
		
		// 각 form에서 비밀번호를 받는 name 속성 값
		if(name != null && (name.equals("loginPwd") || name.equals("userPwd") || name.equals("newPwd") || name.equals("pwd1"))) {
			// 암호화 진행 : 암호화만 가능한 알고리즘 SHA-512 : 복호화를 지원하지 않지만 암호화된 값이 고정인 것이 단점
			
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");
				String pwd = super.getParameter(name);
				byte[] bytes = pwd.getBytes(Charset.forName("UTF-8")); // String값을 bytes[]로 변환
				md.update(bytes); // 암호화 진행
				
				value = Base64.getEncoder().encodeToString(md.digest()); // byte[]을 String으로 변환
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} 
			
		} else {
			value = super.getParameter(name);
		}
		
		return value;
		
	}
	
	
	
}
