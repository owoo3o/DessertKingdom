package oneclass.model.vo;

import java.sql.Date;

public class OneClass {
	private  int boardId;
	private Date createDate;
	private int boardCount;
	private String boardTitle;
	private String boardContent;
	private String  status;
	private String boardWriter;
	private int boardType;
	private Date modifyDate;
	private String memberId;
	private String userName;
	private int classId;
	private String classCategory;
	private Date classDate;
	private String classroom;
	private int teacherKey;
	private String teacherName;
	
	
	public OneClass() {}

	
	public OneClass(int boardId, Date createDate, int boardCount, String boardTitle, String boardContent, String status,
			String boardWriter, Date modifyDate, String memberId, int classId, String classCategory, Date classDate,
			String classroom) {
		super();
		this.boardId = boardId;
		this.createDate = createDate;
		this.boardCount = boardCount;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.status = status;
		this.boardWriter = boardWriter;
		this.modifyDate = modifyDate;
		this.memberId = memberId;
		this.classId = classId;
		this.classCategory = classCategory;
		this.classDate = classDate;
		this.classroom = classroom;
	}


	public OneClass(int boardId, Date createDate, int boardCount, String boardTitle, String boardContent, String status,
			String boardWriter, int boardType, String memberId, String userName, int classId, String classCategory,
			Date classDate, String classroom) {
		super();
		this.boardId = boardId;
		this.createDate = createDate;
		this.boardCount = boardCount;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.status = status;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.memberId = memberId;
		this.userName = userName;
		this.classId = classId;
		this.classCategory = classCategory;
		this.classDate = classDate;
		this.classroom = classroom;
	}


	public OneClass(int boardId, Date createDate, int boardCount, String boardTitle, String boardContent, String status,
			String boardWriter, int boardType, Date modifyDate, String memberId, String userName, int classId,
			String classCategory, Date classDate, String classroom, int teacherKey, String teacherName) {
		super();
		this.boardId = boardId;
		this.createDate = createDate;
		this.boardCount = boardCount;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.status = status;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.modifyDate = modifyDate;
		this.memberId = memberId;
		this.userName = userName;
		this.classId = classId;
		this.classCategory = classCategory;
		this.classDate = classDate;
		this.classroom = classroom;
		this.teacherKey = teacherKey;
		this.teacherName = teacherName;
	}


	public OneClass(int boardId, Date createDate, int boardCount, String boardTitle, String boardContent, String status,
			String boardWriter, int boardType, Date modifyDate, String memberId, String userName, int classId,
			String classCategory, Date classDate, int teacherKey, String teacherName) {
		super();
		this.boardId = boardId;
		this.createDate = createDate;
		this.boardCount = boardCount;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.status = status;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.modifyDate = modifyDate;
		this.memberId = memberId;
		this.userName = userName;
		this.classId = classId;
		this.classCategory = classCategory;
		this.classDate = classDate;
		this.teacherKey = teacherKey;
		this.teacherName = teacherName;
	}


	public OneClass(int boardId, Date createDate, int boardCount, String boardTitle, String boardContent, String status,
			String boardWriter, int boardType, Date modifyDate) {
		super();
		this.boardId = boardId;
		this.createDate = createDate;
		this.boardCount = boardCount;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.status = status;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.modifyDate = modifyDate;
	}



	public OneClass(int boardId, Date createDate, int boardCount, String boardTitle, String boardContent, String status,
			String boardWriter, int boardType, Date modifyDate, String classCategory) {
		super();
		this.boardId = boardId;
		this.createDate = createDate;
		this.boardCount = boardCount;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.status = status;
		this.boardWriter = boardWriter;
		this.boardType = boardType;
		this.modifyDate = modifyDate;
		this.classCategory = classCategory;
	}


	public int getBoardId() {
		return boardId;
	}


	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public int getBoardCount() {
		return boardCount;
	}


	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getBoardWriter() {
		return boardWriter;
	}


	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}


	public int getBoardType() {
		return boardType;
	}


	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getClassId() {
		return classId;
	}


	public void setClassId(int classId) {
		this.classId = classId;
	}


	public String getClassCategory() {
		return classCategory;
	}


	public void setClassCategory(String classCategory) {
		this.classCategory = classCategory;
	}


	public Date getClassDate() {
		return classDate;
	}


	public void setClassDate(Date classDate) {
		this.classDate = classDate;
	}


	public int getTeacherKey() {
		return teacherKey;
	}


	public void setTeacherKey(int teacherKey) {
		this.teacherKey = teacherKey;
	}


	public String getTeacherName() {
		return teacherName;
	}


	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}


	public String getClassroom() {
		return classroom;
	}


	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}


	@Override
	public String toString() {
		return "OneClass [boardId=" + boardId + ", createDate=" + createDate + ", boardCount=" + boardCount
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", status=" + status
				+ ", boardWriter=" + boardWriter + ", boardType=" + boardType + ", modifyDate=" + modifyDate
				+ ", memberId=" + memberId + ", userName=" + userName + ", classId=" + classId + ", classCategory="
				+ classCategory + ", classDate=" + classDate + ", classroom=" + classroom + ", teacherKey=" + teacherKey
				+ ", teacherName=" + teacherName + "]";
	}


	


	
	
}
