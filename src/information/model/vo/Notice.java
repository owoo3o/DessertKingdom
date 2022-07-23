package information.model.vo;

import java.sql.Date;

public class Notice {

	private int boardId;
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private int noticeCount;
	private Date createDate;
	private Date endViewDate;
	private String status;

	public Notice() {}

	public Notice(int boardId, int noticeNo, String noticeTitle, String noticeContent, String noticeWriter,
			int noticeCount, Date createDate, Date endViewDate, String status) {
		super();
		this.boardId = boardId;
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeCount = noticeCount;
		this.createDate = createDate;
		this.endViewDate = endViewDate;
		this.status = status;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getEndViewDate() {
		return endViewDate;
	}

	public void setEndViewDate(Date endViewDate) {
		this.endViewDate = endViewDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [boardId=" + boardId + ", noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeWriter=" + noticeWriter + ", noticeCount=" + noticeCount
				+ ", createDate=" + createDate + ", endViewDate=" + endViewDate + ", status=" + status + "]";
	}

	
}
