package information.model.vo;

public class Teacher {
	private int boardId;
	private String teacherName;
	private String teacherInfo;
	private String status;
	private String teacherWriter;
	
	public Teacher() {}

	public Teacher(int boardId, String teacherName, String teacherInfo, String status,
			String teacherWriter) {
		super();
		this.boardId = boardId;
		this.teacherName = teacherName;
		this.teacherInfo = teacherInfo;
		this.status = status;
		this.teacherWriter = teacherWriter;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	
	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherInfo() {
		return teacherInfo;
	}

	public void setTeacherInfo(String teacherInfo) {
		this.teacherInfo = teacherInfo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTeacherWriter() {
		return teacherWriter;
	}

	public void setTeacherWriter(String teacherWriter) {
		this.teacherWriter = teacherWriter;
	}

	@Override
	public String toString() {
		return "Teacher [boardId=" + boardId + ", teacherName=" + teacherName
				+ ", teacherInfo=" + teacherInfo + ", status=" + status + ", teacherWriter=" + teacherWriter + "]";
	}

	
	
	
	
}
